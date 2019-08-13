% LOCAL_POSITION_NED (#32)
% The filtered local position (e.g. fused computer vision and accelerometers). 
% Coordinate frame is right-handed, Z-axis down (aeronautical frame, NED / north-east-down convention)
% AUTO-GENERATED FILE. DO NOT MODIFY.  (ACCACIO 12/08/2019)
classdef mavlink_msg_local_position_ned < mavlink_msg
    properties (SetAccess = protected)
        prop_time_boot_ms = uint32( zeros(1,1 ) );
        prop_x            = single( zeros(1,1 ) );
        prop_y            = single( zeros(1,1 ) );
        prop_z            = single( zeros(1,1 ) );
        prop_vx           = single( zeros(1,1 ) );
        prop_vy           = single( zeros(1,1 ) );
        prop_vz           = single( zeros(1,1 ) );
    end
    
    methods
        function obj = mavlink_msg_local_position_ned()
            len       = uint8( 28 ); % 7 * 4 bytes!
            msgid     = uint8( 32 ); % ver Common Messages - MavLink
            crc_extra = uint8( 185 ); % #define MAVLINK_MESSAGE_CRCS {50, 124, 137, 0, 237, 217, 104, 119, 0, 0, 0, 89, 0, 0, 0, 0, 0, 0, 0, 0, 214, 159, 220, 168, 24, 23, 170, 144, 67, 115, 39, 246, 185, 104, 237, 244, 222, 212, 9, 254, 230, 28, 28, 132, 221, 232, 11, 153, 41, 39, 214, 223, 141, 33, 15, 3, 100, 24, 239, 238, 30, 200, 183, 0, 130, 0, 148, 21, 0, 52, 124, 0, 0, 0, 20, 0, 152, 143, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 231, 183, 63, 54, 0, 0, 0, 0, 0, 0, 0, 175, 102, 158, 208, 56, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 204, 49, 170, 44, 83, 46, 0}#endif
            
            obj = obj@mavlink_msg( msgid, len, crc_extra );
        end
        
        %% Separa os bytes de entrada
        function obj = split_payload( obj )
            obj = split_payload@mavlink_msg( obj );
        
            obj.prop_time_boot_ms = obj.cast_from_bytes( obj.mav_payload(  1:4  ), 'uint32' ); % Testar com todos os crc extra e depois se nao der inverter esse parametro aqui
            obj.prop_x            = obj.cast_from_bytes( obj.mav_payload(  5:8  ), 'single' );
            obj.prop_y            = obj.cast_from_bytes( obj.mav_payload(  9:12 ), 'single' );
            obj.prop_z            = obj.cast_from_bytes( obj.mav_payload( 13:16 ), 'single' );
            obj.prop_vx           = obj.cast_from_bytes( obj.mav_payload( 17:20 ), 'single' );
            obj.prop_vy           = obj.cast_from_bytes( obj.mav_payload( 21:24 ), 'single' );
            obj.prop_vz           = obj.cast_from_bytes( obj.mav_payload( 25:28 ), 'single' );
        end
        
        %% Empacota em bytes para enviar
        function obj = pack( obj ) 
            obj.mav_payload(  1:4  ) = obj.cast_to_bytes( obj.prop_time_boot_ms ); 
            obj.mav_payload(  5:8  ) = obj.cast_to_bytes( obj.prop_x  ); 
            obj.mav_payload(  9:12 ) = obj.cast_to_bytes( obj.prop_y  ); 
            obj.mav_payload( 13:16 ) = obj.cast_to_bytes( obj.prop_z  ); 
            obj.mav_payload( 17:20 ) = obj.cast_to_bytes( obj.prop_vx ); 
            obj.mav_payload( 21:24 ) = obj.cast_to_bytes( obj.prop_vy );            
            obj.mav_payload( 25:28 ) = obj.cast_to_bytes( obj.prop_vz );            
            
            obj = pack@mavlink_msg( obj  );
        end
        
        %% Gets e sets das propriedades em alto nivel
        function obj = set_prop_time_boot_ms( obj, val )
            obj.prop_time_boot_ms = obj.validate_input( val, 'uint32', 1 );
        end
        
        function val = get_prop_time_boot_ms( obj )
            val = obj.prop_time_boot_ms;
        end
        
        function obj = set_prop_x( obj, val )
            obj.prop_x = obj.validate_input( val, 'single', 1 );
        end
        
        function val = get_prop_x( obj )
            val = obj.prop_x;
        end
        
        function obj = set_prop_y( obj, val )
            obj.prop_y= obj.validate_input( val, 'single', 1 );
        end
        
        function val = get_prop_y( obj )
            val = obj.prop_y;
        end
        
        function obj = set_prop_z( obj, val )
            obj.prop_z = obj.validate_input( val, 'single', 1 );
        end
        
        function val = get_prop_z( obj )
            val = obj.prop_z;
        end       
                
        function obj = set_prop_vx( obj, val )
            obj.prop_vx = obj.validate_input( val, 'single', 1 );
        end
        
        function val = get_prop_vx( obj )
            val = obj.prop_vx;
        end
        
        function obj = set_prop_vy( obj, val )
            obj.prop_vy = obj.validate_input( val, 'single', 1 );
        end
        
        function val = get_prop_vy( obj )
            val = obj.prop_vy;
        end
        
        function obj = set_prop_vz( obj, val )
            obj.prop_vz = obj.validate_input( val, 'single', 1 );
        end
        
        function val = get_prop_vz( obj )
            val = obj.prop_vz;
        end
    
    end
end
