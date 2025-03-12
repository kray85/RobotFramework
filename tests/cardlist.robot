*** Settings ***
Documentation    To Validate the Login form
Library          SeleniumLibrary
Library          Collections
Library          ../customLibraries/Shop.py
Library          ../customLibraries/OpenBrowser.py
Library    ../.venv/Lib/site-packages/robot/libraries/XML.py
Test Setup       Open Page    http://127.0.0.1:5500/index.html    ${browser_name}    windows
# Test Setup       Open Page    https://rahulshettyacademy.com/loginpagePractise/    ${browser_name}    windows
Test Teardown    Close Browser
Suite Setup
Suite Teardown
Resource         ../PO/Generic.robot
Resource         ../PO/LandingPage.robot
Resource         ../PO/ShopPage.robot


*** Variables ***
@{CITIES}=        New York    Chicago    San Antonio    Fort Worth


*** Test Cases ***
Get the card list item
#     [Tags]    SMOKE
    Get Card Items
    

*** Keywords ***


Get Card Items
    FOR    ${element}    IN    @{CITIES}
        Log    ${element}
        ${city_items}=    Get Card List Items       css:.city       ${element}
        
    END

    Sleep    20s
