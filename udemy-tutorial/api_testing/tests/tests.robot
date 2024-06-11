*** Settings ***
Resource         ../resources/resources.robot
Test Setup       Criar sessao na api
Test Teardown    Encerrar sessao na api


*** Test Cases ***
Caso 01: Criando um novo usuario
    Criar um usuario novo
    Cadastrar um usuario na api    ${TEST_EMAIL}    201
    Conferir se o usuario foi cadastrado na api


Caso 02: Cadastrar um usuario existente
    Criar um usuario novo
    Cadastrar um usuario na api    ${TEST_EMAIL}    201
    Repetir o cadastro do usuário
    Verificar se a api nao permitiu o cadastro repetido


Caso 03: Consultar a existencia de um usuario
    Criar um usuario novo
    Cadastrar um usuario na api    ${TEST_EMAIL}    201
    Consultar os dados do novo usuario    200
    Conferir os dados retornados


Caso 04: Consultar a inexistencia de um usuario
    Consultar um id inexistente    400
    Verificar a mensagem retornada
