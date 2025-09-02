*** Settings ***
Resource    ../../base.resource

*** Keywords ***
Choose Green Color

    Wait Until Element Is Visible    ${productInfo.greenColor}
    Click Element    ${productInfo.greenColor}