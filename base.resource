*** Settings ***
### Bibliotecas
Library      AppiumLibrary  timeout=30

### Utils
Resource     resource/utils/openApp.resource

### Locators
Variables     resource/locators/1-productsLocator.yml
Variables     resource/locators/2-productInfoLocator.yml
Variables     resource/locators/3-checkoutLoginLocator.yml
Variables     resource/locators/4-checkoutLocator.yml

### Pages
Resource      resource/pages/1-productsPage.resource
Resource      resource/pages/2-productInfoPage.resource
Resource      resource/pages/3-checkoutLoginPage.resource
Resource      resource/pages/4-checkoutPage.resource

### Data
Resource      resource/data/3-checkoutLoginData.robot
Resource      resource/data/4-checkout.robot