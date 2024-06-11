*** Settings ***
Library    RequestsLibrary
Library    String
Library    Collections


*** Keywords ***
Criar sessao na api
    [Tags]    session    post
    ${headers}    Create Dictionary
    ...    accept=aplication/json
    ...    Conten-Type=aplication/json
    Create Session    alias=ApiSession    url=https://serverest.dev


Encerrar sessao na api
    Delete All Sessions

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

    ${response}    POST On Session
    ...    alias=ApiSession
    ...    url=/usuarios
    ...    json=${body}
    ...    expected_status=${STATUS}
    Log    ${response.json()}
    Set Test Variable    ${RESPONSE}    ${response.json()}


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


Consultar os dados do novo usuario
    [Arguments]    ${EXPECTED_STATUS_CODE}
    Log    ${RESPONSE}
    Set Test Variable    ${USER_ID}    ${RESPONSE['_id']}
    ${response}    GET On Session
    ...    alias=ApiSession
    ...    url=/usuarios/${USER_ID}
    ...    expected_status=${EXPECTED_STATUS_CODE}
    
    Set Test Variable    ${GET_RESPONSE}    ${response.json()}
    Set Test Variable    ${USER_EMAIL}      ${response.json()['email']}

    Log    ${response} 


Conferir os dados retornados
    Log    ${GET_RESPONSE}
    Dictionary Should Contain Item    dictionary=${GET_RESPONSE}
    ...    key=nome
    ...    value=Test User
    Dictionary Should Contain Item    dictionary=${GET_RESPONSE}
    ...    key=email
    ...    value=${USER_EMAIL}
    Dictionary Should Contain Item    dictionary=${GET_RESPONSE}
    ...    key=_id
    ...    value=${USER_ID}


Consultar um id inexistente
    [Arguments]    ${EXPECTED_STATUS_CODE}
    ${response}    GET On Session
    ...    alias=ApiSession
    ...    url=/usuarios/'id_inexistente_teste'
    ...    expected_status=${EXPECTED_STATUS_CODE}

    Log    ${response.json()}
    Set Test Variable    ${RESPONSE}    ${response.json()}

Verificar a mensagem retornada
    Dictionary Should Contain Item    ${RESPONSE}
    ...    key=message
    ...    value=Usuário não encontrado
    