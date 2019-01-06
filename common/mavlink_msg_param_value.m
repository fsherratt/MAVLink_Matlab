classdef mavlink_msg_param_value < mavlink_msg
    properties (SetAccess = protected)
        prop_param_id    = char( zeros(1, 16) );
        prop_param_value = single( zeros(1, 1) );
        prop_param_type  = uint8( zeros(1, 1) );
        prop_param_count = uint16( zeros(1, 1) );
        prop_param_index = uint16( zeros(1, 1) );
    end
    
    methods
        function obj = mavlink_msg_param_value()
            len       = uint8( 25 );
            msgid     = uint8( 22 );
            crc_extra = uint8( 220 );
        
            obj = obj@mavlink_msg( msgid, len, crc_extra );
        end
        
        function obj = split_payload( obj )
            obj = split_payload@mavlink_msg( obj );
            
            obj.prop_param_value = obj.cast_from_bytes( obj.mav_payload( 1:4 ),  'single' ); 
            obj.prop_param_count = obj.cast_from_bytes( obj.mav_payload( 5:6 ),  'uint16' ); 
            obj.prop_param_index = obj.cast_from_bytes( obj.mav_payload( 7:8 ),  'uint16' ); 
            obj.prop_param_id    = obj.cast_from_bytes( obj.mav_payload( 9:24 ), 'char' ); 
            obj.prop_param_type  = obj.cast_from_bytes( obj.mav_payload( 25 ),   'uint8' ); 
        end
        
        function obj = pack( obj ) 
            obj.mav_payload( 1:4 )  = obj.cast_to_bytes( obj.prop_param_value ); 
            obj.mav_payload( 5:6 )  = obj.cast_to_bytes( obj.prop_param_count ); 
            obj.mav_payload( 7:8 )  = obj.cast_to_bytes( obj.prop_param_index ); 
            obj.mav_payload( 9:24 ) = obj.cast_to_bytes( obj.prop_param_id ); 
            obj.mav_payload( 25 )   = obj.cast_to_bytes( obj.prop_param_type ); 
            
            obj = pack@mavlink_msg( obj  );
        end
    
        function obj = set_param_id( obj, val )
            obj.prop_param_id = obj.validate_input( val, 'char', 16 );
        end
        
        function val = get_param_id( obj )
            val = obj.prop_param_id;
        end
    
        function obj = set_param_value( obj, val )
            obj.prop_param_value =obj.validate_input( val, 'single', 1 );
        end
        
        function val = get_param_value( obj )
            val = obj.prop_param_value;
        end
    
        function obj = set_param_type( obj, val )
            obj.prop_param_type = obj.validate_input( val, 'uint8', 1 );
        end
        
        function val = get_param_type( obj )
            val = obj.prop_param_type;
        end
    
        function obj = set_param_count( obj, val )
            obj.prop_param_count = obj.validate_input( val, 'uint16', 1 );
        end
        
        function val = get_param_count( obj )
            val = obj.prop_param_count;
        end
    
        function obj = set_param_index( obj, val )
            obj.prop_param_index = obj.validate_input( val, 'uint16', 1 );
        end
        
        function val = get_param_index( obj )
            val = obj.prop_param_index;
        end
    
    end
end
