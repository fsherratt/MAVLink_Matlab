% AUTO-GENERATED FILE. DO NOT MODIFY.
classdef mavlink_msg_global_position_int < mavlink_msg
    properties (SetAccess = protected)
        prop_time_boot_ms = uint32( zeros(1, 1 ) );
        prop_lat          = int32( zeros(1, 1 ) );
        prop_lon          = int32( zeros(1, 1 ) );
        prop_alt          = int32( zeros(1, 1 ) );
        prop_relative_alt = int32( zeros(1, 1 ) );
        prop_vx           = int16( zeros(1, 1 ) );
        prop_vy           = int16( zeros(1, 1 ) );
        prop_vz           = int16( zeros(1, 1 ) );
        prop_hdg          = uint16( zeros(1, 1 ) );
    end
    
    methods
        function obj = mavlink_msg_global_position_int()
            len       = uint8( 29 );
            msgid     = uint8( 33 );
            crc_extra = uint8( 220 );
        
            obj = obj@mavlink_msg( msgid, len, crc_extra );
        end
        
        % Separa os bytes de entrada
        function obj = split_payload( obj )
            obj = split_payload@mavlink_msg( obj );
        
            obj.prop_time_boot_ms = obj.cast_from_bytes( obj.mav_payload(  1:4  ), 'uint32' );
            obj.prop_lat          = obj.cast_from_bytes( obj.mav_payload(  5:8  ), 'int32'  );
            obj.prop_lon          = obj.cast_from_bytes( obj.mav_payload(  9:12 ), 'int32'  );
            obj.prop_alt          = obj.cast_from_bytes( obj.mav_payload( 13:16 ), 'int32'  );
            obj.prop_relative_alt = obj.cast_from_bytes( obj.mav_payload( 17:20 ), 'int32'  );
            obj.prop_vx           = obj.cast_from_bytes( obj.mav_payload( 21:22 ), 'int16'  );
            obj.prop_vy           = obj.cast_from_bytes( obj.mav_payload( 23:24 ), 'int16'  );
            obj.prop_vz           = obj.cast_from_bytes( obj.mav_payload( 25:26 ), 'int16'  );
            obj.prop_hdg          = obj.cast_from_bytes( obj.mav_payload( 27:28 ), 'int16'  );
        end
        
        % Empacota em bytes para enviar
        function obj = pack( obj ) 
            obj.mav_payload(  1:4  ) = obj.cast_to_bytes( obj.prop_time_boot_ms ); 
            obj.mav_payload(  5:8  ) = obj.cast_to_bytes( obj.prop_lat ); 
            obj.mav_payload(  9:12 ) = obj.cast_to_bytes( obj.prop_lon ); 
            obj.mav_payload( 13:16 ) = obj.cast_to_bytes( obj.prop_alt ); 
            obj.mav_payload( 17:20 ) = obj.cast_to_bytes( obj.prop_relative_alt ); 
            obj.mav_payload( 21:22 ) = obj.cast_to_bytes( obj.prop_vx );
            obj.mav_payload( 23:24 ) = obj.cast_to_bytes( obj.prop_vy );
            obj.mav_payload( 25:26 ) = obj.cast_to_bytes( obj.prop_vz );
            obj.mav_payload( 27:28 ) = obj.cast_to_bytes( obj.prop_hdg );
            
            obj = pack@mavlink_msg( obj  );
        end
    
        % Gets e sets das propriedades em alto nivel
        function obj = set_prop_time_boot_ms( obj, val )
            obj.prop_time_boot_ms = obj.validate_input( val, 'uint32', 1 );
        end
        
        function val = get_prop_time_boot_ms( obj )
            val = obj.prop_time_boot_ms;
        end
        
        function obj = set_prop_lat( obj, val )
            obj.prop_lat = obj.validate_input( val, 'int32', 1 );
        end
        
        function val = get_prop_lat( obj )
            val = obj.prop_lat;
        end
        
        function obj = set_prop_lon( obj, val )
            obj.prop_lon= obj.validate_input( val, 'int32', 1 );
        end
        
        function val = get_prop_lon( obj )
            val = obj.prop_lon;
        end
        
        function obj = set_prop_alt( obj, val )
            obj.prop_alt = obj.validate_input( val, 'int32', 1 );
        end
        
        function val = get_prop_alt( obj )
            val = obj.prop_alt;
        end
        
        function obj = set_prop_relative_alt( obj, val )
            obj.prop_relative_alt = obj.validate_input( val, 'int32', 1 );
        end
        
        function val = get_prop_relative_alt( obj )
            val = obj.prop_relative_alt;
        end
        
        function obj = set_prop_vx( obj, val )
            obj.prop_vx = obj.validate_input( val, 'int16', 1 );
        end
        
        function val = get_prop_vx( obj )
            val = obj.prop_vx;
        end
        
        function obj = set_prop_vy( obj, val )
            obj.prop_vy = obj.validate_input( val, 'int16', 1 );
        end
        
        function val = get_prop_vy( obj )
            val = obj.prop_vy;
        end
        
        function obj = set_prop_vz( obj, val )
            obj.prop_vz = obj.validate_input( val, 'int16', 1 );
        end
        
        function val = get_prop_vz( obj )
            val = obj.prop_vz;
        end
        
        function obj = set_prop_hdg( obj, val )
            obj.prop_hdg = obj.validate_input( val, 'int16', 1 );
        end
        
        function val = get_prop_hdg( obj )
            val = obj.prop_hdg;
        end
    
    end
end
