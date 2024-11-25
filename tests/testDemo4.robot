*** Settings ***
Documentation    To Validate the Login form
Library    SeleniumLibrary
Test Teardown    Close Browser

Test Template    Validate UnSuccessful Login

*** Variables ***
${BROWSER}    Chrome
${Error_Message_Login}    css:.alert.alert-danger

*** Test Cases ***    username    password
Invalid username      dshed         learning
Invalid password      rahulshetty   123456
Special characters    @#2           learning
    

*** Keywords ***
Validate UnSuccessful Login
    [Arguments]    ${username}    ${password}
    Open the browser with the Mortgage payment url
    Fill the login form    ${username}    ${password}
    Wait until it checks and displays error message
    Verify error message is correct

Open the browser with the Mortgage payment url
    ${service}=    Evaluate    sys.modules['selenium.webdriver.chrome.service'].Service(executable_path='D:/source/PythonProject/RobotFramework/drivers/chromedriver.exe')    sys, selenium.webdriver
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Create Webdriver    ${BROWSER}    service=${service}    options=${options}
    Go To    https://rahulshettyacademy.com/loginpagePractise/

Fill the login form
    [Arguments]       ${username}    ${password}
    Input Text        id:username    ${username}
    Input Password    id:password    ${password}
    Click Button      signInBtn

Wait until it checks and displays error message
    Wait Until Element Is Visible    ${Error_Message_Login}

Verify error message is correct
    ${result}=    Get Text   ${Error_Message_Login}
    Should Be Equal As Strings    ${result}    Incorrect username/password.
    Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.

