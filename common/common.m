% COMMON.m - message set header for the 'common' mavlink set.
% 
% AUTO-GENERATED FILE. DO NOT MODIFY.
classdef common
    properties(Constant)
        % Adicionar aqui IDs de mensagens novas tambem
        COMMON_MAVLINK_MESSAGE_IDS =[0, 1, 20, 21, 22, 30, 32, 62, 74, 109, 253];

        MAVLINK_MSG_ID_HEARTBEAT = 0;
        MAVLINK_MSG_ID_PARAM_REQUEST_READ = 20;
        MAVLINK_MSG_ID_PARAM_REQUEST_LIST = 21;
        MAVLINK_MSG_ID_PARAM_VALUE = 22;
        MAVLINK_MSG_ID_VFR_HUD = 74;
        MAVLINK_MSG_ID_RADIO_STATUS = 109;
        MAVLINK_MSG_ID_STATUSTEXT = 253;
       
        MAV_AUTOPILOT_GENERIC = 0;
        MAV_AUTOPILOT_RESERVED = 1;
        MAV_AUTOPILOT_ARDUPILOTMEGA = 3;
        MAV_AUTOPILOT_INVALID = 8;
       
        MAV_TYPE_GENERIC = 0;
        MAV_TYPE_FIXED_WING = 1;
        MAV_TYPE_QUADROTOR = 2;
        MAV_TYPE_GCS = 6;

        MAV_MODE_PREFLIGHT = 0;
        MAV_MODE_MANUAL_DISARMED = 64;
        MAV_MODE_TEST_DISARMED = 66;
        MAV_MODE_STABILIZE_DISARMED = 80;
        MAV_MODE_GUIDED_DISARMED = 88;
        MAV_MODE_AUTO_DISARMED = 92;
        MAV_MODE_MANUAL_ARMED = 192;
        MAV_MODE_TEST_ARMED = 194;
        MAV_MODE_STABILIZE_ARMED = 208;
        MAV_MODE_GUIDED_ARMED = 216;
        MAV_MODE_AUTO_ARMED = 220;
        
        MAV_PARAM_TYPE_UINT8 = 1;
        MAV_PARAM_TYPE_INT8 = 2;
        MAV_PARAM_TYPE_UINT16 = 3;
        MAV_PARAM_TYPE_INT16 = 4;
        MAV_PARAM_TYPE_UINT32 = 5;
        MAV_PARAM_TYPE_INT32 = 6;
        MAV_PARAM_TYPE_UINT64 = 7;
        MAV_PARAM_TYPE_INT64 = 8;
        MAV_PARAM_TYPE_REAL32 = 9;
        MAV_PARAM_TYPE_REAL64 = 10;
        
        MAV_SEVERITY_EMERGENCY = 0;
        MAV_SEVERITY_ALERT = 1;
        MAV_SEVERITY_CRITICAL = 2;
        MAV_SEVERITY_ERROR = 3;
        MAV_SEVERITY_WARNING = 4;
        MAV_SEVERITY_NOTICE = 5;
        MAV_SEVERITY_INFO = 6;
        MAV_SEVERITY_DEBUG = 7;
        
        % Secao das adicionadas
        MAVLINK_MSG_ID_ATTITUDE              = 30;
        MAVLINK_MSG_ID_GLOBAL_POSITION_INT   = 33;
        MAVLINK_MSG_ID_LOCAL_POSITION_NED    = 32;       
        MAVLINK_MSG_ID_SYS_STATUS            =  1;       
        MAVLINK_MSG_ID_NAV_CONTROLLER_OUTPUT = 62;
        
    end

    methods (Static)
        function msg_type = get_message_type( msgid )
            switch (msgid) 
                case common.MAVLINK_MSG_ID_HEARTBEAT
                    msg_type = mavlink_msg_heartbeat();
                case common.MAVLINK_MSG_ID_PARAM_REQUEST_READ
                    msg_type = mavlink_msg_param_request_read(); 
                case common.MAVLINK_MSG_ID_PARAM_REQUEST_LIST
                    msg_type = mavlink_msg_param_request_list(); 
                case common.MAVLINK_MSG_ID_PARAM_VALUE
                    msg_type = mavlink_msg_param_value();
                case common.MAVLINK_MSG_ID_VFR_HUD
                    msg_type = mavlink_msg_vfr_hud();
                case common.MAVLINK_MSG_ID_RADIO_STATUS
                    msg_type = mavlink_msg_radio_status();
                case common.MAVLINK_MSG_ID_STATUSTEXT
                    msg_type = mavlink_msg_statustext(); 
                % Mensagens adicionadas aqui    
                case common.MAVLINK_MSG_ID_GLOBAL_POSITION_INT
                    msg_type = mavlink_msg_global_position_int(); 
                case common.MAVLINK_MSG_ID_LOCAL_POSITION_NED       % Accacio 12/08/2019
                    msg_type = mavlink_msg_local_position_ned();                     
                case common.MAVLINK_MSG_ID_SYS_STATUS              % Mathaus 12/08/2019
                    msg_type = mavlink_msg_sys_status(); 
                case common.MAVLINK_MSG_ID_ATTITUDE
                    msg_type = mavlink_msg_attitude();
                case common.MAVLINK_MSG_ID_NAV_CONTROLLER_OUTPUT
                    msg_type = mavlink_msg_nav_controller_output();
                otherwise
                    msg_type = [];
            end
        end
    end
end
