*** Settings ***


*** Variables ***


*** Keywords ***
Calcula
    [Arguments]    ${num1}    ${num2}    ${operator}
    ${result}    Evaluate    ${num1}${operator}${num2}
    RETURN    ${result}

*** Test Cases ***
Calcula Soma
    ${result}    Calcula    40    60    +
    Should Be Equal As Numbers    ${result}    100

Calcula Subtracao
    ${result}    Calcula    10    5    -
    Should Be Equal As Numbers    ${result}    5

Calcula Multiplicacao
    ${result}    Calcula    4    6    *
    Should Be Equal As Numbers    ${result}    24

Calcula Divisao
    ${result}    Calcula    10    2    /
    Should Be Equal As Numbers    ${result}    5