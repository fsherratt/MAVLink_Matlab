# MAVLink Matlab Library

**THIS IS CURRENTLY A WORK IN PROGRESS**

This project aims to produce a native Matlab implementation of MAVLink which can be added to mavgen in [pymavlink](https://github.com/ArduPilot/pymavlink/tree/master/generator).

## Motivation
A large amount of UAV research uses the ArduPilot code base. Unlike the rest of the world the academic community is primarly uses Matlab. The abscence of Matlab support for ArduPilots communication language is therefore notable.

## Implementation
The program is intented to be implemented similarly to exsisting librarys through a mixture of static and auto-generated files. The current files and folder structure are described further below.

### Static Files
`mavlink_msg.h` contains all paramaters and methods common to every message types.

`parse.m` provided methods to converts incoming data stream into message objects.

`xhecksum.m` implementation x25 CRC calculations.

### Auto-Generated Files
A seperate class is created for each message, all inherit from the parent `mavlink_msg.m` class. The class contains getter/setters for each field and methods for parsing/packing messages to their byte representation.

Message headers contain all enums for their message set and a `get_message_type` method for obtaining a message class from its msg id.

`mavlink.h` inheriting from all message set headers, provides access to all enums and and getter for class definitions.

### Folder Structure
Static files are kept at the top level with a folder for each message set. Each message set is formed of a header class and set of message classes. (*) indicates an auto-generated file.

    .
    ├── mavlink.m (*)
    ├── checksum.m
    ├── mavlink_msg.m
    ├── parser.m
    ├── common (*)
    │   ├── common.m (*)
    │   ├── mavlink_msg_???.m (*)
    │   └── ...
    ├── ardupilotmega (*)
    │   ├── ardupilotmega.m (*)
    │   ├── mavlink_msg_???.m (*)
    │   └── ...
    └──...

## Todo / Future work
- Unit-tests
- MAVLink 2 support
- Wider support (Backwards compatibility Octave, Simulink)

## Licence
The source code is licenced under GNU General Public License v3.0

*N.b all source code has been was written in 2018b so no gurantees of backwards compatibility*