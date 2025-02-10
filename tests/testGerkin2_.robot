*** Settings ***
Library          SeleniumLibrary
Library          Collections
Library          String
Library          ../customLibraries/OpenBrowser.py
Library          ../customLibraries/LoginPage.py


Test Setup
Test Teardown    Close Browser Session


Resource         ./resources/resource.robot

*** Variables ***
${IMPLICIT_WAIT}          10s
${Error_Message_Login}    css:.alert-danger


*** Test Cases ***
Log into Shetty Academy Webpage and add items to the cart
    [Tags]    SMOKE
    Set Selenium Implicit Wait    ${IMPLICIT_WAIT}

    Given the user open 'Chrome' browser and navigates to the 'https://rahulshettyacademy.com/loginpagePractise/' page

    Then the user enters 'rahulshettyacademy' and '12345' in the input fields and click 'Sign In' button

    And the user receives a error message

    Then the user verifies the error message text is 'Incorrect username/password.'



*** Keywords ***
the user open '${browser_name}' browser and navigates to the '${url}' page
    [Documentation]
    ...   This keyword opens the browser and navigates to the page
    ...    with the given URL
    ...    

    Open Page   ${url}    ${browser_name}    windows


the user enters '${username}' and '${password}' in the input fields and click 'Sign In' button
    [Documentation]
    ...   This keyword enters the username and password
    ...    
    
    Input Text         id:username    ${username}
    Input Password     id:password    ${password}

    Click Button       signInBtn
    

the user receives a error message
    [Documentation]
    ...   This keyword receives the error message
    ...    
    
    Wait Until Element Is Visible    ${Error_Message_Login}

the user verifies the error message text is '${login_error_message}'
    [Documentation]
    ...   This keyword verifies the error message
    ...    
    
    # ${result}=    Get Text    ${Error_Message_Login}

    # Should Be Equal As Strings    ${result}    ${login_error_message}
    
    Element Text Should Be    ${Error_Message_Login}    ${login_error_message}


the user ticks ${privilege_type} type and selects ${user_type} from drop-down
    # [Arguments]    ${privilege_type}    ${user_type}
    [Documentation]
    ...   This keyword ticks the privilege type and selects the user type
    ...    from the drop-down
    ...    
    Click Element     css:input[value=${privilege_type}]

    Sleep    5s


    
    

