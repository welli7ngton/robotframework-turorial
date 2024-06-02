*** Settings ***

Library    String

*** Variables ***
# Dentro do escopo de Variables não é necessário o uso da keyword 'Set Variable'
${str1}    Hello
${str2}    World

*** Keywords ***


*** Test Cases ***
Comparar Strings
    Should Be Equal    ${str1}    Hello
    Should Not Be Equal    ${str2}    ${str1}
    Should Contain    ${str2}    Wor

Concatenar Strings
    ${concatenated1}=    Evaluate    "${str1} ${str2}"
    ${concatenated2}=    Evaluate    "${str1} ${str1}"
    ${concatenated3}=    Evaluate    "${str2} ${str2}"

    Should Be Equal    ${concatenated1}    Hello World
    Should Be Equal    ${concatenated2}    Hello Hello
    Should Be Equal    ${concatenated3}    World World

Obter Substring
    ${concatenated1}=    Evaluate    "${str1} ${str2}"
    ${substring1}    Get Substring    ${concatenated1}    0    5
    ${substring2}    Get Substring    ${concatenated1}    6    11

    Should Be Equal    ${substring1}    Hello
    Should Be Equal    ${substring2}    World

Dividir Strings
    ${str1}=    Set Variable    Hello,World,I'm,Robot,Framework
    # O retorno da keyword Split String é uma lista, devemos usar a declaração
    # de variavel '@' pois se trata de uma variável de lista, o '$' é apenas
    # usados em variáveis escalares(strings, numeros, etc.)

    # Lista      Keyword         Variavel    Separador
    @{parts}=    Split String    ${str1}        ,

    FOR    ${part}    IN    @{parts}
        Log    ${part}
    END

Substituir Strings
    ${hello_world}=    Evaluate    "${str1} ${str2}"
    ${new_string}=     Replace String    ${hello_world}    World    Universe
    Should Be Equal    ${new_string}    Hello Universe
