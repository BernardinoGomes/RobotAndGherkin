
*** Settings ***
Documentation    Suíte de testes para automação frontend do SauceDemo
Resource         ../resources/LoginPage.robot
Resource         ../resources/ProductsPage.robot
Resource         ../resources/CartPage.robot
Resource         ../resources/CheckoutPage.robot
Resource         ../Testes/steps.robot
Resource         ../resources/variaveis/Config.robot
Test Teardown    Fechar o navegador

*** Test Cases ***
Caso de Teste 01 - Autenticação do usuário standard_user e finalizar pedido
    Dado que estou na página da URL em questão
    E os campos de login e senha estão visíveis
    Quando eu insiro o nome de usuário "${USER_STANDARD}"
    E eu insiro a senha "${PASS_PADRAO}"
    E eu verifico e clico no botão de login
    Então eu sou redirecionado para a página de produtos
    Dado que estou na página de produtos
    E verifico os elementos da página produtos
    Quando eu adiciono o segundo produto no carrinho
    E adiciono um outro produto no carrinho
    Então eu verifico os elementos da página produto após inserção ao carrinho
    Dado que o primeiro produto foi inseridos no carrinho
    Quando eu clico para remover o primeiro produto
    Dado que preciso acessar a tela de carrinho
    Então verifico o elemento validador do botão do carrinho
    Dado que estou na tela de carrinho
    Então eu verifico se o carrinho está vazio ou com produtos página cart.html
    Quando eu clico no botão BTT_CHECKOUT
    Dado que estou na página de checkout-step-one.html
    Quando eu preencho os campo FIRSTNAME
    Quando eu preencho os campo LASTNAME
    Quando eu preencho os campo ZIP_CODE
    Então eu clico no botão BTT_CONTINUE
    E verifico os elementos da página de checkout-step-two.html
    Então eu verifico se o carrinho está vazio ou com produtos na página checkout-step-two.html
    #Quando clico no botão da página de checkout-step-two.html
    E finalizo o pedido
    Dado que estou na página de checkout-complete.html
    
    
 

