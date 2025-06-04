*** Settings ***
Library        SeleniumLibrary

*** Variables ***
                                       ##Variáveis referente ao Checkout
${Title_Checkout}                      Checkout: Your Information
${BTT_CHECKOUT}                        //button[contains(.,'Checkout')]
${INPUT_FIRSTNAME}                     //input[contains(@placeholder,'First Name')]
${INPUT_LASTNAME}                      //input[contains(@placeholder,'Last Name')]
${INPUT_ZIP_CODE}                      //input[contains(@placeholder,'Zip/Postal Code')]
${TEXTO_FIRSTNAME}                      FIRST NAME saucedemo
${TEXTO_LASTNAME}                       LAST NAME saucedemo
${NUMERO_ZIP_CODE}                      50070125
${BTT_CONTINUE}                         //input[contains(@type,'submit')]
${BTT_FINISH}                           //button[contains(.,'Finish')]


*** Keywords ***
Verificar o título e elementos da página checkout-step-one.html
    Wait Until Location Contains    checkout-step-one.html    timeout=2s
    Page Should Contain Element      ${BTT_CONTINUE}
    
Preencher o campo FIRSTNAME da página checkout-step-one.html
    [Documentation]    Verifica o título da página de checkout e preenche os campos de entrada
    Wait Until Element Is Visible    ${INPUT_FIRSTNAME}       timeout=5s
    Input Text     ${INPUT_FIRSTNAME}    ${TEXTO_FIRSTNAME}
Preencher o campo LASTNAME da página checkout-step-one.html
    Wait Until Element Is Visible    ${INPUT_LASTNAME}        timeout=5s
    Input Text     ${INPUT_LASTNAME}     ${TEXTO_LASTNAME}
Preencher o campo ZIP_CODE da página checkout-step-one.html
    Wait Until Element Is Visible    ${INPUT_ZIP_CODE}        timeout=5s
    Input Text     ${INPUT_ZIP_CODE}     ${NUMERO_ZIP_CODE}
    Sleep  5s
    Capture Page Screenshot

Selecionar o botão BTT_CONTINUE
    Click Element                  ${BTT_CONTINUE}
    Sleep  2s
    Capture Page Screenshot
Então clico no botão BTT_CHECKOUT da página de checkout-step-two.html
    Click Element                    xpath=${BTT_CHECKOUT} 
    Capture Page Screenshot




Verificar o título da página checkout-step-two.html
    [Documentation]    Verifica o título da página de checkout e preenche os campos de entrada
    Wait Until Location Contains    checkout-step-two.html    timeout=2s
Verificar os elementos da página checkout-step-two.html
    Page Should Contain Element    ${BTT_FINISH}

Clicar no botão BTT_FINISH da página de checkout-step-two.html
    Click Element                  ${BTT_FINISH}
    Sleep  5s

 Verificar se estou na página checkout-complete.html  
    Wait Until Location Contains   checkout-complete.html    timeout=2s
    Capture Page Screenshot

Verificar se o carrinho está com produto ou vazio na página checkout-step-two.html
    [Documentation]                    Verifica se o título da página corresponde à categoria "Carrinho de Compras"
    ...                                Verifica se há o elemento input para fazer a validação da quantidade
    ...                                Verifica se existe um input com value='1', caso positvo há produtos no carrinho
    
    Wait Until Location Contains    checkout-step-two.html    timeout=10s
    Wait Until Page Contains Element   xpath=//div    timeout=2s 
    ${elemento_existe}    Run Keyword And Return Status    Page Should Contain Element    xpath=//div[@class='cart_quantity'][contains(.,'1')]
    Run Keyword If    ${elemento_existe}    Log To Console    Carrinho adicionado com sucesso
    ...    ELSE    Fail    Carrinho vazio, volte para a página de produtos e adicione produtos
    Capture Page Screenshot
