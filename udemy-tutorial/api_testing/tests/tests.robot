*** Settings ***
Resource    ../resources/resources.robot


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