*** Settings ***
Documentation    To Validate the Login form
Library    SeleniumLibrary
Library    ../customLibraries/OpenBrowser.py
Resource    ../PO/Generic.robot
Test Teardown    Close The Browser


*** Variables ***
${browser_name}    Chrome
${Error_Message_Login}    css:.alert.alert-danger
${env}    windows
${email}    tetramedia85@gmail.com


*** Test Cases ***
Validate UnSuccessful Login
#    Open the browser with the Mortgage payment url
    Open Page    https://rahulshettyacademy.com/loginpagePractise/    ${browser_name}    ${env}
#    Click login button
    Fill the login form

*** Keywords ***
#Open Page
#    [Arguments]    ${url}    ${browser_name}    ${env}
#    ${browser}=    Evaluate    customLibraries.OpenBrowser.OpenBrowser(env='${env}')    customLibraries.OpenBrowser
#    ${browser.open_page('${url}', '${browser_name}')}

Click login button
    Click Element    id:terms


Open the browser with the Mortgage payment url
    ${service}=    Evaluate    sys.modules['selenium.webdriver.chrome.service'].Service(executable_path='D:/source/PythonProject/RobotFramework/drivers/chromedriver.exe')    sys, selenium.webdriver
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Create Webdriver    ${BROWSER}    service=${service}    options=${options}
    Go To    https://rahulshettyacademy.com/loginpagePractise/

Fill the login form
    Input Text        id:username    rahulshettyacademy 
    Input Text        id:password    ${invalid_password}
    Click Button      id:signInBtn
    Wait Until Element Is Visible    //div[text()=' username/password.']    5s
Wait until it checks and displays error message
    Wait Until Element Is Visible    ${Error_Message_Login}

Verify error message is correct
    ${result}=    Get Text   ${Error_Message_Login}
    Should Be Equal As Strings    ${result}    Incorrect username/password.
    Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.

Close Browser
    Close Browser