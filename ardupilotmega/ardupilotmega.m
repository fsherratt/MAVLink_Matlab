classdef ardupilotmega

    properties(Constant)
        ARDUPILOTMEGA_MAVLINK_MESSAGE_IDS =[168, 173];

        MAVLINK_MSG_ID_WIND = 168;
        MAVLINK_MSG_ID_RANGEFINDER = 173;
    end
    
    methods (Static)
        function msg_type = get_message_type( msgid )
            switch (msgid) 
                case ardupilotmega.MAVLINK_MSG_ID_WIND
                    msg_type = mavlink_msg_wind(); 
                case ardupilotmega.MAVLINK_MSG_ID_RANGEFINDER
                    msg_type = mavlink_msg_rangefinder(); 
                otherwise
                    msg_type = [];
            end
        end
    end
end
