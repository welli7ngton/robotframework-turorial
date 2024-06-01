*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${input_name}    id:firstname
${input_lastname}    id:lastname


*** Keywords ***
abrir navegador e acessa o site
    Open Browser    https://www.techlistic.com/p/selenium-practice-form.html     chrome

preencher campos
    Maximize Browser Window
    Input Text    ${input_name}    teste
    Input Text    ${input_lastname}    oioioi
    Sleep    10
    # Input Text    datepicker    asdasdas
    # Wait Until Element Is Visible    sex-0    10
    # Click Element    sex-0
clicar em submit
    Click Button    submit
fechar navegador
    Close Browser
*** Test Cases ***
Cenario 1: preencher formulario
    abrir navegador e acessa o site
    preencher campos
    # clicar em submit
    # fechar navegador
