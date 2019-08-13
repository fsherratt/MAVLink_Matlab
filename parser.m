% PARSER data parse functions for mavlink byte data
%   This class provides methods for converting mavlink byte data to mavlink
%   message objects.
%
% PARSER Paramaters:
%   MSG_TOTAL - Total messages recieved
%   MSG_ERRORS - Total erroneous messages
%   MSG_UNKNOWN - Total unknwon messages
%
% PARSER Methods:
%   GET_STATS - Get parsing performance metrics
%   BYTE_STREAM - Parse a data stream to mavlink messages.
%   PARSE_MSG - Parse a single message in a byte array

classdef parser
    properties (SetAccess = protected)
        msg_total = 0; % Total messages recieved
        msg_errors = 0; % Total erroneous messages
        msg_unknown = 0; % Total unknwon messages
    end
    
    properties (Access = protected)
        buffer = uint8([]);
    end
    
    methods
        function stats = get_stats( obj )
        % GET_STATS Get parsing performance metrics
        %   [STATS] = GET_STATS( OBJ ) Returns STATS a structure containing
        %   information about parsing performance
        %
        % Example:
        %   parser = mavlink_parse();
        %   stats = parser.get_stats();
        %   fprintf( ['Total Msg: %d\t Msg Errors: %d\t' ...
        %             ['Unknown Msg:%d\n',...
        %
        % SEE ALSO BYTE_STREAM
            stats = struct( 'total', obj.msg_total, ...
                            'errors', obj.msg_errors, ...
                            'unknown', obj.msg_unknown );
        end
        
        function [obj, rtn_msg] = byte_stream( obj, new_data )
        % BYTE_STREAM Parse a byte data stream to mavlink messages.
        %   [OBJ, MSG] = BYTE_STREAM( OBJ, NEW_DATA ) Parse 
        %   NEW_DATA a uint8 byte array into a cell array of MAVLINK_MSG  
        %   objects. Any unused bytes are stored for use in the next call. 
        %   Erroneous messages are discarded.
        %
        % Example:
        %   parser = mavlink_parse();
        %   b = uint8( fread(port, 1000, 'uint8') );
        %   [parser, msg] = parser.parse_stream( b );
        %
        % SEE ALSO PARSE_MSG, MAVLINK_MSG
            rtn_msg = {};
            
            obj.buffer = [ obj.buffer, uint8( new_data ) ];
            
            while true
                [msg, valid, obj.buffer] = obj.parse_msg( obj.buffer );
                
                switch ( valid )
                    case mavlink.MAVLINK_FRAMING_OK
                        rtn_msg{end+1} = msg;
                
                    case mavlink.MAVLINK_FRAMING_BAD_CRC
                        obj.msg_errors = obj.msg_errors + 1;
                    
                    case mavlink.MAVLINK_FRAMING_MSG_UNKNOWN
                        obj.msg_unknown = obj.msg_unknown + 1;
                    
                    case mavlink.MAVLINK_FRAMING_INCOMPLETE
                        return
                end
                
                obj.msg_total = obj.msg_total + 1;
            end
        end
    end
    
    methods (Static)
        function [msg, valid, data] = parse_msg( data )
        % PARSE_MSG parse a single mavlink message
        %   [msg, valid, data] = PARSE_MSG( obj, data ) parse first mavlink
        %   message that is found in DATA. Message is returned in MSG,
        %   VALID contains a framing enum representing the parsing success.
        %   DATA contains any remaing unparsed bytes from input DATA
        %
        % Example:
        %   b = uint8( fread(port, 1000, 'uint8') );
        %   [msg, valid, b] = mavlink_parse_bytes( b )
        %   
        %   if ( valid == mavlink.MAVLINK_FRAMING_OK )
        %       disp msg
        %   end
        %
        % SEE ALSO BYTE_STREAM, MAVLINK_MSG
            msg = [];
            valid = mavlink.MAVLINK_FRAMING_INCOMPLETE;
            
            msg_start = double( find( data == mavlink.START_VAL, 1 ) );
            
            % If msg start found and buffer is long enough continue
            if isempty( msg_start ) ...
                || (length( data ) - msg_start) < mavlink.MIN_PACKET_LENGTH
                return
            end
            
            msg_len = double( data( msg_start + mavlink.LEN_OFFSET ) );
            
            % If buffer is long enough extract full message
            if (length( data ) - msg_start) ...
                < ( msg_len + mavlink.WRAPPER_LEN)
                return
            end
            
            msg_end = msg_start + msg_len + mavlink.WRAPPER_LEN - 1;
            
            msg_bytes = data( msg_start:msg_end );
            data = data( (msg_end + 1):end );
            
            msg_id = msg_bytes( mavlink.MSGID_BYTE );
            msg = mavlink.get_message_type( msg_id );
            
%             disp(msg_id)
            
            if isempty( msg )
                msg = mavlink_msg( msg_id );
                valid = mavlink.MAVLINK_FRAMING_MSG_UNKNOWN;
                return
            end
            
            msg = msg.set_bytes( msg_bytes );

            parse_crc = typecast( msg_bytes( (end-1):end ), 'uint16' );
            [~, calc_crc] = msg.calc_crc();
            
            if isempty( calc_crc ) || calc_crc ~= parse_crc
                valid = mavlink.MAVLINK_FRAMING_BAD_CRC;
                return
            end
            
            msg = msg.split_payload();
            valid = mavlink.MAVLINK_FRAMING_OK;
        end
    end
end

% EOF
