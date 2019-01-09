% AUTO-GENERATED FILE. DO NOT MODIFY.
classdef mavlink_msg_param_request_read < mavlink_msg
    properties (SetAccess = protected)
        prop_target_system =    uint8( zeros(1, 1) );
        prop_target_component = uint8( zeros(1, 1) );
        prop_param_id =         char( zeros(1, 16) );
        prop_param_index =      int16( zeros(1, 1) );
    end
    
    methods
        function obj = mavlink_msg_param_request_read()
            len       = uint8( 20 );
            msgid     = uint8( 20 );
            crc_extra = uint8( 214 );
        
            obj = obj@mavlink_msg( msgid, len, crc_extra );
        end
        
        function obj = split_payload( obj )
            obj = split_payload@mavlink_msg( obj );
        
            obj.prop_param_index      = obj.cast_from_bytes( obj.mav_payload( 1:2 ),  'int16' ); 
            obj.prop_target_system    = obj.cast_from_bytes( obj.mav_payload( 3 ),    'uint8' ); 
            obj.prop_target_component = obj.cast_from_bytes( obj.mav_payload( 4 ),    'uint8' ); 
            obj.prop_param_id         = obj.cast_from_bytes( obj.mav_payload( 5:20 ), 'char' ); 
        end
        
        function obj = pack( obj ) 
            obj.mav_payload( 1:2 )  = obj.cast_to_bytes( obj.prop_param_index ); 
            obj.mav_payload( 3 )    = obj.cast_to_bytes( obj.prop_target_system ); 
            obj.mav_payload( 4 )    = obj.cast_to_bytes( obj.prop_target_component ); 
            obj.mav_payload( 5:20 ) = obj.cast_to_bytes( obj.prop_param_id ); 
            
            obj = pack@mavlink_msg( obj  );
        end
    
        function obj = set_target_system( obj, val )
            obj.prop_target_system = obj.validate_input( val, 'uint8', 1 );
        end
        
        function val = get_target_system( obj )
            val = obj.prop_target_system;
        end
    
        function obj = set_target_component( obj, val )
            obj.prop_target_component = obj.validate_input( val, 'uint8', 1 );
        end
        
        function val = get_target_component( obj )
            val = obj.prop_target_component;
        end
    
        function obj = set_param_id( obj, val )
            obj.prop_param_id = obj.validate_input( val, 'char', 16 );
        end
        
        function val = get_param_id( obj )
            val = obj.prop_param_id;
        end
    
        function obj = set_param_index( obj, val )
            obj.prop_param_index = obj.validate_input( val, 'int16', 1 );
        end
        
        function val = get_param_index( obj )
            val = obj.prop_param_index;
        end
    end
end
