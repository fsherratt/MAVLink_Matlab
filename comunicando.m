%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% --- Lendo placa por Mavlink --- %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% fclose( s_port );
clear; clc; close all; instrreset;
%% Exemplo a partir daqui

% CHANGE THESE
serial_port_name = 'COM5';
serial_baud_rate = 115200;

% DO NOT CHANGE BELOW THIS POINT
parse = parser();

% Open serial connection
s_port = serial( serial_port_name );
s_port.BaudRate = serial_baud_rate;
s_port.InputBufferSize = 10000;

fopen( s_port );
flushinput( s_port );

t = tic;

% Run for 30 seconds
while toc(t) < 30 
    if s_port.BytesAvailable > 3000
        b = fread( s_port, s_port.BytesAvailable );
   
        [parse, msg] = parse.byte_stream( b' );
        
%         v = msg{1}.get_heading();
%         fprintf( 'Valor vindo no heading: %.5f\n', v )
        
        for i = 1:length( msg )
%             fprintf( 'Msg (%d) %s\n', msg{i}.get_msgid(), class(msg{i}) );
%             if msg{i}.get_msgid() == common.MAVLINK_MSG_ID_ATTITUDE
%                 gps = msg{i};
%                 fprintf('Latitude: %.4f\t Longitude: %.4f\n', gps.get_prop_lat(), gps.get_prop_lon())
%                 fprintf('Time:     %.4f\t Alt      : %.4f\n', gps.get_prop_time_boot_ms(), gps.get_prop_alt())
%                 fprintf('Vx  :     %.4f\t Rel Alt:   %.4f\n', gps.get_prop_vx(), gps.get_prop_relative_alt())
%                 fprintf('Vy  :     %.4f\t Vz     :   %.4f\n', gps.get_prop_vy(), gps.get_prop_vz())
%                 fprintf('Heading:  %.4f \n\n\n', gps.get_prop_hdg)
%             end
        end
        
        stats = parse.get_stats();
        fprintf( 'Total Msg: %d\t Msg Errors: %d\t Unknown Msg:%d\n', ...
                                stats.total, stats.errors, stats.unknown );
    end
end

fclose( s_port );
