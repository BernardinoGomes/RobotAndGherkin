*** Settings ***
Library        SeleniumLibrary

*** Variables ***
                                      ### variáveis referente ao carrinho
${BTT_CARRINHO}                       //a[contains(@class,'shopping_cart_link')]
${BTT_CHECKOUT}                       //button[contains(.,'Checkout')]


*** Keywords ***


Verificar o elemento validador da tela de produtos para ir a tela do carrinho
    Element Should Be Visible        ${BTT_CARRINHO}     timeout=5s

Acessar carrinho 
   Click Element                    xpath=${BTT_CARRINHO}

Verificar se a página é referente a tela de carrinho e verificar seus elementos principais
    [Documentation]                    Verifica se o título da página corresponde à categoria "Carrinho de Compras"
    Wait Until Location Contains    cart.html    timeout=5s
    Element Should Be Visible        ${BTT_CHECKOUT}        timeout=5s
Verificar se o carrinho está com produto ou vazio na página cart.html
    [Documentation]                    
    ...                                Verifica se há o elemento input para fazer a validação da quantidade
    ...                                Verifica se existe um input com value='1', caso positvo há produtos no carrinho
    Wait Until Page Contains Element   xpath=//div    timeout=10s 
    ${elemento_existe}    Run Keyword And Return Status    Page Should Contain Element    xpath=//div[@class='cart_quantity'][contains(.,'1')]
    Run Keyword If    ${elemento_existe}    Log To Console    Carrinho adicionado com sucesso
    ...    ELSE    Fail    Carrinho vazio, volte para a página de produtos e adicione produtos
    Capture Page Screenshot


Clicar no botão BTT_CHECKOUT da página de cart.html
    Click Element                    xpath=${BTT_CHECKOUT} 
    Capture Page Screenshot
    
