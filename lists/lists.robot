*** Settings ***
Library    Collections

*** Variables ***
@{my_list}    item1    item2    item3    item4

*** Keywords ***


*** Test Cases ***
Pegando itens da lista
    # Quando se trata de um item da lista, não é necessário usar '@''
    ${element1}    Set Variable    ${my_list}[0]
    ${element2}    Set Variable    ${my_list}[1]
    ${element3}    Set Variable    ${my_list}[2]
    ${element4}    Set Variable    ${my_list}[3]

    Should Be Equal    ${element1}    item1
    Should Be Equal    ${element2}    item2
    Should Be Equal    ${element3}    item3
    Should Be Equal    ${element4}    item4
Adicionar itens a lista
    Append To List    ${my_list}    item5
    Append To List    ${my_list}    item6
    Append To List    ${my_list}    item7

    ${element1}    Set Variable    ${my_list}[4]
    ${element2}    Set Variable    ${my_list}[5]
    ${element3}    Set Variable    ${my_list}[6]

    Should Be Equal    ${element1}    item5
    Should Be Equal    ${element2}    item6
    Should Be Equal    ${element3}    item7

Removendo itens da Lista
    Remove From List    ${my_list}    0
    Remove From List    ${my_list}    0

    Should Be Equal    ${my_list}[0]    item3
    Should Be Equal    ${my_list}[1]    item4

    Length Should Be    ${my_list}    5

Iterando sobre a lista
    FOR    ${element}    IN    @{my_list}
        Log    ${element}
    END

Verificando existencia de um elemento
    Should Contain    ${my_list}    item7

Ordenando a lista
    @{another_list}=    Set Variable    3    1    4    2    0
    
    Sort List    ${another_list}

    FOR    ${counter}    IN RANGE    0    4
        ${string_index}    Convert To String    ${counter}
        Should Be Equal    ${another_list[${counter}]}    ${string_index}
    END
