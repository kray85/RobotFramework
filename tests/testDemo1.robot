*** Settings ***
Documentation    To Validate the Login form
Library    SeleniumLibrary
Library    ../customLibraries/OpenBrowser.py
#Test Teardown    Close Browser


*** Variables ***
${BROWSER}    Chrome
${Error_Message_Login}    css:.alert.alert-danger

*** Test Cases ***
Validate UnSuccessful Login
#    Open the browser with the Mortgage payment url
    Open Page    https://rahulshettyacademy.com/
#    Fill the login form
#    Wait until it checks and displays error message
#    Verify error message is correct

*** Keywords ***
Open the browser with the Mortgage payment url
    ${service}=    Evaluate    sys.modules['selenium.webdriver.chrome.service'].Service(executable_path='D:/source/PythonProject/RobotFramework/drivers/chromedriver.exe')    sys, selenium.webdriver
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Create Webdriver    ${BROWSER}    service=${service}    options=${options}
    Go To    https://rahulshettyacademy.com/loginpagePractise/

Fill the login form
    Input Text        id:username    rahulshettyacademy
    Input Password    id:password    123456
    Click Button      signInBtn

Wait until it checks and displays error message
    Wait Until Element Is Visible    ${Error_Message_Login}

Verify error message is correct
    ${result}=    Get Text   ${Error_Message_Login}
    Should Be Equal As Strings    ${result}    Incorrect username/password.
    Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.

Close Browser
    Close Browser