*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${input_name}                  id:firstName
${input_lastname}              id:lastName
${input_email}                 id:userEmail
${gender_radio}                id:gender-radio-1
${input_user_number}           id:userNumber
${input_date_of_birth}         id:dateOfBirthInput
${button_submit}               id:submit
${textarea_current_address}    id:currentAddress


*** Keywords ***
abrir navegador e acessa o site
    Open Browser    https://demoqa.com/automation-practice-form     chrome

preencher campos
    Sleep    1
    Input Text    ${input_name}          teste
    Sleep    1
    Input Text    ${input_lastname}      oioioi
    Sleep    1
    Input Text    ${input_email}         teste@email.com
    Sleep    1
    Input Text    ${input_user_number}   88998129128
    Sleep    1
    Input Text    ${textarea_current_address}   xxxxxxxxxxxxxxxxxxxxxxxx
    Sleep    1
    clicar em algo
    Sleep    5

clicar em algo
    # Wait Until Element Is Visible    ${button_submit}    10
    Click Element    ${button_submit}
fechar navegador
    Close Browser
*** Test Cases ***
Cenario 1: preencher formulario
    abrir navegador e acessa o site
    preencher campos
    # clicar em submit
    # fechar navegador
