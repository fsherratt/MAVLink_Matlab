classdef mavlink_msg_radio_status < mavlink_msg
    properties (SetAccess = protected)
        prop_rssi     = uint8( zeros(1, 1) );
        prop_remrssi  = uint8( zeros(1, 1) );
        prop_txbuf    = uint8( zeros(1, 1) );
        prop_noise    = uint8( zeros(1, 1) );
        prop_remnoise = uint8( zeros(1, 1) );
        prop_rxerrors = uint16( zeros(1, 1) );
        prop_fixed    = uint16( zeros(1, 1) );
    end
    
    methods
        function obj = mavlink_msg_radio_status()
            len       = uint8( 9 );
            msgid     = uint8( 109 );
            crc_extra = uint8( 185 );
        
            obj = obj@mavlink_msg( msgid, len, crc_extra );
        end
        
        function obj = split_payload( obj )
            obj = split_payload@mavlink_msg( obj );
        
            obj.prop_rxerrors = obj.cast_from_bytes( obj.mav_payload( 1:2 ), 'uint16' ); 
            obj.prop_fixed    = obj.cast_from_bytes( obj.mav_payload( 3:4 ), 'uint16' ); 
            obj.prop_rssi     = obj.cast_from_bytes( obj.mav_payload( 5 ),   'uint8' ); 
            obj.prop_remrssi  = obj.cast_from_bytes( obj.mav_payload( 6 ),   'uint8' ); 
            obj.prop_txbuf    = obj.cast_from_bytes( obj.mav_payload( 7 ),   'uint8' ); 
            obj.prop_noise    = obj.cast_from_bytes( obj.mav_payload( 8 ),   'uint8' ); 
            obj.prop_remnoise = obj.cast_from_bytes( obj.mav_payload( 9 ),   'uint8' ); 
        end
        
        function obj = pack( obj ) 
            obj.mav_payload( 1:2 ) = obj.cast_to_bytes( obj.prop_rxerrors, 1 ); 
            obj.mav_payload( 3:4 ) = obj.cast_to_bytes( obj.prop_fixed,    1 ); 
            obj.mav_payload( 5 )   = obj.cast_to_bytes( obj.prop_rssi,     1 ); 
            obj.mav_payload( 6 )   = obj.cast_to_bytes( obj.prop_remrssi,  1 ); 
            obj.mav_payload( 7 )   = obj.cast_to_bytes( obj.prop_txbuf,    1 ); 
            obj.mav_payload( 8 )   = obj.cast_to_bytes( obj.prop_noise,    1 ); 
            obj.mav_payload( 9 )   = obj.cast_to_bytes( obj.prop_remnoise, 1 ); 
            
            obj = pack@mavlink_msg( obj  );
        end
    
        function obj = set_rssi( obj, val )
            obj.prop_rssi = obj.validate_input( val, 'uint8', 1 );
        end
        
        function val = get_rssi( obj )
            val = obj.prop_rssi;
        end
    
        function obj = set_remrssi( obj, val )
            obj.prop_remrssi = obj.validate_input( val, 'uint8', 1 );
        end
        
        function val = get_remrssi( obj )
            val = obj.prop_remrssi;
        end
    
        function obj = set_txbuf( obj, val )
            obj.prop_txbuf = obj.validate_input( val, 'uint8', 1 );
        end
        
        function val = get_txbuf( obj )
            val = obj.prop_txbuf;
        end
    
        function obj = set_noise( obj, val )
            obj.prop_noise = obj.validate_input( val, 'uint8', 1 );
        end
        
        function val = get_noise( obj )
            val = obj.prop_noise;
        end
    
        function obj = set_remnoise( obj, val )
            obj.prop_remnoise = obj.validate_input( val, 'uint8', 1 );
        end
        
        function val = get_remnoise( obj )
            val = obj.prop_remnoise;
        end
    
        function obj = set_rxerrors( obj, val )
            obj.prop_rxerrors = obj.validate_input( val, 'uint16', 1 );
        end
        
        function val = get_rxerrors( obj )
            val = obj.prop_rxerrors;
        end
    
        function obj = set_fixed( obj, val )
            obj.prop_fixed = obj.validate_input( val, 'uint16', 1 );
        end
        
        function val = get_fixed( obj )
            val = obj.prop_fixed;
        end
    
    end
end
