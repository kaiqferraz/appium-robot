*** Settings ***
Resource    ../../base.resource

*** Keywords ***
And logs in to proceed to checkout
    
    Click Element    ${checkout_login.processedToCheckout}
    Input Text    ${checkout_login.username}    ${registro.username}
    Input Text    ${checkout_login.password}    ${registro.password}
    Click Element    ${checkout_login.loginButton}