
*** Settings ***
Documentation    Suíte de testes para automação frontend do SauceDemo
Resource         ../resources/LoginPage.robot
Resource         ../resources/ProductsPage.robot
Resource         ../resources/CartPage.robot
Resource         ../resources/CheckoutPage.robot
Resource         ../variaveis/Config.robot

Test Teardown    Fechar o navegador

*** Test Cases ***
Caso de Teste 03 - Autenticação do usuário standard_user e tentar finalizar pedido
    Abrir Navegador Chrome Sem Popups
    Verificar Campos da Página de Login
    Realizar Login  ${USER_GLITCH}     ${PASS_PADRAO}
    Verificar Login Bem-Sucedido
    Verificar os elementos da página produto antes de adicionar ao carrinho
    Acessar carrinho
    Verificar se o carrinho está com produto ou vazio
    Ir para o CHECKOUT
    Verificar o título da página e Preencher os campos
    Verificar e Selecionar o botão BTT_CONTINUE
    Verificar o título da página e finalizar pedido
