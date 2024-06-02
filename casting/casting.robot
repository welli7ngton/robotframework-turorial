*** Settings ***
Library    Builtin

*** Variables ***
${integer_number}   123
${string_number}    123
${float_number}     123.45
${boolean_true}     True
${boolean_false}    False

*** Keywords ***


*** Test Cases ***
Verificando se as variaveis sao numeros
    # criando variavel, o tipo de dado padrão(nos testes) é string, independente do conteúdo
    ${temp_str}    Set Variable    123
    Should Be Equal As Integers    ${integer_number}    ${temp_str}

Verificando casting de float para inteiro
    ${float_number}    Convert To Number    123.45
    ${integer_number}    Convert To Integer    ${integer_number}
    ${float_number}     Convert To Integer    ${float_number}

    Should Be Equal    ${float_number}    ${integer_number}

