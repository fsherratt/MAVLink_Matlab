% AUTO-GENERATED FILE. DO NOT MODIFY.
classdef mavlink_msg_rangefinder < mavlink_msg
    properties (SetAccess = protected)
        prop_distance = single( zeros(1, 1) );
        prop_voltage  = single( zeros(1, 1) );
    end
    
    methods
        function obj = mavlink_msg_rangefinder()
            len       = uint8( 8 );
            msgid     = uint8( 173 );
            crc_extra = uint8( 83 );
        
            obj = obj@mavlink_msg( msgid, len, crc_extra );
        end
        
        function obj = split_payload( obj )
            obj = split_payload@mavlink_msg( obj );
        
            obj.prop_distance = obj.cast_from_bytes( obj.mav_payload( 1:4 ), 'single' ); 
            obj.prop_voltage  = obj.cast_from_bytes( obj.mav_payload( 5:8 ), 'single' ); 
        end
        
        function obj = pack( obj ) 
            obj.mav_payload( 1:4 ) = obj.cast_to_bytes( obj.prop_distance ); 
            obj.mav_payload( 5:8 ) = obj.cast_to_bytes( obj.prop_voltage ); 
            
            obj = pack@mavlink_msg( obj  );
        end
    
        function obj = set_distance( obj, val )
            obj.prop_distance = obj.validate_input( val, 'single', 1 );
        end
        
        function val = get_distance( obj )
            val = obj.prop_distance;
        end
    
        function obj = set_voltage( obj, val )
            obj.prop_voltage = obj.validate_input( val, 'single', 1 );
        end
        
        function val = get_voltage( obj )
            val = obj.prop_voltage;
        end
    
    end
end
