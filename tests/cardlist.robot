*** Settings ***
Documentation    To Validate the Login form
Library          SeleniumLibrary
Library          Collections
Library          ../customLibraries/Shop.py
Library          ../customLibraries/OpenBrowser.py
Library    ../.venv/Lib/site-packages/robot/libraries/XML.py
Test Setup       Open Page    https://rahulshettyacademy.com/loginpagePractise/    ${browser_name}    windows
Test Teardown    Close Browser
Suite Setup
Suite Teardown
Resource         ../PO/Generic.robot
Resource         ../PO/LandingPage.robot
Resource         ../PO/ShopPage.robot


*** Variables ***


*** Test Cases ***
Fill the login form
    [Tags]    SMOKE
    Fill the login form    ${username}    ${valid_password}
    Get Card Items
    

*** Keywords ***

Fill the login form
    [Arguments]       ${username}    ${password}
    Input Text        id:username    ${username}
    Input Password    id:password    ${password}
    Click Button      signInBtn
    
Get Card Items
    ${card_items}=   Get WebElements    xpath://app-card
    Get Card List Items    ${card_items}        Blackberry
    Sleep    10s
    
    FOR    ${card_item}    IN    @{card_items}
        ${card_text}    Get Text    ${card_item}
        
        
    END
