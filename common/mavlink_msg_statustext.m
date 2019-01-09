% AUTO-GENERATED FILE. DO NOT MODIFY.
classdef mavlink_msg_statustext < mavlink_msg
    properties (SetAccess = protected)
        prop_severity = uint8( zeros(1, 1) );
        prop_text     = char( zeros(1, 50) );
    end
    
    methods
        function obj = mavlink_msg_statustext()
            len       = uint8( 51 );
            msgid     = uint8( 253 );
            crc_extra = uint8( 83 );
        
            obj = obj@mavlink_msg( msgid, len, crc_extra );
        end
        
        function obj = split_payload( obj )
            obj = split_payload@mavlink_msg( obj );
        
            obj.prop_severity = obj.cast_from_bytes( obj.mav_payload( 1 ),    'uint8' ); 
            obj.prop_text     = obj.cast_from_bytes( obj.mav_payload( 2:51 ), 'char'  ); 
        end
        
        function obj = pack( obj ) 
            obj.mav_payload( 1 )    = obj.cast_to_bytes( obj.prop_severity ); 
            obj.mav_payload( 2:51 ) = obj.cast_to_bytes( obj.prop_text     ); 
            
            obj = pack@mavlink_msg( obj );
        end
    
        function obj = set_severity( obj, val )
            obj.prop_severity = obj.validate_input( val, 'uint8', 1 );
        end
        
        function val = get_severity( obj )
            val = obj.prop_severity;
        end
    
        function obj = set_text( obj, val )
            obj.prop_text = obj.validate_input( val, 'char', 50 );
        end
        
        function val = get_text( obj )
            val = obj.prop_text;
        end
    
    end
end
