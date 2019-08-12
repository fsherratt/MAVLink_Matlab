%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% --- Lendo placa por Mavlink --- %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% fclose( s_port );
clear; clc; close all; instrreset;
%% Exemplo a partir daqui

% CHANGE THESE
serial_port_name = 'COM6';
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
    if s_port.BytesAvailable > 500
        b = fread( s_port, s_port.BytesAvailable );
   
        [parse, msg] = parse.byte_stream( b' );
        
%         v = msg{1}.get_heading();
%         fprintf( 'Valor vindo no heading: %.5f\n', v )
        
        for i = 1:length( msg )
%             fprintf( 'Msg (%d) %s\n', msg{i}.get_msgid(), class(msg{i}) );
            if msg{i}.get_msgid() == 1
                
                mensagem = msg{i};
                fprintf('Present:  %.4f\t Enabled: %.4f\n', mensagem.get_onboard_control_sensors_present(), mensagem.get_onboard_control_sensors_enabled())
                fprintf('heath:    %.4f\t load   : %.4f\n', mensagem.get_onboard_control_sensors_health(), mensagem.get_load())
                fprintf('Voltage:  %.4f\t current: %.4f\n', mensagem.get_voltage_battery(), mensagem.get_current_battery())
                fprintf('remaining:%.4f\t rate   : %.4f\n', mensagem.get_battery_remaining(), mensagem.get_drop_rate_comm())
                fprintf('erroscnt1:%.4f \n\n\n', mensagem.get_errors_count1)
            end
        end
        
        stats = parse.get_stats();
%         fprintf( 'Total Msg: %d\t Msg Errors: %d\t Unknown Msg:%d\n',stats.total, stats.errors, stats.unknown );
    end
end

fclose( s_port );
