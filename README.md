# MAVLink_Matlab
This project aims to produce a native implementation of MAVLink for Matlab. That can be added to the autogeneration script within [MAVlink](https://github.com/mavlink/mavlink).

## Motivation
A large amount of UAV research uses the ArduPilot code base very succesfully. Unlike the rest of the world the academic community is very heavily rooted in Matlab. The abscence of Matlab support from many parts of the ardupilot ecosystem is therefore notable.

## Code Structure
Each message is defined in it's own class inheriting from `mavlink_msg.m`. Each class contains getter/setters methods for each field and functions for parsing/packing message to their byte representation.

Message headers contain all enums for their message set with `Mavlink.h` inheriting from all to allow easy access. Each header also contains a `get_message_type` function for identifying the correct message class from a msg id.

A parse class is provided to converts incoming data stream into a cell array of message objects.

*N.b this was written in 2018b so no gurantees of backwards compatibility*

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

## Todo / Future work
- Unit-tests
- MAVLink 2 support
- Wider support (Backwards compatibility Octave, Simulink)

## Licence
The source code is licenced under GNU General Public License v3.0