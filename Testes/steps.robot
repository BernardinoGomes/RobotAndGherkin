*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/LoginPage.robot
Resource   ../resources/ProductsPage.robot
Resource   ../resources/CartPage.robot
Resource   ../resources/CheckoutPage.robot
Resource   ../resources/variaveis/Config.robot
Test Teardown    Fechar o Navegador

*** Keywords ***
Dado que estou na página da URL em questão
    Abrir Navegador

E os campos de login e senha estão visíveis
    Verificar Campos da Página de Login

Quando eu insiro o nome de usuário "${username}"
    Inserir username    ${username}

E eu insiro a senha "${password}"
    Inserir password    ${password}

E eu verifico e clico no botão de login
    Verificar e clicar no botão BTT_SUBMIT_LOGIN

Então eu sou redirecionado para a página de produtos
   Verificar Login Bem-Sucedido

Dado que estou na página de produtos
    Verificar página de produtos

E verifico os elementos da página produtos
    Verificar os elementos da página produto antes de adicionar ao carrinho


Quando eu adiciono o segundo produto no carrinho
    Adicionar o segundo produto no carrinho


E adiciono um outro produto no carrinho
    Adicionar um outro produto no carrinho

Então eu verifico os elementos da página produto após inserção ao carrinho
    Verificar os elementos da página produto após inserção ao carrinho

Dado que o primeiro produto foi inseridos no carrinho
    Verificar que o primeiro produto foi anexados ao carrinho

Quando eu clico para remover o primeiro produto
    Remover Primeiro Produto do Carrinho

Dado que preciso acessar a tela de carrinho
    Acessar carrinho 
Então verifico o elemento validador do botão do carrinho
    Verificar o elemento validador da tela de produtos para ir a tela do carrinho

Dado que estou na tela de carrinho
    Verificar se a página é referente a tela de carrinho e verificar seus elementos principais

Quando eu clico no botão BTT_CHECKOUT
    Clicar no botão BTT_CHECKOUT da página de cart.html
Então eu verifico se o carrinho está vazio ou com produtos página cart.html
    Verificar se o carrinho está com produto ou vazio na página cart.html

Dado que estou na página de checkout-step-one.html
    Verificar o título e elementos da página checkout-step-one.html

Quando eu preencho os campo FIRSTNAME
    Preencher o campo FIRSTNAME da página checkout-step-one.html

Quando eu preencho os campo LASTNAME
    Preencher o campo LASTNAME da página checkout-step-one.html

Quando eu preencho os campo ZIP_CODE
    Preencher o campo ZIP_CODE da página checkout-step-one.html

Então eu clico no botão BTT_CONTINUE
    Selecionar o botão BTT_CONTINUE
E verifico os elementos da página de checkout-step-two.html
    Verificar os elementos da página checkout-step-two.html


Então eu verifico se o carrinho está vazio ou com produtos na página checkout-step-two.html
      Verificar se o carrinho está com produto ou vazio na página checkout-step-two.html
Quando clico no botão da página de checkout-step-two.html
...    Clicar no botão BTT_FINISH da página de checkout-step-two.html


E finalizo o pedido
...    Clicar no botão BTT_FINISH da página de checkout-step-two.html


 Dado que estou na página de checkout-complete.html
      Verificar se estou na página checkout-complete.html
