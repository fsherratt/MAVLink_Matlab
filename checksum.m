classdef checksum
    % CHECKSUM data parse functions for mavlink byte streams
    %
    % CHECKSUM Methods:
    %   CRC_CALCULATE - calculate the X25 checksum for a vector of bytes
    %
    % CHECKSUM Properties:
    %   X25_INIT_CRC - Initial CRC value
    
    properties (Constant)
        X25_INIT_CRC = uint16( hex2dec( 'FFFF' ) )
    end
    
    methods(Static)
        function crc_accum = crc_calculate( bytes )
        % CRC_CALCULATE calculate the X25 checksum for a vector of bytes
        %   CRC_ACCUM = CRC_CALCULATE( BYTES ) creates a completly 
        %   empty message object
        %
        % Example:
        %   MSG = MAVLINK_MSG();
        %
        % SEE ALSO MAVLINK_MSG, PARSER
            crc_accum = checksum.X25_INIT_CRC;
            
            for i = 1:length( bytes )
                crc_accum = checksum.crc_accumulate( bytes(i), crc_accum );
            end
        end
    end
    
    methods (Static, Access = private)
        function crc_accum = crc_accumulate( new_byte, crc_accum )
        % CRC_ACCUMULATE add a new byte to the crc value
        %   CRC_ACCUM = CRC_ACCUMULATE( NEW_BYTE, CRC_ACCUM ) 
        %
        % Example:
        %   CRC_ACCUM = CRC_ACCUMULATE( 254, X25_INIT_CRC );
        %
        % SEE ALSO CRC_CALCULATE
            new_byte = uint8( new_byte );
            crc_accum = uint16( crc_accum );
            
            % tmp = data ^ (uint8_t)( crcAccum & 0xff);
            tmp = uint8( bitand( crc_accum, uint16( 255 ) ) );
            tmp = bitxor( new_byte, tmp );
            
            % tmp ^= (tmp<<4);
            tmp = uint16( bitxor( tmp, bitshift( tmp, 4 ) ) );
            
            % crcAccum = (crcAccum>>8) ^ (tmp<<8) ^ (tmp <<3) ^ (tmp>>4);
            A = bitxor( bitshift( crc_accum, -8 ), bitshift( tmp, 8 ) );
            B = bitxor( bitshift( tmp, 3 ),  bitshift( tmp, -4 ) );
            crc_accum = bitxor( A, B );
        end
    end
end