*** Settings ***
Documentation    Keywords e locators para a página de login do SauceDemo
Library          SeleniumLibrary
Library          OperatingSystem
Resource         ../resources/variaveis/Config.robot

*** Variables ***
${INPUT_USERNAME}         id=user-name
${INPUT_PASS}             id=password
${BTT_SUBMIT_LOGIN}       id=login-button
${ALERT_OK_BUTTON}        xpath=//button[text()='OK']

*** Keywords ***
Abrir Navegador
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    --disable-infobars
    Call Method    ${options}    add_argument    --disable-notifications
    Call Method    ${options}    add_argument    --disable-popup-blocking
    Call Method    ${options}    add_argument    --disable-extensions
    Call Method    ${options}    add_argument    --no-default-browser-check
    Call Method    ${options}    add_argument    --incognito
    ${exclude_switches}=    Create List    enable-automation
    Call Method    ${options}    add_experimental_option    excludeSwitches    ${exclude_switches}
    Call Method    ${options}    add_experimental_option    useAutomationExtension    ${False}
    Create Webdriver    Chrome    options=${options}
    Go To    ${URL}
    Maximize Browser Window

Fechar o Navegador
    Capture Page Screenshot
    Close Browser

Verificar Campos da Página de Login
    [Documentation]    Valida a URL e a visibilidade dos campos de login
    ${url_atual}=    Get Location
    Should Be Equal As Strings    ${url_atual}    ${URL}    msg=A URL atual (${url_atual}) não corresponde à esperada (${URL})
    Wait Until Element Is Visible    ${INPUT_USERNAME}    timeout=5s
    Wait Until Element Is Visible    ${INPUT_PASS}        timeout=5s

Inserir username 
    [Arguments]    ${username} 
    [Documentation]    Realiza login com o usuário e senha fornecidos
    Input Text    ${INPUT_USERNAME}    ${username}
    
Inserir password
    [Arguments]       ${password}
    [Documentation]    Realiza login com o usuário e senha fornecidos
    Input Text    ${INPUT_PASS}        ${password}
Verificar e clicar no botão BTT_SUBMIT_LOGIN
    Wait Until Element Is Visible    ${BTT_SUBMIT_LOGIN}    timeout=5s
    Click Element    ${BTT_SUBMIT_LOGIN}



Verificar Login Bem-Sucedido
    [Documentation]    Verifica se o login foi bem-sucedido
    ${url_atual}=    Get Location
    Should Contain    ${url_atual}    inventory.html    msg=A URL atual (${url_atual}) não indica a página de produtos
	
	
