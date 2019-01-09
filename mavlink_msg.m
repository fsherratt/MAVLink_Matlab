% MAVLINK_MSG parent class for all mavlink messages. 
%   This class contains paramaters and methods common to all mavlink 
%   messages. 
%
% MAVLINK_MSG Methods:
%   MAVLINK_MSG - Constructor for a generic MAVLINK_MSG object
%   PACK - Convert mavlink object into a byte array 
%   CALC_CRC - Calculate the checksum for the message
%   SET_BYTES - Setter for byte field of object
%   SPLIT_PAYLOAD - Split message bytes out
%   CAST_FROM_BYTES - convert from uint8 to any data type
%   CAST_TO_BYTES - convert any data type to uint8
%   VALIDATE_INPUT - validate input matches type and len specified
%
% MAVLINK_MSG Properties:
%   MAV_BYTES - Raw bytes of message
%   MAV_LEN - Payload length (immutable)
%   MAV_SEQ - Sequence number
%   MAV_SYSID - System ID
%   MAV_COMPID - Component ID
%   MAV_MSGID - Message ID (immutable)
%   MAV_PAYLOAD - Raw payload bytes
%   MAV_CRC - Checksum value
%   MAV_CRC_EXTRA - CRC Extra value (immutable)
    
classdef mavlink_msg 
    properties (SetAccess = protected)
        mav_bytes  = uint8([]); % Raw bytes of message
        
        mav_seq    = uint8(0); % Sequence number
        mav_sysid  = uint8(0); % System ID
        mav_compid = uint8(0); % Component ID
        
        mav_payload = uint8([]); % Raw payload bytes
        
        mav_crc     = uint16(0); % Checksum value
    end
    
    properties (SetAccess = immutable)
        mav_len       = uint8(0); % Payload length
        mav_msgid     = uint8(0); % Message ID
        mav_crc_extra = uint8(0); % CRC Extra value
    end
    
    methods
        function obj = mavlink_msg( msgid, len, crc_extra )
        % MAVLINK_MSG Constructor for a generic MAVLINK_MSG object
        %   OBJ = MAVLINK_MSG() creates a completly empty message object
        %
        %   OBJ = MAVLINK_MSG( LEN, MSGID, CRC_EXTRA ) create a message 
        %   object populating the immutable msg fields.
        %
        % Example:
        %   MSG = MAVLINK_MSG();
            if exist( 'len', 'var' )
                obj.mav_len = uint8( len );
            end
            
            if exist( 'msgid', 'var' ) 
                obj.mav_msgid = uint8( msgid );
            end
            
            if exist( 'crc_extra', 'var' )
                obj.mav_crc_extra = uint8( crc_extra );
            end
        end
        
        function [obj, bytes] = pack( obj )
        % PACK Convert mavlink object into a byte array 
        %   [OBJ, BYTES] = PACK( OBJ ) Pack mavlink object into a byte array for 
        %   transmission. The packed message is returned in BYTES.
        %
        % Example:
        %   msg = mavlink_msg();
        %   [~, bytes] = mavlink_msg.pack();
        %
        % SEE ALSO SET_BYTES, CALC_CRC
            bytes = zeros( 1, obj.mav_len + 8 );
            bytes( 1:6 ) = [ mavlink.START_VAL, obj.mav_len, ...
                             obj.mav_seq, obj.mav_sysid, ...
                             obj.mav_compid, obj.mav_msgid ];
            
            bytes( 7:(7+obj.mav_len-1) ) = obj.mav_payload;
            obj = obj.set_bytes( [bytes, 0, 0] );
            
            [obj, crc] = obj.calc_crc;
            bytes( end-1:end ) = typecast( crc, 'uint8' );
            
            obj = obj.set_bytes( bytes );
        end
        
        function [obj, crc] = calc_crc( obj )
        % CALC_CRC Calculate the checksum for the message
        %   [OBJ, CRC] = CALC_CRC( OBJ ) calculates the X25 checksum from
        %   the contents of MAV_BYTES. If the content of MAV_BYTES is
        %   invalid a empty matrix is returned.
        %
        % Example:
        %   msg = mavlink_msg();
        %   msg = msg.pack();
        %   [~, crc] = msg.calc_crc();
        %
        % SEE ALSO PACK, SET_BYTES
            crc = [];
            
            if ~obj.validate_msg_bytes()
                return;
            end
            
            crc_vec = mavlink.LEN_BYTE:(obj.mav_len + mavlink.HEADER_LEN);
            crc = checksum.crc_calculate( [ obj.mav_bytes( crc_vec ), ...
                                            obj.mav_crc_extra ] );
            obj.mav_crc = crc;
        end
        
        function val = get_bytes( obj )
            val = obj.mav_bytes;
        end
        
        function obj = set_bytes( obj, bytes )
        % SET_BYTES set the contect of the MAV_BYTES property
        %   OBJ = SET_BYTES( OBJ, BYTES ) returns an updated OBJ with
        %   MAV_BYTES containg the content of BYTES stored as UINT8. No 
        %   validation is applied to BYTES.
        %
        % Example:
        %    msg = mavlink_msg();
        %    msg = msg.set_bytes( [254, 0, 0, ...] )
        %
        % SEE ALSO MAV_BYTES, SPLIT_PAYLOAD, CALC_CRC, PACK
            obj.mav_bytes = uint8( bytes );
        end
        
        function obj = split_payload( obj )
        % SPLIT_PAYLOAD Split msg bytes into their individual parts
        %   OBJ = SPLIT_PAYLOAD( OBJ ) the content of MAV_BYTES is
        %   seperated into individual paramaters for the wrapper items.
        %   Message specific spliting occurs in child classes.
        %
        % Example:
        %   OBJ = SPLIT_PAYLOAD( OBJ );
        %   OBJ.mav_msgid;
        %
        % SEE ALSO SET_BYTES, CALC_CRC
            if ~obj.validate_msg_bytes()
                return;
            end
            
            obj.mav_seq = obj.mav_bytes( mavlink.SEQ_BYTE );
            obj.mav_sysid = obj.mav_bytes( mavlink.SYSID_BYTE );
            obj.mav_compid = obj.mav_bytes( mavlink.COMPID_BYTE );
            
            obj.mav_payload = obj.mav_bytes( mavlink.PAYLOAD_BYTE: ...
                                  (mavlink.PAYLOAD_OFFSET + obj.mav_len) );
            
            obj.mav_crc = typecast( obj.mav_bytes(end-1:end), 'uint16' );
        end

        function val = get_msgid( obj )
            val = obj.mav_msgid;
        end
        
        function obj = set_msgid( obj, val )
            obj.mav_msgid = obj.validate_input( val, 'uint8', 1 );
        end
        
        function val = get_len( obj )
            val = obj.mav_len;
        end
        
        function obj = set_len( obj, val )
             obj.mav_len = obj.validate_input( val, 'uint8', 1 );
        end
        
        function val = get_seq( obj )
            val = obj.mav_seq;
        end
        
        function obj = set_seq( obj, val )
            obj.mav_seq = obj.validate_input( val, 'uint8', 1 );
        end
        
        function val = get_sysid( obj )
            val = obj.mav_sysid;
        end
        
        function obj = set_sysid( obj, val )
            obj.mav_sysid = obj.validate_input( val, 'uint8', 1 );
        end
        
        function val = get_compid( obj )
            val = obj.mav_compid;
        end
        
        function obj = set_compid( obj, val )
            obj.mav_compid = obj.validate_input( val, 'uint8', 1 );
        end

        function result = validate_msg_bytes( obj )
        % CHECK_MSG_BYTES Check that the message bytes are valid
        %   RESULT = VALIDATE_MSG_BYTES( OBJ ) RESULT is true if the
        %   paramater mav_bytes contains the correct number of bytes for
        %   the message. Otherwise false is returned.
        %
        % Example:
        %   if ~obj.validate_msg_bytes()
        %       return
        %   end
        %
        % SEE ALSO SET_BYTES, CALC_CRC
            if length( obj.mav_bytes ) < (mavlink.HEADER_LEN + obj.mav_len)
                result = false;
            else
                result = true;
            end
        end
    end
    
    methods (Static)
        function out = cast_from_bytes( in, type )
        % CAST_FROM_BYTES convert from uint8 to any data type
        %   OUT = CAST_FROM_BYTES( IN, TYPE ) Convert from uint8 to any  
        %   data type, including char, wihtout changing any bytes.
        %
        % Example:
        %   >> out = mavlink_msg.cast_from_bytes( uint8([72 105]), 'char' )
        %   out = 
        %       'Hi'
        %
        % SEE ALSO
            if strcmp( type, 'char' )
                out = char( in );
            else
                out = typecast( in, type );
            end
        end
        
        function out = cast_to_bytes( in )
        % CAST_TO_BYTES convert any data type to uint8
        %   OUT = CAST_TO_BYTES( IN ) Convert any data type, including
        %   char, to it's equivalet uint8 representation wihtout changing 
        %   any bytes.
        %
        % Example:
        %   >> out = mavlink_msg.cast_to_bytes( 'Hello, World' )
        %   out = 
        %       1×12 uint8 row vector
        %       72 101 108 108 111 44 32 87 111 114 108 100 33
        %
        % SEE ALSO
            if ischar( in )
                out = uint8( in );
            else
                out = typecast( in, 'uint8' );
            end
        end
        
        function out = validate_input( in, type, len )
        % VALIDATE_INPUT validate input matches type and len specified
        %   OUT = VALIDATE_INPUT( IN, TYPE, LEN )
        %
        % Example:
        %   >> out = mavlink_msg.validate( 'Help', 'char', 6 )
        %   out =
        %       'Help  '
        %
        % SEE ALSO
            out = cast( in, type );
            
            if length( out ) < len
                out(len) = 0;
            elseif length( out ) > len
                out = out(1:len);
            end
        end
    end
end

% EOF
