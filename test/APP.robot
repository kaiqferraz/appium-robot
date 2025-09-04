*** Settings ***
Resource   ../base.resource
Test Setup    Open App
# Test Teardown    Close Application

*** Test Cases ***
Scenario: User adds a product to the cart and completes checkout

    When the user clicks on the Backpack product
    And selects product information and adds it to the cart
    And logs in to proceed to checkout
    And enters the checkout address
    And completes the checkout payment
    Then the user reviews and confirms the order
