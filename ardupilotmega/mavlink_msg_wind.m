% AUTO-GENERATED FILE. DO NOT MODIFY.
classdef mavlink_msg_wind < mavlink_msg
    properties (SetAccess = protected)
        prop_direction = single( zeros(1, 1) ); 
        prop_speed     = single( zeros(1, 1) );
        prop_speed_z   = single( zeros(1, 1) );
    end
    
    methods
        function obj = mavlink_msg_wind()
            len       = uint8( 12 );
            msgid     = uint8( 168 );
            crc_extra = uint8( 1 );
        
            obj = obj@mavlink_msg( msgid, len, crc_extra );
        end
        
        function obj = split_payload( obj )
            obj = split_payload@mavlink_msg( obj );
        
            obj.prop_direction = obj.cast_from_bytes( obj.mav_payload( 1:4 ), 'single' ); 
            obj.prop_speed     = obj.cast_from_bytes( obj.mav_payload( 5:8 ), 'single' ); 
            obj.prop_speed_z   = obj.cast_from_bytes( obj.mav_payload( 9:12 ), 'single' ); 
        end
        
        function obj = pack( obj ) 
            obj.mav_payload( 1:4 )  = obj.cast_to_bytes( obj.prop_direction ); 
            obj.mav_payload( 5:8 )  = obj.cast_to_bytes( obj.prop_speed ); 
            obj.mav_payload( 9:12 ) = obj.cast_to_bytes( obj.prop_speed_z ); 
            
            obj = pack@mavlink_msg( obj  );
        end
    
        function obj = set_direction( obj, val )
            obj.prop_direction = obj.validate_input( val, 'single', 1 );
        end
        
        function val = get_direction( obj )
            val = obj.prop_direction;
        end
    
        function obj = set_speed( obj, val )
            obj.prop_speed = obj.validate_input( val, 'single', 1 );
        end
        
        function val = get_speed( obj )
            val = obj.prop_speed;
        end
    
        function obj = set_speed_z( obj, val )
            obj.prop_speed_z = obj.validate_input( val, 'single', 1 );
        end
        
        function val = get_speed_z( obj )
            val = obj.prop_speed_z;
        end
    
    end
end
