# Appium Robot Framework - Automação Mobile

## Descrição

Projeto de automação mobile usando Appium com Robot Framework para testar o aplicativo **Sauce Labs My Demo App** (versão 2.2.0-25). O projeto implementa um fluxo completo de e-commerce, testando desde a seleção de produtos até a finalização do checkout.

### Cenários de Teste Implementados

O projeto contém um cenário principal de teste que simula um fluxo completo de compra:

**Cenário: User adds a product to the cart and completes checkout**

1. **Seleção de Produto**: Usuário clica no produto "Backpack"
2. **Configuração do Produto**:
   - Seleciona cor verde
   - Avalia o produto com 5 estrelas
   - Aumenta a quantidade do item
   - Adiciona o produto ao carrinho
3. **Login**: Realiza login com credenciais de teste
4. **Checkout - Endereço**: Preenche informações de endereço de entrega
5. **Checkout - Pagamento**: Preenche dados de pagamento
6. **Confirmação**: Revisa e confirma o pedido

## Pré-requisitos

- Node.js (versão 16 ou superior)
- Python 3.7+
- Robot Framework
- Appium Server
- Android SDK
- Dispositivo Android ou emulador

## Instalação

### 1. Instalar dependências Python

```bash
pip install robotframework-appiumlibrary
pip install robotframework
```

### 2. Instalar Appium e drivers

```bash
npm install -g appium
appium driver install uiautomator2
```

### 3. Verificar instalação

```bash
appium --version
appium driver list
```

## Como Executar

### Opção 1: Usar script de inicialização (Recomendado)

```bash
# Windows
start-appium.bat

# Em outro terminal, executar os testes
robot -d log .
```

### Opção 2: Inicialização manual

```bash
# Terminal 1: Iniciar Appium Server
appium --config appium-config.json

# Terminal 2: Executar testes
robot -d log .
```

### Executar Teste Específico

```bash
# Executar apenas o teste principal
robot -d log test/APP.robot

# Executar com tags específicas (se implementadas)
robot -d log --include smoke test/
```

### Visualizar Relatórios

Após a execução, os relatórios estarão disponíveis em:

- `log/report.html` - Relatório principal
- `log/log.html` - Log detalhado
- `log/output.xml` - Log em formato XML

## Solução de Problemas

### Erro: "UiAutomator2 server because the instrumentation process is not running"

**Causas possíveis:**

1. Appium Server não está rodando
2. Driver UiAutomator2 não está instalado
3. Dispositivo Android não está conectado
4. Timeout muito baixo para inicialização

**Soluções:**

1. **Verificar se o Appium está rodando:**

   ```bash
   # Verificar se a porta 4723 está em uso
   netstat -an | findstr 4723
   ```

2. **Reinstalar driver UiAutomator2:**

   ```bash
   appium driver uninstall uiautomator2
   appium driver install uiautomator2
   ```

3. **Verificar dispositivo Android:**

   ```bash
   adb devices
   ```

4. **Limpar cache do Appium:**

   ```bash
   appium driver cleanup uiautomator2
   ```

5. **Reiniciar dispositivo/emulador**

### Verificações de Diagnóstico

1. **Status do Appium:**

   ```bash
   curl http://localhost:4723/status
   ```

2. **Logs do Appium:**

   - Verificar console onde o Appium está rodando
   - Logs detalhados estão em `appium-config.json`

3. **Logs do Android:**
   ```bash
   adb logcat | grep -i uiautomator
   ```

## Estrutura do Projeto

```
appium-robot/
├── base.resource                    # Configurações principais e imports
├── appium-config.json              # Configuração do Appium Server
├── start-appium.bat                # Script de inicialização (Windows)
├── resource/
│   ├── app/
│   │   └── mda-2.2.0-25.apk       # APK do Sauce Labs My Demo App
│   ├── locators/                   # Localizadores YAML por página
│   │   ├── 1-productsLocator.yml   # Elementos da página de produtos
│   │   ├── 2-productInfoLocator.yml # Elementos da página de detalhes
│   │   ├── 3-checkoutLoginLocator.yml # Elementos do login
│   │   └── 4-checkoutLocator.yml   # Elementos do checkout
│   ├── pages/                      # Keywords do Robot Framework
│   │   ├── 1-productsPage.resource # Ações da página de produtos
│   │   ├── 2-productInfoPage.resource # Ações da página de detalhes
│   │   ├── 3-checkoutLoginPage.resource # Ações do login
│   │   └── 4-checkoutPage.resource # Ações do checkout
│   ├── data/                       # Dados de teste
│   │   ├── 3-checkoutLoginData.robot # Credenciais de login
│   │   └── 4-checkout.robot        # Dados de endereço e pagamento
│   └── utils/
│       └── openApp.resource        # Configuração de abertura do app
├── test/
│   └── APP.robot                   # Caso de teste principal
└── log/                            # Logs de execução
    ├── log.html                    # Relatório HTML
    ├── output.xml                  # Log XML
    └── report.html                 # Relatório detalhado
```

## Dados de Teste

O projeto utiliza dados de teste organizados em arquivos separados para facilitar a manutenção:

### Credenciais de Login (`3-checkoutLoginData.robot`)

```robot
&{registro}
...   username=TesteQA
...   password=TesteQA123
```

### Dados de Checkout (`4-checkout.robot`)

**Informações de Endereço:**

```robot
&{registroCheckout}
...   fullname=Teste QA da Silva
...   addressLine1=Rua Teste QA, 123
...   addressLine2=Rua Teste QA, 123
...   city=São Paulo
...   stateRegion=SP
...   zipCode=1234567890
...   country=Brasil
```

**Informações de Pagamento:**

```robot
&{registroCheckoutPayment}
...   fullname=Teste QA da Silva
...   cardNumber=1010101010101010
...   ExpirationDate=1030
...   SecurityCode=123
```

## Configurações Importantes

### Timeouts (em milissegundos)

- `uiautomator2ServerInstallTimeout`: 120000 (2 min)
- `uiautomator2ServerLaunchTimeout`: 120000 (2 min)
- `androidInstallTimeout`: 120000 (2 min)
- `newCommandTimeout`: 60 (60 segundos)

### Configurações de Dispositivo

- `deviceName`: Google Pixel 7 Pro
- `platformVersion`: 16 (Android 16)
- `automationName`: UiAutomator2
- `autoGrantPermissions`: true
- `fullReset`: true (reset completo a cada execução)
- `noReset`: false
- `skipUnlock`: true (pular desbloqueio de tela)
- `disableWindowAnimation`: true
- `disableSuppressAccessibilityService`: true

## Suporte

Para problemas específicos, verifique:

1. Logs do Appium Server
2. Logs do Android (adb logcat)
3. Status do dispositivo (adb devices)
4. Versões das dependências
