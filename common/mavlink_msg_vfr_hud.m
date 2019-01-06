classdef mavlink_msg_vfr_hud < mavlink_msg
    properties (SetAccess = protected)
        prop_airspeed    = single( zeros(1, 1 ) );
        prop_groundspeed = single( zeros(1, 1 ) );
        prop_heading     = int16( zeros(1, 1 ) );
        prop_throttle    = uint16( zeros(1, 1 ) );
        prop_alt         = single( zeros(1, 1 ) );
        prop_climb       = single( zeros(1, 1 ) );
    end
    
    methods
        function obj = mavlink_msg_vfr_hud()
            len       = uint8( 20 );
            msgid     = uint8( 74 );
            crc_extra = uint8( 20 );
        
            obj = obj@mavlink_msg( msgid, len, crc_extra );
        end
        
        function obj = split_payload( obj )
            obj = split_payload@mavlink_msg( obj );
        
            obj.prop_airspeed    = obj.cast_from_bytes( obj.mav_payload( 1:4 ),   'single' ); 
            obj.prop_groundspeed = obj.cast_from_bytes( obj.mav_payload( 5:8 ),   'single' ); 
            obj.prop_alt         = obj.cast_from_bytes( obj.mav_payload( 9:12 ),  'single' ); 
            obj.prop_climb       = obj.cast_from_bytes( obj.mav_payload( 13:16 ), 'single' ); 
            obj.prop_heading     = obj.cast_from_bytes( obj.mav_payload( 17:18 ), 'int16' ); 
            obj.prop_throttle    = obj.cast_from_bytes( obj.mav_payload( 19:20 ), 'uint16' ); 
        end
        
        function obj = pack( obj ) 
            obj.mav_payload( 1:4 )   = obj.cast_to_bytes( obj.prop_airspeed ); 
            obj.mav_payload( 5:8 )   = obj.cast_to_bytes( obj.prop_groundspeed ); 
            obj.mav_payload( 9:12 )  = obj.cast_to_bytes( obj.prop_alt ); 
            obj.mav_payload( 13:16 ) = obj.cast_to_bytes( obj.prop_climb ); 
            obj.mav_payload( 17:18 ) = obj.cast_to_bytes( obj.prop_heading ); 
            obj.mav_payload( 19:20 ) = obj.cast_to_bytes( obj.prop_throttle ); 
            
            obj = pack@mavlink_msg( obj  );
        end
    
        function obj = set_airspeed( obj, val )
            obj.prop_airspeed = obj.validate_input( val, 'single', 1 );
        end
        
        function val = get_airspeed( obj )
            val = obj.prop_airspeed;
        end
    
        function obj = set_groundspeed( obj, val )
            obj.prop_groundspeed = obj.validate_input( val, 'single', 1 );
        end
        
        function val = get_groundspeed( obj )
            val = obj.prop_groundspeed;
        end
    
        function obj = set_heading( obj, val )
            obj.prop_heading = obj.validate_input( val, 'int16', 1 );
        end
        
        function val = get_heading( obj )
            val = obj.prop_heading;
        end
    
        function obj = set_throttle( obj, val )
            obj.prop_throttle = obj.validate_input( val, 'uint16', 1 );
        end
        
        function val = get_throttle( obj )
            val = obj.prop_throttle;
        end
    
        function obj = set_alt( obj, val )
            obj.prop_alt = obj.validate_input( val, 'single', 1 );
        end
        
        function val = get_alt( obj )
            val = obj.prop_alt;
        end
    
        function obj = set_climb( obj, val )
            obj.prop_climb = obj.validate_input( val, 'single', 1 );
        end
        
        function val = get_climb( obj )
            val = obj.prop_climb;
        end
    
    end
end
