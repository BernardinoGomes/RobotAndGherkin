*** Settings ***
Documentation    Suíte de testes para automação frontend do SauceDemo

Resource         ../resources/LoginPage.robot
Resource         ../resources/ProductsPage.robot
Resource         ../resources/CartPage.robot
Resource         ../resources/CheckoutPage.robot
Resource         ../variaveis/Config.robot
Test Teardown    Fechar o navegador

*** Test Cases ***
Caso de Teste 02 - Autenticação do usuário performance_glitch_userer e finalizar pedido
    Abrir Navegador Chrome Sem Popups
    Verificar Campos da Página de Login
    Realizar Login  ${USER_GLITCH}     ${PASS_PADRAO}
    #Verificar Login Bem-Sucedido
    Verificar os elementos da página produto antes de adicionar ao carrinho
    Adicionar o segundo produto no carrinho
    Adicionar um outro produto no carrinho
    Verificar os elementos da página produto após inserção ao carrinho
    Remover Primeiro Produto do Carrinho
    Acessar carrinho
    Verificar se o carrinho está com produto ou vazio
    Ir para o CHECKOUT
    Verificar o título da página e Preencher os campos
    Verificar e Selecionar o botão BTT_CONTINUE
    Verificar o título da página e finalizar pedido
