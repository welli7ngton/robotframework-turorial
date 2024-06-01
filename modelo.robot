*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${CHROMEDRIVER_PATH}  /usr/local/bin/chromedriver

*** Keywords ***
Abrir Site
    [Arguments]  ${url}
    Open Browser  ${url}  chrome  executable_path=${CHROMEDRIVER_PATH}

*** Test Cases ***
Cenario 1: Acessando meu github
    Abrir Site  https://github.com/welli7ngton
