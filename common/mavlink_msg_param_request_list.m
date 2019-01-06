classdef mavlink_msg_param_request_list < mavlink_msg
    properties (SetAccess = protected)
        prop_target_system    = uint8( zeros(1, 1) );
        prop_target_component = uint8( zeros(1, 1) );
    end
    
    methods
        function obj = mavlink_msg_param_request_list()
            len       = uint8( 2 );
            msgid     = uint8( 21 );
            crc_extra = uint8( 159 );
        
            obj = obj@mavlink_msg( msgid, len, crc_extra );
        end
        
        function obj = split_payload( obj )
            obj = split_payload@mavlink_msg( obj );
        
            obj.prop_target_system    = obj.cast_from_bytes( obj.mav_payload( 1 ), 'uint8' ); 
            obj.prop_target_component = obj.cast_from_bytes( obj.mav_payload( 2 ), 'uint8' ); 
        end
        
        function obj = pack( obj ) 
            obj.mav_payload( 1 ) = obj.cast_to_bytes( obj.prop_target_system ); 
            obj.mav_payload( 2 ) = obj.cast_to_bytes( obj.prop_target_component ); 
            
            obj = pack@mavlink_msg( obj );
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
    
    end
end
