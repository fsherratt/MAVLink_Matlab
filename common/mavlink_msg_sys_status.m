% AUTO-GENERATED FILE. DO NOT MODIFY.
classdef mavlink_msg_sys_status < mavlink_msg
    properties (SetAccess = protected)
        onboard_control_sensors_present = uint32( zeros(1, 1) );
        onboard_control_sensors_enabled = uint32( zeros(1, 1) );
        onboard_control_sensors_health  = uint32( zeros(1, 1) );
        load = uint16( zeros(1, 1) );
        voltage_battery = uint16( zeros(1, 1) );
        current_battery = int16( zeros(1, 1) );
        battery_remaining = int8( zeros(1, 1) );
        drop_rate_comm = uint16( zeros(1, 1) );
        errors_comm = uint16( zeros(1, 1) );
        errors_count1 = uint16( zeros(1, 1) );
        errors_count2 = uint16( zeros(1, 1) );
        errors_count3 = uint16( zeros(1, 1) );
        errors_count4 = uint16( zeros(1, 1) );
        
    end
    
    methods
        function obj = mavlink_msg_sys_status()
            len       = uint8( 31 );
            msgid     = uint8( 1 );
            crc_extra = uint8( 124 );
        
            obj = obj@mavlink_msg( msgid, len, crc_extra );
        end
        
        function obj = split_payload( obj )
            obj = split_payload@mavlink_msg( obj );
        
            obj.onboard_control_sensors_present = obj.cast_from_bytes( obj.mav_payload(1:4), 'uint32' ); 
            obj.onboard_control_sensors_enabled = obj.cast_from_bytes( obj.mav_payload(5:8), 'uint32'  );
            obj.onboard_control_sensors_health  = obj.cast_from_bytes( obj.mav_payload(9:12),'uint32' ); 
            obj.load                            = obj.cast_from_bytes( obj.mav_payload(13:14),'uint16'  ); 
            obj.voltage_battery                 = obj.cast_from_bytes( obj.mav_payload(15:16),'uint16' ); 
            obj.current_battery                 = obj.cast_from_bytes( obj.mav_payload(17:18),'int16'  ); 
            obj.battery_remaining               = obj.cast_from_bytes( obj.mav_payload(31),     'int8' ); 
            obj.drop_rate_comm                  = obj.cast_from_bytes( obj.mav_payload(19:20),    'uint16' );
            obj.errors_comm                     = obj.cast_from_bytes( obj.mav_payload(21:22),    'uint16' ); 
            obj.errors_count1                   = obj.cast_from_bytes( obj.mav_payload(23:24),    'uint16' ); 
            obj.errors_count2                   = obj.cast_from_bytes( obj.mav_payload(25:26),    'uint16' ); 
            obj.errors_count3                   = obj.cast_from_bytes( obj.mav_payload(27:28),    'uint16' ); 
            obj.errors_count4                   = obj.cast_from_bytes( obj.mav_payload(29:30),    'uint16' ); 
            
        end
               
        function obj = pack( obj ) 
            obj.mav_payload(1:4)   = obj.cast_to_bytes( obj.onboard_control_sensors_present ); 
            obj.mav_payload(5:8)   = obj.cast_to_bytes( obj.onboard_control_sensors_enabled); 
            obj.mav_payload(9:12)  = obj.cast_to_bytes( obj.onboard_control_sensors_health ); 
            obj.mav_payload(13:14) = obj.cast_to_bytes( obj.load); 
            obj.mav_payload(15:16) = obj.cast_to_bytes( obj.voltage_battery ); 
            obj.mav_payload(17:18) = obj.cast_to_bytes( obj.current_battery); 
            obj.mav_payload(31)    = obj.cast_to_bytes( obj.battery_remaining ); 
            obj.mav_payload(19:20) = obj.cast_to_bytes( obj.drop_rate_comm); 
            obj.mav_payload(21:22) = obj.cast_to_bytes( obj.errors_comm ); 
            obj.mav_payload(23:24) = obj.cast_to_bytes( obj.errors_count1); 
            obj.mav_payload(25:26) = obj.cast_to_bytes( obj.errors_count2); 
            obj.mav_payload(27:28) = obj.cast_to_bytes( obj.errors_count3); 
            obj.mav_payload(29:30) = obj.cast_to_bytes( obj.errors_count4); 
            
            obj = pack@mavlink_msg( obj );
        end
    
        function obj = set_onboard_control_sensors_present( obj, val )
            obj.onboard_control_sensors_present = obj.validate_input( val, 'uint32', 1 );
        end
        function val = get_onboard_control_sensors_present( obj )
            val = obj.onboard_control_sensors_present;
        end
        
        function obj = set_onboard_control_sensors_enabled( obj, val )
            obj.onboard_control_sensors_enabled = obj.validate_input( val, 'uint32', 1 );
        end
        function val = get_onboard_control_sensors_enabled( obj )
            val = obj.onboard_control_sensors_enabled;
        end
        
        function obj = set_onboard_control_sensors_health( obj, val )
            obj.onboard_control_sensors_health = obj.validate_input( val, 'uint32', 1 );
        end
        function val = get_onboard_control_sensors_health( obj )
            val = obj.onboard_control_sensors_health;
        end
        
        function obj = set_load( obj, val )
            obj.load = obj.validate_input( val, 'uint16', 1 );
        end
        function val = get_load( obj )
            val = obj.load;
        end
        
        %         voltage_battery  'uint16'
        function obj = set_voltage_battery( obj, val )
            obj.voltage_battery = obj.validate_input( val, 'uint16', 1 );
        end
        function val = get_voltage_battery( obj )
            val = obj.voltage_battery;
        end

