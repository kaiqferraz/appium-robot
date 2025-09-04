*** Settings ***
Resource    ../../base.resource

*** Keywords ***
And selects product information and adds it to the cart

    Click Element    ${productInfo.greenColor}
    Click Element    ${productInfo.starsReview}
    Click Element    ${productInfo.clickSubmit}
    Click Element    ${productInfo.increaseItemQuantity}
    Click Element    ${productInfo.addProductToCart}
    Click Element    ${productInfo.carShopping}