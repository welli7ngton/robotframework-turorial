*** Settings ***
Documentation    Essa suite acessa o site da Amazon
Resource         amazon_resources.robot
Test Setup       Abrir navegador
Test Teardown    Fechar navegador


*** Test Cases ***
Caso de teste 01 - Acesso ao menu "Eletrônicos"
    [Documentation]    Esse teste verifica o menu eletronicos da Amazon
    ...                e verifica a cadegoria de computadores e informatica
    [Tags]    menus    categorias
    Acesar a home page do site
    Entrar no meu "Eletrônicos"
    Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Verificar se o titulo da pagina e "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se aparece a categoria "Computadores e Informática"
    Verificar se aparece a categoria "Tablets"


Caso de teste 02 - Pesquisar um produto
    [Documentation]    Esse teste verifica a busca de um produto
    [Tags]             busca_produtos    lista_produtos
    Acesar a home page do site
    Digitar o nome do produto: "Playstation 5" na barra de pesquisa
    Clicar no botao de pesquisa
    Verificar se o resultado da pesquisa está correto