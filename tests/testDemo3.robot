

*** Settings ***

Documentation    To Validate the Login form
Library          SeleniumLibrary
Library          Collections
Library          String
Library          ../customLibraries/OpenBrowser.py
# Test Setup       Open Page      https://rahulshettyacademy.com/loginpagePractise/    Chrome    windows
Test Teardown    Close Browser
Resource         ../PO/Generic.robot


*** Variables ***
${Error_Message_Login}    css:.alert.alert-danger
# ${link_text}=    Get Text    ${new_window_link}
${new_window_link}=    Get Text    css:.blinkingText
${IMPLICIT_WAIT}          10s
#${email}     mentor@rahulshettyacademy.com

*** Test Cases ***
Navigate to Free Access Page
    [Tags]    SMOKE
    Set Selenium Implicit Wait    ${IMPLICIT_WAIT}

    Given the user has accessed the 'https://rahulshettyacademy.com/loginpagePractise/' web page
    
    When the user clicks the new window link with text Free Access to InterviewQues/ResumeAssistance/Material
    
    Then the user verifies text 'DOCUMENTS REQUEST' on the page
    
    Then the user navigates to the 'Join Now' page
    
    And the user verifies the 'Sign Up' in on page
    


*** Keywords ***
the user has accessed the '${link}' web page
    # [Arguments]    ${link}
    Open Page    ${link}    Chrome    windows
    # Switch Window    New
    # ${link_text}=    Get Text    ${new_window_link}

the user clicks the new window link with text ${link_text}
    Click Link    ${link_text}
    Switch Window    New
    ${title}=    Get Title
    Log    ${title}

the user verifies text '${expected_text}' on the page
    Element Text Should Be    css:div.inner-box h1    ${expected_text.upper()}
    Log    ${expected_text}

the user navigates to the '${link}' page
    Click Link    ${link.upper()}
    
the user verifies the '${expected_text}' in on page
    Element Should Contain    xpath://div/h3    ${expected_text}

    Log    ${expected_text}
Grab the Email Id in the Child Window
    ${text}=    Get Text    css:.red
    @{words}=    Split String    ${text}     at
    
    Get From List    ${words}    1
    ${text_split}=    Get From List    ${words}    1
    Log    ${text_split}
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

    # Sleep    5s
