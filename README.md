# MAVLink_Matlab
The academic community is very heavily rooted in Matlab it is therefore a very notable abscence from the available support language.

This project aims to produce the overall structure of a Matlab implementation of MAVLink. Once created the intent is to add it to the autogeneration script within [MAVlink](https://github.com/mavlink/mavlink).

## Code Sturcture
Each message is defined in it's own class inheriting from `mavlink_msg.m`. Each class contains getter/setters methods for each field and functions for parsing/packing message to their byte representation.

Message headers contain all enums for their message set with `Mavlink.h` inheriting from all to allow easy access. Each header also contains a `get_message_type` function for identifying the correct message class from a msg id.

A parse function converts an incoming data stream into a cell array of message objects.

## Library Structure
Messages are split into folders by message set defenitions with a header class per set.

    .
    ├── mavlink.m
    ├── checksum.m
    ├── mavlink_msg.m
    ├── parser.m
    ├── common
    │   ├── common.m
    │   ├── mavlink_msg_heartbeat.m
    │   └── ...
    ├── ardupilotmega
    │   ├── ardupilotmega.m
    │   ├── mavlink_msg_rangefinder.m
    │   └── ...
    └──...

## Coding Aims
- Easy of implementation for an auto-generation script.
- Efficiency of implemenation - primarily targeting speed over memory usage althouth both should be considered.

## Future Improvements
- Unit-tests
- Matlab backwards compatibility ( Currently only tested in 2018b )
- Octave support
- Simulink library

## Licence
The source code is licenced under GNU General Public License v3.0