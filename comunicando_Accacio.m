%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% --- Lendo placa por Mavlink --- %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% fclose( s_port );
clear; clc; close all; instrreset;

addpath('/home/accacio/MAVLink_Matlab/ardupilotmega')
addpath('/home/accacio/MAVLink_Matlab/common')

%% Exemplo a partir daqui

%% CHANGE THESE
serial_port_name = '/dev/ttyACM0';
serial_baud_rate = 115200;

%% DO NOT CHANGE BELOW THIS POINT
parse = parser();

% Open serial connection
s_port = serial( serial_port_name );
s_port.BaudRate = serial_baud_rate;
s_port.InputBufferSize = 10000;

fopen( s_port );
flushinput( s_port );

t = tic;

%% Run for 30 seconds
while toc(t) < 30 
    if s_port.BytesAvailable > 3000/3
        b = fread( s_port, s_port.BytesAvailable );
   
        [parse, msg] = parse.byte_stream( b' );
        
%         v = msg{1}.get_heading();
%         fprintf( 'Valor vindo no heading: %.5f\n', v )
        
        for i = 1:length( msg )
            fprintf( 'Msg (%d) %s\n', msg{i}.get_msgid(), class(msg{i}) );
            if msg{i}.get_msgid() == 32
                gps = msg{i};
                fprintf('x  :     %.4f\t Rel Alt:   %.4f\n', gps.get_prop_x(), gps.get_prop_y())
                fprintf('Vy  :     %.4f\t Vz     :   %.4f\n', gps.get_prop_vx(), gps.get_prop_vy())
                fprintf('Heading:  %.4f \n\n\n', gps.get_prop_hdg)
            end
        end
        
        stats = parse.get_stats();
        fprintf( 'Total Msg: %d\t Msg Errors: %d\t Unknown Msg:%d\n', ...
                                stats.total, stats.errors, stats.unknown );
    end
end

fclose( s_port );
