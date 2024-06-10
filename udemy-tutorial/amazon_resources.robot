*** Settings ***
Library    SeleniumLibrary
Library    ../venv/lib/python3.10/site-packages/robot/libraries/XML.py

*** Variables ***
${URL}             https://www.amazon.com.br/
${BROWSER}         chrome
${SEARCH_FIELD}    //input[contains(@type,'text')]
${SEARCH_BUTTON}   //input[contains(@value,'Ir')]


*** Keywords ***
Abrir navegador
    Open Browser    browser=${BROWSER}    options=add_experimental_option("detach", True)

Fechar navegador
    Close Browser

Acesar a home page do site
    Go To    ${URL}
    Maximize Browser Window
    Sleep    5
    Wait Until Element Is Visible    locator=(//a[contains(@href,'electronics')])[1]
Entrar no meu "Eletrônicos"
    Click Element    locator=(//a[contains(@href,'electronics')])[1]

Verificar se aparece a frase "${TEXT}"
    Wait Until Page Contains    ${TEXT}

Verificar se o titulo da pagina e "${TITLE}"
    Title Should Be    ${TITLE}

Verificar se aparece a categoria "${CATEGORY}"
    Element Should Be Visible    //span[@class='nav-a-content'][contains(.,'${CATEGORY}')]


Digitar o nome do produto: "${PRODUCT}" na barra de pesquisa
    Input Text    ${SEARCH_FIELD}    ${PRODUCT}

Clicar no botao de pesquisa
    Click Element    ${SEARCH_BUTTON}

Verificar se o resultado da pesquisa está correto
    Element Should Be Visible    //span[@class='a-size-medium-plus a-color-base a-text-bold']
