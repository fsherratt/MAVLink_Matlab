% AUTO-GENERATED FILE. DO NOT MODIFY.
classdef mavlink_msg_nav_controller_output < mavlink_msg
    properties (SetAccess = protected)
        prop_nav_roll       = single( zeros(1, 1 ) );
        prop_nav_pitch      = single( zeros(1, 1 ) );
        prop_nav_bearing    = int16(  zeros(1, 1 ) );
        prop_target_bearing = int16(  zeros(1, 1 ) );
        prop_wp_dist        = uint16( zeros(1, 1 ) );
        prop_alt_error      = single( zeros(1, 1 ) );
        prop_aspd_error     = single( zeros(1, 1 ) );
        prop_xtrack_error   = single( zeros(1, 1 ) );
    end
    
    methods
        function obj = mavlink_msg_nav_controller_output()
            len       = uint8( 26 );
            msgid     = uint8( 62 );
            crc_extra = uint8( 183 );
        
            obj = obj@mavlink_msg( msgid, len, crc_extra );
        end
        
        % Separa os bytes de entrada
        function obj = split_payload( obj )
            obj = split_payload@mavlink_msg( obj );
        
            obj.prop_nav_roll       = obj.cast_from_bytes( obj.mav_payload(  1:4  ), 'single' );
            obj.prop_nav_pitch      = obj.cast_from_bytes( obj.mav_payload(  5:8  ), 'single' );
            obj.prop_alt_error      = obj.cast_from_bytes( obj.mav_payload(  9:12 ), 'single' );
            obj.prop_aspd_error     = obj.cast_from_bytes( obj.mav_payload( 13:16 ), 'single' );
            obj.prop_xtrack_error   = obj.cast_from_bytes( obj.mav_payload( 17:20 ), 'single' );
            obj.prop_nav_bearing    = obj.cast_from_bytes( obj.mav_payload( 21:22 ), 'int16'  );
            obj.prop_target_bearing = obj.cast_from_bytes( obj.mav_payload( 23:24 ), 'int16'  );            
            obj.prop_wp_dist        = obj.cast_from_bytes( obj.mav_payload( 25:26 ), 'uint16' );
        end
        
        % Empacota em bytes para enviar
        function obj = pack( obj ) 
            obj.mav_payload(  1:4  ) = obj.cast_to_bytes( obj.prop_nav_roll       ); 
            obj.mav_payload(  5:8  ) = obj.cast_to_bytes( obj.prop_nav_pitch      ); 
            obj.mav_payload(  9:12 ) = obj.cast_to_bytes( obj.prop_alt_error      ); 
            obj.mav_payload( 13:16 ) = obj.cast_to_bytes( obj.prop_aspd_error     ); 
            obj.mav_payload( 17:20 ) = obj.cast_to_bytes( obj.prop_xtrack_error   ); 
            obj.mav_payload( 21:22 ) = obj.cast_to_bytes( obj.prop_nav_bearing    );
            obj.mav_payload( 23:24 ) = obj.cast_to_bytes( obj.prop_target_bearing );
            obj.mav_payload( 25:26 ) = obj.cast_to_bytes( obj.prop_wp_dist        );
            
            obj = pack@mavlink_msg( obj );
        end
    
        % Gets e sets das propriedades em alto nivel
        function obj = set_prop_nav_roll( obj, val )
            obj.prop_nav_roll = obj.validate_input( val, 'single', 1 );
        end
        
        function val = get_prop_nav_roll( obj )
            val = obj.prop_nav_roll;
        end
        
        function obj = set_prop_nav_pitch( obj, val )
            obj.prop_nav_pitch = obj.validate_input( val, 'single', 1 );
        end
        
        function val = get_prop_nav_pitch( obj )
            val = obj.prop_nav_pitch;
        end
        
        function obj = set_prop_alt_error( obj, val )
            obj.prop_alt_error = obj.validate_input( val, 'single', 1 );
        end
        
        function val = get_prop_alt_error( obj )
            val = obj.prop_alt_error;
        end
        
        function obj = set_prop_aspd_error( obj, val )
            obj.prop_aspd_error = obj.validate_input( val, 'single', 1 );
        end
        
        function val = get_prop_aspd_error( obj )
            val = obj.prop_aspd_error;
        end
        
        function obj = set_prop_xtrack_error( obj, val )
            obj.prop_xtrack_error = obj.validate_input( val, 'single', 1 );
        end
        
        function val = get_prop_xtrack_error( obj )
            val = obj.prop_xtrack_error;
        end
        
        function obj = set_prop_nav_bearing( obj, val )
            obj.prop_nav_bearing = obj.validate_input( val, 'int16', 1 );
        end
        
        function val = get_prop_nav_bearing( obj )
            val = obj.prop_nav_bearing;
        end
        
        function obj = set_prop_target_bearing( obj, val )
            obj.prop_target_bearing = obj.validate_input( val, 'int16', 1 );
        end
        
        function val = get_prop_target_bearing( obj )
            val = obj.prop_target_bearing;
        end
        
        function obj = set_prop_wp_dist( obj, val )
            obj.prop_wp_dist = obj.validate_input( val, 'uint16', 1 );
        end
        
        function val = get_prop_wp_dist( obj )
            val = obj.prop_wp_dist;
        end
            
    end
end
