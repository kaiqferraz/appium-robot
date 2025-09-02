*** Settings ***
### Bibliotecas
Library      AppiumLibrary  timeout=30

### Utils
Resource     resource/utils/openApp.resource

### Locators
Variables     resource/locators/1-productsLocator.yml
Variables     resource/locators/2-productInfoPage.yml

### Pages
Resource      resource/pages/1-productsPage.resource
Resource      resource/pages/2-productInfoPage.resource