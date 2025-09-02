*** Settings ***
Resource    ../../base.resource

*** Keywords ***

Open App

    Open Application
    ### Parâmetros de conexão com o Appium Server e o dispositivo (Capabilities)
    ...   remote_url=http://localhost:4723/wd/hub
    ...   automationName=UiAutomator2
    ...   platformName=android
    ...   deviceName=Google Pixel 7 Pro
    ...   app=${CURDIR}${/}..${/}app${/}mda-2.2.0-25.apk
    # ...   disableIdLocatorAutocompletion=true

