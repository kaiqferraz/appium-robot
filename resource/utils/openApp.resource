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
    
    ...   platformVersion=16
    ...   autoGrantPermissions=true
    ...   noReset=false
    ...   fullReset=true
    ...   uiautomator2ServerInstallTimeout=120000
    ...   uiautomator2ServerLaunchTimeout=120000
    ...   androidInstallTimeout=120000
    ...   adbExecTimeout=120000
    ...   androidDeviceReadyTimeout=120000
    ...   androidInstallTimeout=120000
    ...   newCommandTimeout=60
    ...   autoGrantPermissions=true
    ...   skipServerInstallation=false
    ...   skipDeviceInitialization=false
    ...   skipUnlock=true
    ...   disableWindowAnimation=true
    ...   disableSuppressAccessibilityService=true

