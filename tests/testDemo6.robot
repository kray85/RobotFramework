*** Settings ***
Documentation    To Validate the Login form
Library          SeleniumLibrary
Library          Collections
Library          ../customLibraries/Shop.py
Test Setup       Open the browser with the Mortgage payment url
Suite Setup
Suite Teardown
Test Teardown    Close Browser
Resource         ../PO/Generic.robot
Resource         ../PO/LandingPage.robot
Resource         ../PO/ShopPage.robot


*** Variables ***
@{list_of_products}    Blackberry    Nokia Edge


*** Test Cases ***
#Validate UnSuccessful Login
#    LandingPage.Fill the login form    ${username}    ${invalid_password}
#    LandingPage.Wait until element is visible on page
#    LandingPage.Verify error message is correct


Validate cards display in the Shopping page
    LandingPage.Fill the login form    ${username}    ${valid_password}
    ShopPage.Wait until element is visible on page
    ShopPage.Verify card titles in the shop page
    Add Items To Cart And Checkout    ${list_of_products}
    Validate Items In Checkout Page And Checkout    ${list_of_products}
    Sleep    5s

#    Select the Card    Nokia Edge

#Select the form and navigate to child window
#    LandingPage.Fill in the Login Details and Login Form


