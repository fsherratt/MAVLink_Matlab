% Example: Live MAVLink serial message decoding
%   This script connects to a serial communication port and process 
%   incoming serial data for 30 seconds, then disconnects

% CHANGE THESE
serial_port_name = 'COM1';
serual_baud_rate = '57600';

% DO NOT CHANGE BELOW THIS POINT
parse = parser();

% Open serial connection
s_port = serial( serial_port_name );
s_port.BaudRate = serual_baud_rate;
s_port.InputBufferSize = 10000;

fopen( s_port );
flushinput( s_port );

t = tic;

% Run for 30 seconds
while toc(t) < 30 
    if s_port.BytesAvailable > 1000
        b = fread( s_port, s_port.BytesAvailable );
        
        % Add random errors to the data
%         ix = randi( length(b), 10, 1 );
%         b(ix) = b(ix) + randi(255, 10, 1);
   
        [parse, msg] = parse.byte_stream( b' );
        
        for i = 1:length( msg )
            fprintf( 'Msg (%d) %s\n', msg{i}.get_msgid(), class(msg{i}) );
        end
        
        stats = parse.get_stats();
        fprintf( 'Total Msg: %d\t Msg Errors: %d\t Unknown Msg:%d\n', ...
                                stats.total, stats.errors, stats.unknown );
    end
end

fclose( s_port );

clear serialPortName serialPort t b msg i ix

% EOF
