*** Settings ***
Resource    ../../base.resource

*** Keywords ***
And enters the checkout address
    Input Text    ${Checkout.fullname}        ${registroCheckout.fullname}
    Input Text    ${Checkout.addressLine1}    ${registroCheckout.addressLine1}
    Input Text    ${Checkout.addressLine2}    ${registroCheckout.addressLine2}
    Input Text    ${Checkout.city}            ${registroCheckout.city}
    Input Text    ${Checkout.stateRegion}     ${registroCheckout.stateRegion}
    Input Text    ${Checkout.zipCode}         ${registroCheckout.zipCode}
    Input Text    ${Checkout.country}         ${registroCheckout.country}
    Click Element    ${Checkout.toPayment}

And completes the checkout payment
    Input Text    ${checkoutPayment.fullname}            ${registroCheckoutPayment.fullname}
    Input Text    ${checkoutPayment.cardNumber}     ${registroCheckoutPayment.cardNumber}
    Input Text    ${checkoutPayment.ExpirationDate}         ${registroCheckoutPayment.ExpirationDate}
    Input Text    ${checkoutPayment.SecurityCode}         ${registroCheckoutPayment.SecurityCode}
    Click Element    ${checkoutPayment.reviewOrder}

Then the user reviews and confirms the order
    Click Element    ${checkoutPayment.reviewOrder} 
    Click Element    ${checkoutContinue.continueShopping}