%         current_battery  'int16'
        function obj = set_current_battery( obj, val )
            obj.current_battery = obj.validate_input( val, 'int16', 1 );
        end
        function val = get_current_battery( obj )
            val = obj.current_battery;
        end
%         battery_remaining 'int8'
        function obj = set_battery_remaining( obj, val )
            obj.battery_remaining = obj.validate_input( val, 'uint8', 1 );
        end
        function val = get_battery_remaining( obj )
            val = obj.battery_remaining;
        end
%         drop_rate_comm     'uint16'
        function obj = set_drop_rate_comm( obj, val )
            obj.drop_rate_comm = obj.validate_input( val, 'uint16', 1 );
        end
        function val = get_drop_rate_comm( obj )
            val = obj.drop_rate_comm;
        end

%         errors_comm     'uint16'
        function obj = set_errors_comm( obj, val )
            obj.errors_comm = obj.validate_input( val, 'uint16', 1 );
        end
        function val = get_errors_comm( obj )
            val = obj.errors_comm;
        end
%         errors_count1     'uint16'
        function obj = set_errors_count1( obj, val )
            obj.errors_count1 = obj.validate_input( val, 'uint16', 1 );
        end
        function val = get_errors_count1( obj )
            val = obj.errors_count1;
        end
%         errors_count2     'uint16'
        function obj = set_errors_count2( obj, val )
            obj.errors_count2 = obj.validate_input( val, 'uint16', 1 );
        end
        function val = get_errors_count2( obj )
            val = obj.errors_count2;
        end
%         errors_count3     'uint16'
        function obj = set_errors_count3( obj, val )
            obj.errors_count3 = obj.validate_input( val, 'uint16', 1 );
        end
        function val = get_errors_count3( obj )
            val = obj.errors_count3;
        end
%         errors_count4             'uint16'
        function obj = set_errors_count4( obj, val )
            obj.errors_count4 = obj.validate_input( val, 'uint16', 1 );
        end
        function val = get_errors_count4( obj )
            val = obj.errors_count4;
        end
        
        
    end
end
