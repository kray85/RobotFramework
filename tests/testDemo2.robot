*** Settings ***
Documentation    To Validate the Login form
Library          SeleniumLibrary
Library          Collections
Test Setup       Open the browser with the Mortgage payment url
Test Teardown    Close Browser
Resource         resource.robot


*** Variables ***


*** Test Cases ***
Validate UnSuccessful Login
    Fill the login form    ${username}    ${invalid_password}
    Wait until element is visible on page    ${Error_Message_Login}
    Verify error message is correct


Validate cards display in the Shopping page
    Fill the login form    ${username}    ${valid_password}
    Wait until element is visible on page    ${shop_page_load}
    Verify card titles in the shop page
    Select the Card    Nokia Edge

Select the form and navigate to child window
    Fill in the Login Details and Login Form

*** Keywords ***


Fill the login form
    [Arguments]       ${username}    ${password}
    Input Text        id:username    ${username}
    Input Password    id:password    ${password}
    Click Button      signInBtn


Wait until element is visible on page
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}

Verify error message is correct
    ${result}=    Get Text   ${Error_Message_Login}
    # Top or Bottom
    Should Be Equal As Strings    ${result}    Incorrect username/password.
    Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.

Verify card titles in the shop page
    @{expectedList}=    Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry
    ${elements}=        Get WebElements    ${shop_card_elements}
    @{actual_list}=     Create List
    FOR   ${element}   IN    @{elements}
        Log    ${element.text}
        Append To List    ${actual_list}    ${element.text}

    END
    Lists Should Be Equal    ${expectedList}    ${actual_list}
    
Select the Card
    [Arguments]     ${card_name}
    ${elements}=    Get WebElements    ${shop_card_elements}
    ${index}=    Set Variable    1
     FOR   ${element}   IN    @{elements}
           Exit For Loop if    '${card_name}' == '${element.text}'
            
           ${index}=    Evaluate   ${index} + 1
     END
    Click Button    xpath:(//*[@class='card-footer'])[${index}]/button
    Sleep    5s

Fill in the Login Details and Login Form

    Input Text        id:username    rahulshettyacademy
    Input Password    id:password    learning
    Click Element     css:input[value='user']
    Wait Until Element Is Visible    css:.modal-body
    Click Button     okayBtn
    Click Button     okayBtn
    Select From List By Value    css:select.form-control    teach
    Select Checkbox    terms
    Checkbox Should Be Selected    terms
    Click Button       signInBtn
    Sleep    5s