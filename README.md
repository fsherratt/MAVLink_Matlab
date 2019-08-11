# MAVLink Matlab Library

# NOSSA CONTRIBUICAO DO GRIn

### Para que usar?

Para conversar com a placa do drone usando Matlab atraves do MAVLink. Sendo assim, se a mensagem desejada ainda nao existir, deve ser adicionada.

# Como adicionar uma mensagem?

Aqui ha algumas premissas. No momento, sabemos adicionar mensagens comuns, pertencentes aos dialetos 'common' e 'ardupilotmega', as quais sao maioria. As pastas com esses nomes possuem arquivos com as classes referentes a cada mensagem.

### Comecando novo arquivo

Para uma nova mensagem, a principio siga um exemplo com um novo arquivo dentro da pasta do dialeto correspondente. Va alterando esse arquivo conforme as propriedades que a mensagem possue, seguindo o exemplo de outro arquivo ja existente. Encontre a estrutura da mensagem, o 'msgid' e a descricao de suas variaveis no site https://mavlink.io/en/messages/common.html para o dialeto common.

### Ordenando o recebimento do payload da mensagem

Por mais que na definicao as variaveis estejam organizadas como apresentadas no site anterior, quando a mensagem e transmitida (over the air) a ordem delas se altera segundo seu tipo de variavel (float, int16, uint32, entre outros). A forma de saber como esta a organizacao, junto com quantos bytes cada variavel vai ocupar no payload, se encontra no link https://mavlink.io/en/guide/serialization.html#field_reordering.

Apos reordenar as variaveis e ajustar a funcao de recebimento e envio, anote o tamanho do payload em bytes na propriedade 'len' do obj da classe.

### Ajustar os gets e sets

Devem haver gets e sets para todas as variaveis da mensagem, assim como existe nos exemplos ja existentes.

### Outros arquivos que devem ser alterados

Para o programa ter conhecimento que aquela mensagem com aquele ID vai ser tratada pela nova classe, outros arquivos devem ser alterados, que sao os arquivos de dialeto. Ate agora temos os dialetos nos arquivos 'common.m' e 'ardupilotmega.m'. Podiamos criar outro novo, mas por que ne?

Deve-se adicionar aqui:

1. O novo 'msg_id' no vetor de identidades 'COMMON_MAVLINK_MESSAGE_IDS'
2. Uma nova variavel correspondente a esse 'msg_id' nas propriedades constantes no formato 'MAVLINK_MSG_ID_...', seguindo os exemplos das outras mensagens
3. Um novo case para, caso o msg_id seja correspondente a sua mensagem, tratar com a classe que acabou de ser criada.
Exemplo: 'case common.MAVLINK_MSG_ID_... msg_type = mavlink_msg_....'

### Variavel CRC_EXTRA
Os ultimos dois bytes da mensagem ajudam a calcular o checksum e a certificar da estrutura da mensagem, pois parece que uma mesma mensagem pode ser enviada com organizacoes diferentes para cada versao de mavlink. Sendo assim, essa propriedade certifica que esta tudo certo, e entra numa conta binaria que eu ja verifiquei, e nao compensa buscar o seu valor por calculo, uma vez que o checksum leva em conta quase toda a extensao da mensagem que chegou. 

Resumindo, ate agora consegui achar o valor entre um dos citados por esse colega nesse site:

https://github.com/mavlink/mavlink/issues/30

na tentativa e erro, por fim nao demorou muito, vale a pena. Esse valor deve ser colocado na variavel 'crc_extra' da sua classe para a nova mensagem. Caso a ordem das variaveis e o comprimento do payload esteja correto, esse valor ainda vai jogar a mensagem como reconhecida e com erro no recebimento da mesma durante a leitura.

### Mais informacoes
A serializacao das mensagens comuns esta ilustrada no link

https://mavlink.io/en/guide/serialization.html#v1_packet_format

Varias mensagens sao enviadas e todas elas chegam no Matlab, porem as que nao possuem id ja programado ou descrito nos arquivos de dialeto sao tratadas como desconhecidas. Ja as que existem e ainda estao com problema, sao tratadas como problematicas, e esse e um teste para certificar sobre a sua nova mensagem.

ATENTE PARA tamanho do payload, ordem de recebimento das variaveis e 'crc_extra'.

Para acessar os dados recebidos sao utilizadas as funcoes get da classe a partir do objeto contido na celula correspondente a mensagem que se deseja.



**THIS IS CURRENTLY A WORK IN PROGRESS**

This project aims to produce a native Matlab implementation of MAVLink which can be added to mavgen in [pymavlink](https://github.com/ArduPilot/pymavlink/tree/master/generator). This repository will be used to store an example library to allow an overall structure to be agreed on.

## Motivation
A large amount of UAV research uses the ArduPilot code base. Unlike the rest of the world the academic community is primarly uses Matlab. The abscence of Matlab support for ArduPilots communication language is therefore notable.

## Implementation
The program is intented to be implemented similarly to exsisting librarys through a mixture of static and auto-generated files. The current files and folder structure are described further below.

### Static Files
`mavlink_msg.m` contains all paramaters and methods common to every message types.

`parse.m` provided methods to converts incoming data stream into message objects.

`checksum.m` implementation x25 CRC calculations.

### Auto-Generated Files
A seperate class is created for each message, all inherit from the parent `mavlink_msg.m` class. The class contains getter/setters for each field and methods for parsing/packing messages to their byte representation.

For each message set a  header class, of the set's name, contain all message set enums is produced. The class also contains a `get_message_type` method for obtaining a message object from its msg id.

`mavlink.m` inherits from every message set header providing consistent access to all enums and `get_message_type` method.

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