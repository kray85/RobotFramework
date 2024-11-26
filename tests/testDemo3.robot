*** Settings ***
Documentation    To Validate the Login form
Library          SeleniumLibrary
Library          Collections
Library          String
Library          ../customLibraries/OpenBrowser.py
Test Setup       Open Page      https://rahulshettyacademy.com/loginpagePractise/    Chrome
Test Teardown    Close Browser
Resource         ../PO/Generic.robot


*** Variables ***
${Error_Message_Login}    css:.alert.alert-danger
#${email}     mentor@rahulshettyacademy.com

*** Test Cases ***
Validate Child Window Functionality
    Select the link of child window
    Verify the user is switched to child window
    Grab the Email Id in the Child Window
    Switch to Parent window and enter the email


*** Keywords ***
Select the link of child window
    Click Element    css:.blinkingText
        Sleep        5s

Verify the user is switched to child window
    Switch Window    New
    ${text}=    Get Text    css:h1
    Element Text Should Be    css:h1        ${text.upper()}

Grab the Email Id in the Child Window
    ${text}=    Get Text    css:.red
    @{words}=    Split String    ${text}     at
    
    Get From List    ${words}    1
    ${text_split}=    Get From List    ${words}    1
    Log    ${text_split}?
    @{words_2}=    Split String    ${text_split}
    ${email}=    Get From List    ${words_2}    0
    Set Global Variable    ${email}
    Log    ${email}
    
Switch to Parent window and enter the email
    Switch Window    Main
    ${title}=    Get Title
    Log    ${title}
    Title Should Be    LoginPage Practise | Rahul Shetty Academy
    Input Text        id:username    ${email}

    Sleep    5s