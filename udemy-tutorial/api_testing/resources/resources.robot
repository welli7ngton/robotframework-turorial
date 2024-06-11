*** Settings ***
Library    RequestsLibrary
Library    String
Library    ../../../venv/lib/python3.10/site-packages/robot/libraries/Collections.py


*** Keywords ***
Criar um usuario novo
    [Tags]    post
    ${random_word}    Generate Random String    length=4    chars=[LETTERS]
    ${random_word}    Convert To Lower Case    ${random_word}
    Set Test Variable    ${TEST_EMAIL}        ${random_word}@testmail.com
    Log    ${TEST_EMAIL}


Cadastrar um usuario na api
    [Tags]    post
    [Arguments]    ${EMAIL}    ${STATUS}
    ${body}    Create Dictionary
    ...    nome=Test User
    ...    email=${TEST_EMAIL}
    ...    password=12345678
    ...    administrador=true
    Log    ${body}
    Criar sessao na api
    ${response}    POST On Session
    ...    alias=ApiSession
    ...    url=/usuarios
    ...    json=${body}
    ...    expected_status=${STATUS}
    Log    ${response.json()}
    Set Test Variable    ${RESPONSE}    ${response.json()}

Criar sessao na api
    [Tags]    session    post
    ${headers}    Create Dictionary
    ...    accept=aplication/json
    ...    Conten-Type=aplication/json
    Create Session    alias=ApiSession    url=https://serverest.dev

Conferir se o usuario foi cadastrado na api
    Dictionary Should Contain Item    dictionary=${RESPONSE}    key=message    value=Cadastro realizado com sucesso
    Dictionary Should Contain Key    dictionary=${RESPONSE}
    ...    key=_id

Repetir o cadastro do usuário
    Cadastrar um usuario na api    ${TEST_EMAIL}    400

Verificar se a api nao permitiu o cadastro repetido
    Dictionary Should Contain Item    dictionary=${RESPONSE}
    ...    key=message
    ...    value=Este email já está sendo usado