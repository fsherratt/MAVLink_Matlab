% AUTO-GENERATED FILE. DO NOT MODIFY.
classdef mavlink_msg_heartbeat < mavlink_msg
    properties (SetAccess = protected)
        prop_type            = uint8( zeros(1, 1) );
        prop_autopilot       = uint8( zeros(1, 1) );
        prop_base_mode       = uint8( zeros(1, 1) );
        prop_custom_mode     = uint32( zeros(1, 1) );
        prop_system_status   = uint8( zeros(1, 1) );
        prop_mavlink_version = uint8( zeros(1, 1) );
    end
    
    methods
        function obj = mavlink_msg_heartbeat()
            len       = uint8( 9 );
            msgid     = uint8( 0 );
            crc_extra = uint8( 50 );
        
            obj = obj@mavlink_msg( msgid, len, crc_extra );
        end
        
        function obj = split_payload( obj )
            obj = split_payload@mavlink_msg( obj );
        
            obj.prop_custom_mode     = obj.cast_from_bytes( obj.mav_payload( 1:4 ), 'uint32' ); 
            obj.prop_type            = obj.cast_from_bytes( obj.mav_payload( 5 ),   'uint8' ); 
            obj.prop_autopilot       = obj.cast_from_bytes( obj.mav_payload( 6 ),   'uint8' ); 
            obj.prop_base_mode       = obj.cast_from_bytes( obj.mav_payload( 7 ),   'uint8' ); 
            obj.prop_system_status   = obj.cast_from_bytes( obj.mav_payload( 8 ),   'uint8' ); 
            obj.prop_mavlink_version = obj.cast_from_bytes( obj.mav_payload( 9 ),   'uint8' ); 
        end
        
        function [obj, bytes] = pack( obj ) 
            obj.mav_payload( 1:4 ) = obj.cast_to_bytes( obj.prop_custom_mode ); 
            obj.mav_payload( 5 )   = obj.cast_to_bytes( obj.prop_type ); 
            obj.mav_payload( 6 )   = obj.cast_to_bytes( obj.prop_autopilot ); 
            obj.mav_payload( 7 )   = obj.cast_to_bytes( obj.prop_base_mode ); 
            obj.mav_payload( 8 )   = obj.cast_to_bytes( obj.prop_system_status ); 
            obj.mav_payload( 9 )   = obj.cast_to_bytes( obj.prop_mavlink_version ); 
            
            [obj, bytes] = pack@mavlink_msg( obj  );
        end
        
        function obj = set_type( obj, val )
            obj.prop_type = obj.validate_input( val, 'uint8', 1 );
        end
        
        function val = get_type( obj )
            val = obj.prop_type;
        end
    
        function obj = set_autopilot( obj, val )
            obj.prop_autopilot = obj.validate_input( val, 'uint8', 1 );
        end
        
        function val = get_autopilot( obj )
            val = obj.prop_autopilot;
        end
    
        function obj = set_base_mode( obj, val )
            obj.prop_base_mode = obj.validate_input( val, 'uint8', 1 );
        end
        
        function val = get_base_mode( obj )
            val = obj.prop_base_mode;
        end
    
        function obj = set_custom_mode( obj, val )
            obj.prop_custom_mode = obj.validate_input( val, 'uint32', 1 );
        end
        
        function val = get_custom_mode( obj )
            val = obj.prop_custom_mode;
        end
    
        function obj = set_system_status( obj, val )
            obj.prop_system_status = obj.validate_input( val, 'uint8', 1 );
        end
        
        function val = get_system_status( obj )
            val = obj.prop_system_status;
        end
    
        function obj = set_mavlink_version( obj, val )
            obj.prop_mavlink_version = obj.validate_input( val, 'uint8', 1 );
        end
        
        function val = get_mavlink_version( obj )
            val = obj.prop_mavlink_version;
        end
    
    end
end
