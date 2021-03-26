*** Settings ***
Library         SeleniumLibrary


*** Variables ***
${BROWSER}      chrome
${URL}          http://automationpractice.com/index.php


*** Keywords ***
Abrir navegador
    Open Browser                    about:blank             ${BROWSER}     ]
    Capture Page Screenshot         Navegador_Aberto.png

Fechar navegador
    Close Browser

Acessar a página home do site
    Go To                           ${URL}
    Title Should Be                 My Store

Digitar o nome do produto "${PRODUTO}" no campo de Pesquisar
    Input Text                      xpath=//input[@name='search_query']        ${PRODUTO}
    Capture Page Screenshot         Produto_Digitado.png

Clicar no botão Pesquisar
    Click Element                   xpath=//button[@class='btn btn-default button-search']

Conferir se o produto "${PRODUTO}" foi listado no site
    Wait Until Element Is Visible           xpath=//div[@id='center_column']
    Title Should Be                         Search - My Store
    Capture Page Screenshot                 Pagina_Busca.png
    Page Should Contain Image               //img[@title='Blouse']

Conferir mensagem de erro "${MENSAGEM}"
    Wait Until Element Is Visible           xpath=//div[@id='center_column']
    Title Should Be                         Search - My Store
    Capture Page Screenshot                 Pagina_Busca.png
    Element Should Contain                  xpath=//p[@class='alert alert-warning']         ${MENSAGEM} 

Dado que estou na página home do site
    Go To                           ${URL}
    Title Should Be                 My Store

Quando eu pesquisar pelo produto "${PRODUTO}"
    Input Text                      xpath=//input[@name='search_query']        ${PRODUTO}
    Capture Page Screenshot         Produto_Digitado.png
    Click Element                   xpath=//button[@class='btn btn-default button-search']

Então o produto "${PRODUTO}" deve ser listado na página de resultado da busca
    Wait Until Element Is Visible           xpath=//div[@id='center_column']
    Title Should Be                         Search - My Store
    Capture Page Screenshot                 Pagina_Busca.png
    Page Should Contain Image               //img[@title='Blouse']

Então a página deve exibir a mensagem "${MENSAGEM}"
    Wait Until Element Is Visible           xpath=//div[@id='center_column']
    Title Should Be                         Search - My Store
    Capture Page Screenshot                 Pagina_Busca.png
    Element Should Contain                  xpath=//p[@class='alert alert-warning']         ${MENSAGEM}
