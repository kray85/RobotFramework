*** Settings ***
Documentation    To Validate the Login form
Library    SeleniumLibrary
Library    DataDriver    file=resources/data.csv    encoding=UTF-8
Library    ../customLibraries/OpenBrowser.py
Test Teardown    Close Browser
Test Template    Validate UnSuccessful Login
Resource    ../PO/Generic.robot


*** Variables ***
${Error_Message_Login}    css:.alert.alert-danger

*** Test Cases ***
Login with user ${username} and password ${password}    xyc    123

*** Keywords ***
Validate UnSuccessful Login
    [Tags]    NEWFEATURE
    [Arguments]    ${username}    ${password}
    Open Page    ${url}    ${browser_name}
    Fill the login form    ${username}    ${password}
    Wait until it checks and displays error message
    Verify error message is correct



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

