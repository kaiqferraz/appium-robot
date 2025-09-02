*** Settings ***
Resource   ../base.resource
Test Setup    Open App
# Test Teardown    Close Application

*** Test Cases ***
Cenário: Acessar Aplicativo

    Click In Product BackPack
    Choose Green Color
