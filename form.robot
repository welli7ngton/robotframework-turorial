*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${input_name}                  //input[@placeholder="First Name" and @id="firstName" and @type="text"]
${input_lastname}              //input[@placeholder="Last Name" and @id="lastName" and @type="text"]
${input_email}                 //input[@placeholder="name@example.com" and @id="userEmail"]
${gender_radio_male}           //label[@for="gender-radio-1" and @class="custom-control-label"]
${input_user_number}           //input[@type="text" and @placeholder="Mobile Number" and @id="userNumber"]
# ${input_date_of_birth}         //input[@type="text" and @id="dateOfBirthInput"] 
${textarea_current_address}    //textarea[@id="currentAddress" and @placeholder="Current Address" and @rows="5" and @cols="20"]
${button_submit}               //button[@type="submit" and @id="submit" and @class="btn btn-primary"]


*** Keywords ***
abrir navegador e acessa o site
    Open Browser    https://demoqa.com/automation-practice-form     chrome

preencher campos
    Input Text    ${input_name}          TESTE NAME
    Input Text    ${input_lastname}      TESTE LASTNAME
    Sleep    1
    Input Text    ${input_email}         teste@email.com
    Sleep    1
    Click Element    ${gender_radio_male}
    Input Text    ${input_user_number}   88998129128
    Input Text    ${textarea_current_address}   TEST ADDRESS ADDRESS ADDRESS ADDRESS
    Sleep    1
    clicar em algo
    Sleep    2

clicar em algo
    # Wait Until Element Is Visible    ${button_submit}    10
    Click Element    ${gender_radio_male}
fechar navegador
    Close Browser
*** Test Cases ***
Cenario 1: preencher formulario
    abrir navegador e acessa o site
    preencher campos
    # clicar em submit
    # fechar navegador
