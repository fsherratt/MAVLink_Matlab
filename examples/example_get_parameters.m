% Example: Request and store paramaters from an autopilot
%   This script sends a PARAM_REQUEST_LIST message to the specfied
%   autopilot then listens and stores the returned paramaters.

% CHANGE THESE
serial_port_name = 'COM1';
serual_baud_rate = '57600';

AP_sysid = 1; % Target device sysid
AP_compid = 1;

% DO NOT CHANGE BELOW THIS POINT
parse = parser();

% Open Serial Port
s_port = serial( serial_port_name );
s_port.BaudRate = serual_baud_rate;
s_port.InputBufferSize = 10000;

fopen( s_port );
flushinput( s_port );

% Main Code
[parameters, parse] = get_parameters(s_port, parse, AP_sysid, AP_compid);
parse.get_stats()

% Finish up
fclose( s_port );

clear AP_sysid AP_compid s_port

% END OF SCRIPT


function [parameters, parse] = get_parameters( serial_port, parse, ...
                                                            sysid, compid )
    STATE_INITIALISE    = 0;
    STATE_LISTEN        = 1;
    STATE_RECIEVED_ALL  = 2;
    STATE_ALL_DONE      = 3;

    state = STATE_INITIALISE;
    
    param_tic = 0;
    parameters = struct( 'id', nan, 'name', blanks(16), 'value', nan, ...
                                                             'type', nan );

    while state ~= STATE_ALL_DONE

        % Process any incoming serial data
        if serial_port.BytesAvailable > 0
            b = fread( serial_port, serial_port.BytesAvailable );
            [parse, msg_all] = parse.byte_stream( b' );

            for i = 1:length( msg_all )
                msg = msg_all{i};

                switch ( msg.get_msgid() )
                    case mavlink.MAVLINK_MSG_ID_PARAM_VALUE
                        id = double( msg.get_param_index() );
                        total_params = double( msg.get_param_count() );

                        if id + 1 == total_params
                            state = STATE_RECIEVED_ALL;
                        elseif id >= total_params
                            continue
                        end

                        name =  char( msg.get_param_id() );
                        value = msg.get_param_value();
                        type = msg.get_param_type();

                        fprintf( 'Param %d of %d - %s\n', id + 1, ...
                                                      total_params, name );       

                        parameters( id + 1 ) = struct( 'id', id, ...
                              'name', name, 'value', value, 'type', type );
                        param_tic = tic;
                end
            end
        end

        % State machine
        switch ( state )
            % Request all parameters
            case STATE_INITIALISE
                request_msg = mavlink_msg_param_request_list();
                request_msg = request_msg.set_target_system( sysid );
                request_msg = request_msg.set_target_component( compid );

                request_msg = request_msg.pack();
                fwrite( serial_port, request_msg.get_bytes(), 'uint8' );

                param_tic = tic;
                state = STATE_LISTEN;

                % Wait for parameters to arrive or a 10s timeout
            case STATE_LISTEN
                if toc( param_tic ) > 10
                    fprintf('Time Out');
                    state = STATE_ALL_DONE;
                end

                % Finish up
            case STATE_RECIEVED_ALL
                fprintf('All parameters found\n' );
                state = STATE_ALL_DONE;

            otherwise
                state = STATE_ALL_DONE;
        end
    end
end

% EOF
