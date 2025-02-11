*** Settings ***
Library          SeleniumLibrary
Library          Collections
Library          String


Resource         ./resources/resource.robot

Test Setup
Test Teardown    Close Browser Session



*** Variables ***


*** Test Cases ***
Log into Shetty Academy Webpage with incorrect credentials
    [Tags]    SMOKE
    Set Selenium Implicit Wait    ${IMPLICIT_WAIT}

    Given the user open 'Chrome' browser and navigates to the 'https://rahulshettyacademy.com/loginpagePractise/' page

    Then the user enters 'rahulshettyacademy' and '12345' in the input fields and click 'Sign In' button

    And the user receives a error message

    Then the user verifies the error message text is 'Incorrect username/password.'

Log into Shetty Academy Webpage with correct credentials
    [Tags]    SMOKE
    
    Given the user open 'Chrome' browser and navigates to the 'https://rahulshettyacademy.com/loginpagePractise/' page

    Then the user enters 'rahulshettyacademy' and 'learning' in the input fields and click 'Sign In' button







    
    

