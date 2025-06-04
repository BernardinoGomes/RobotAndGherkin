*** Settings ***
Library        SeleniumLibrary

*** Variables ***                     ##Variáveis referente aaos produtos

${PRIMEIRO_PRODUTO}                   (//div[contains(@class,'inventory_item_name ')])[1]
${SEGUNDO_PRODUTO}                    (//div[contains(@class,'inventory_item_name ')])[2]
${BTT_CARRINHO}                       //a[contains(@class,'shopping_cart_link')]
${BTT_CHECKOUT}                       //button[contains(.,'Checkout')]
${ADD_CARRINHO_PRIMEIRO_PRODUTO}      (//button[contains(.,'Add to cart')])[1]
${ADD_CARRINHO_SEGUNDO_PRODUTO}       (//button[contains(.,'Add to cart')])[2]
${DELET_CARRINHO_PRIMEIRO_PRODUTO}    (//button[contains(.,'Remove')])[1]
${DELET_CARRINHO_SEGUNDO_PRODUTO}     (//button[contains(.,'Remove')])[2]

*** Keywords ***

Verificar página de produtos
    [Documentation]    Verifica se o login foi bem-sucedido
    ${url_atual}=    Get Location
    Should Contain    ${url_atual}    inventory.html    msg=A URL atual (${url_atual}) não indica a página de produtos

Verificar os elementos da página produto antes de adicionar ao carrinho
    Wait Until Element Is Visible    ${PRIMEIRO_PRODUTO}                  timeout=5s
    Wait Until Element Is Visible    ${SEGUNDO_PRODUTO}                   timeout=5s
    Wait Until Element Is Visible    ${ADD_CARRINHO_PRIMEIRO_PRODUTO}     timeout=5s
    Wait Until Element Is Visible    ${ADD_CARRINHO_SEGUNDO_PRODUTO}      timeout=5s


Adicionar o segundo produto no carrinho
    Click Button                    locator=${ADD_CARRINHO_SEGUNDO_PRODUTO} 
    Sleep  5s 
    Capture Page Screenshot

Adicionar um outro produto no carrinho
    Click Button                    locator=${ADD_CARRINHO_PRIMEIRO_PRODUTO} 
    Sleep  5s   
    Capture Page Screenshot
Verificar os elementos da página produto após inserção ao carrinho
    [Documentation]    Verifica se o link do carrinho de compras está visível na página
    Element Should Be Visible    ${DELET_CARRINHO_PRIMEIRO_PRODUTO}     
    Element Should Be Visible    ${DELET_CARRINHO_SEGUNDO_PRODUTO}     timeout=5s   


Verificar que o primeiro produto foi anexados ao carrinho 
   [Documentation]    Remove o primeiro produto adicionado ao carrinho
    Wait Until Element Is Visible    ${DELET_CARRINHO_PRIMEIRO_PRODUTO}    timeout=5s
Remover Primeiro Produto do Carrinho
    [Documentation]    Remove o primeiro produto adicionado ao carrinho
    Click Button    ${DELET_CARRINHO_PRIMEIRO_PRODUTO} 
    Capture Page Screenshot
