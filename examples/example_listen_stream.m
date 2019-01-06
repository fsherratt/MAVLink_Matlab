parse = parser();

% Open serial connection
serialPortName = '/dev/tty.usbmodem01';

serialPort                 = serial( serialPortName );
serialPort.BaudRate        = 57600;
serialPort.InputBufferSize = 10000;

fopen( serialPort );
flushinput( serialPort );

t = tic;

% Run for 30 seconds
while toc(t) < 30 
    if serialPort.BytesAvailable > 1000
        b = fread( serialPort, serialPort.BytesAvailable );
        
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

fclose( serialPort );

clear serialPortName serialPort t b msg i ix

% EOF
