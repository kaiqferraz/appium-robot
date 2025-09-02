*** Settings ***
Resource    ../../base.resource

*** Keywords ***
Click In Product BackPack

    Wait Until Element Is Visible    ${products.productBackPack}
    Click Element    ${products.productBackPack}