% AUTO-GENERATED FILE. DO NOT MODIFY.
classdef mavlink_msg_attitude < mavlink_msg
    properties (SetAccess = protected)
        prop_time_boot_ms = uint32( zeros(1, 1 ) );
        prop_roll         = single( zeros(1, 1 ) );
        prop_pitch        = single( zeros(1, 1 ) );
        prop_yaw          = single( zeros(1, 1 ) );
        prop_rollspeed    = single( zeros(1, 1 ) );
        prop_pitchspeed   = single( zeros(1, 1 ) );
        prop_yawspeed     = single( zeros(1, 1 ) );
    end
    
    methods
        function obj = mavlink_msg_attitude()
            len       = uint8( 28 );
            msgid     = uint8( 30 );
            crc_extra = uint8( 39 );
        
            obj = obj@mavlink_msg( msgid, len, crc_extra );
        end
        
        % Separa os bytes de entrada
        function obj = split_payload( obj )
            obj = split_payload@mavlink_msg( obj );
        
            obj.prop_time_boot_ms = obj.cast_from_bytes( obj.mav_payload(  1:4  ), 'uint32' );
            obj.prop_roll         = obj.cast_from_bytes( obj.mav_payload(  5:8  ), 'single' );
            obj.prop_pitch        = obj.cast_from_bytes( obj.mav_payload(  9:12 ), 'single' );
            obj.prop_yaw          = obj.cast_from_bytes( obj.mav_payload( 13:16 ), 'single' );
            obj.prop_rollspeed    = obj.cast_from_bytes( obj.mav_payload( 17:20 ), 'single' );
            obj.prop_pitchspeed   = obj.cast_from_bytes( obj.mav_payload( 21:24 ), 'single' );
            obj.prop_yawspeed     = obj.cast_from_bytes( obj.mav_payload( 25:28 ), 'single' );
        end
        
        % Empacota em bytes para enviar
        function obj = pack( obj ) 
            obj.mav_payload(  1:4  ) = obj.cast_to_bytes( obj.prop_time_boot_ms ); 
            obj.mav_payload(  5:8  ) = obj.cast_to_bytes( obj.prop_roll         ); 
            obj.mav_payload(  9:12 ) = obj.cast_to_bytes( obj.prop_pitch        ); 
            obj.mav_payload( 13:16 ) = obj.cast_to_bytes( obj.prop_yaw          ); 
            obj.mav_payload( 17:20 ) = obj.cast_to_bytes( obj.prop_rollspeed    ); 
            obj.mav_payload( 21:24 ) = obj.cast_to_bytes( obj.prop_pitchspeed   );
            obj.mav_payload( 25:28 ) = obj.cast_to_bytes( obj.prop_yawspeed     );
            
            obj = pack@mavlink_msg( obj );
        end
    
        % Gets e sets das propriedades em alto nivel
        function obj = set_prop_time_boot_ms( obj, val )
            obj.prop_time_boot_ms = obj.validate_input( val, 'uint32', 1 );
        end
        
        function val = get_prop_time_boot_ms( obj )
            val = obj.prop_time_boot_ms;
        end
        
        function obj = set_prop_roll( obj, val )
            obj.prop_roll = obj.validate_input( val, 'single', 1 );
        end
        
        function val = get_prop_roll( obj )
            val = obj.prop_roll;
        end
        
        function obj = set_prop_pitch( obj, val )
            obj.prop_pitch = obj.validate_input( val, 'single', 1 );
        end
        
        function val = get_prop_pitch( obj )
            val = obj.prop_pitch;
        end
        
        function obj = set_prop_yaw( obj, val )
            obj.prop_yaw = obj.validate_input( val, 'single', 1 );
        end
        
        function val = get_prop_yaw( obj )
            val = obj.prop_yaw;
        end
        
        function obj = set_prop_rollspeed( obj, val )
            obj.prop_rollspeed = obj.validate_input( val, 'single', 1 );
        end
        
        function val = get_prop_rollspeed( obj )
            val = obj.prop_rollspeed;
        end
        
        function obj = set_prop_pitchspeed( obj, val )
            obj.prop_pitchspeed = obj.validate_input( val, 'single', 1 );
        end
        
        function val = get_prop_pitchspeed( obj )
            val = obj.prop_pitchspeed;
        end
        
        function obj = set_prop_yawspeed( obj, val )
            obj.prop_yawspeed = obj.validate_input( val, 'single', 1 );
        end
        
        function val = get_prop_yawspeed( obj )
            val = obj.prop_yawspeed;
        end
            
    end
end
