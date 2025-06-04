# 🤖 ExemplosRobotAndGherkin

Projeto de automação de testes utilizando **Robot Framework** com abordagem **BDD (Behavior Driven Development)**, estruturado com Page Object Pattern.

BDD feito a partir da UserStory.US.Login.TXT

---

## 📁 Estrutura do Projeto

```
ExemplosRobotAndGherkin/
├── resources/              # Keywords organizadas por páginas
│   ├── CartPage.robot
│   ├── CheckoutPage.robot
│   ├── LoginPage.robot
│   ├── ProductsPage.robot
│   └── variaveis/
│       └── Config.robot    # Variáveis globais
│
├── tests/                  # Casos de teste e passos BDD
│   ├── TesteCase1.robot
│   ├── TesteCase2.robot
│   ├── TesteCase3.robot
│   └── steps.robot         # Mapeamento dos passos BDD
│
└── results/                # Relatórios de execução
    ├── log.html
    ├── report.html
    └── output.xml
```

---

## 🚀 Tecnologias Utilizadas

- [Robot Framework](https://robotframework.org/)
- SeleniumLibrary
- Estrutura BDD (estilo Gherkin em `.robot`)
- Page Object Pattern

---

## 🧪 Tipos de Testes

- Funcionais
- Regressão
- Aceitação (BDD)
- Testes ponta a ponta (E2E)

---

## ⚙️ Pré-requisitos

- Python 3.x
- Instalar o Robot Framework:
  ```bash
  pip install robotframework selenium
  ```

---

## ▶️ Como Executar os Testes

1. Acesse o diretório do projeto:
   ```bash
   cd ExemplosRobotAndGherkin/
   ```

2. Execute um teste:
   ```bash
   robot tests/TesteCase1.robot
   ```

3. Veja os relatórios em `results/`:
   - `log.html`
   - `report.html`
   - `output.xml`
---

## 📌 Observações

- Projeto voltado para aprendizado e demonstração de automação com Robot Framework.
- Estrutura modularizada para facilitar manutenção e reutilização de keywords.
