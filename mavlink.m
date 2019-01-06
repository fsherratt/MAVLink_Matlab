classdef mavlink < ardupilotmega & common
    % MAVLINK overall class for the generated MAVLINK dialect
    %    Contains all enums and helper functions
    %
    % MAVLINK Methods:
    %    GET_MESSAGE_TYPE - Obtain a mavlink message from a msgid.
    %
    % MAVLINK Paramaters:
    %   MAVLINK_FRAMING_INCOMPLETE - Mavlink message not fully recieved
    %   MAVLINK_FRAMING_OK - Mavlink message is good
    %   MAVLINK_FRAMING_BAD_CRC - Checksum indicated erroneous message 
    %
    % AUTO-GENERATED FILE. DO NOT MODIFY.
    
    properties (Constant)
        HEADER_LEN = 6;
        WRAPPER_LEN = 8;
        
        START_BYTE = uint8( 254 );
        LEN_OFFSET = 1;
        SEQ_OFFSET = 2;
        SYSID_OFFSET = 3;
        COMPID_OFFSET = 4;
        MSGID_OFFSET = 5;
        PAYLOAD_OFFSET = 6;
        CRC_BYTES = 2;
        
        LEN_BYTE = 2;
        SEQ_BYTE = 3;
        SYSID_BYTE = 4;
        COMPID_BYTE = 5;
        MSGID_BYTE = 6;
        PAYLOAD_BYTE = 7;
        
        MIN_PACKET_LENGTH = 8;
        
        MAVLINK_FRAMING_INCOMPLETE = 0; % Mavlink msg not fully recieved
        MAVLINK_FRAMING_OK = 1; % Mavlink message is good
        MAVLINK_FRAMING_BAD_CRC = 2; % Checksum indicated erroneous message
        MAVLINK_FRAMING_MSG_UNKNOWN = 3; % Mavlink message not known
    end
    
    methods (Static)
        function msg = get_message_type( msgid )
            % GET_MESSGAGE_TYPE Obtain a mavlink message from a msgid.
            %
            % MSG = GET_MESSGAGE_TYPE( MAVLINK.MAVLINK_MSG_ID_HEARTBEAT ) 
            % returns a empty heartbeat mavlink message object
            %
            % SEE ALSO MAVLINK_MSG, MAVLINK_PARSE
            
            if ismember( msgid, ardupilotmega.ARDUPILOTMEGA_MAVLINK_MESSAGE_IDS )
                msg = get_message_type@ardupilotmega( msgid  );
            elseif ismember( msgid, common.COMMON_MAVLINK_MESSAGE_IDS )
                msg = get_message_type@common( msgid  );
            else
                msg = [];
            end
        end
    end
end

% EOF
