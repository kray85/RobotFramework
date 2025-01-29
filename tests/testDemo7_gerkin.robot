*** Settings ***
Library          SeleniumLibrary
Library          Collections
Library          String
Library          ../customLibraries/OpenBrowser.py
Library          ../customLibraries/LoginPage.py

Test Teardown    Close Browser


Resource         ../PO/Generic.robot

*** Variables ***
${IMPLICIT_WAIT}          10s

*** Test Cases ***
Log into Shetty Academy Webpage and add items to the cart
    [Tags]    SMOKE
    Set Selenium Implicit Wait    ${IMPLICIT_WAIT}

    Given the user open Firefox browser and navigates to the 'https://rahulshettyacademy.com/loginpagePractise/' page

    Then the user enters rahulshettyacademy and learning

    Then the user ticks 'admin' type and selects 'student' from drop-down


*** Keywords ***
the user open ${browser_name} browser and navigates to the '${url}' page
    [Documentation]
    ...   This keyword opens the browser and navigates to the page
    ...    with the given URL
    ...    

    Open Page   ${url}    ${browser_name}    windows


the user enters ${username} and ${password}
    [Documentation]
    ...   This keyword enters the username and password
    ...    
    
    Input Text     id:username    ${username}
    Input Text     id:password    ${password}

    

    
    


the user ticks ${privilege_type} type and selects ${user_type} from drop-down
    # [Arguments]    ${privilege_type}    ${user_type}
    [Documentation]
    ...   This keyword ticks the privilege type and selects the user type
    ...    from the drop-down
    ...    
    Click Element     css:input[value=${privilege_type}]

    Sleep    5s


    
    

