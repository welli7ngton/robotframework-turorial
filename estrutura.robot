*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${variavel1}    teste_de_atribuicao_de_variavel
${varivael2}    10
${varivael3}    abababba


*** Keywords ***
abrir github
        Open Browser    https://github.com/welli7ngton   chrome

abrir linkedin
        Open Browser    https://www.linkedin.com/in/welli7ngton   chrome

fechar navegador
        Close Browser

*** Test Cases ***
Cenario 1: Teste abrindo github
    abrir github
    abrir linkedin 

# Cenario 2: Teste abrindo navegador
#    Open Browser    https://github.com/welli7ngton?tab=repositories   chrome
