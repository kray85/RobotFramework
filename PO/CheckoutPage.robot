*** Settings ***
Documentation    All the page objects and keywords of the Landing page
Library          SeleniumLibrary
Library          Collections

*** Variables ***
${shop_card_elements}     css:.card-title
@{list_of_products}    Blackberry    Nokia Edge
${shop_page_load}         css:.nav-link

*** Keywords ***

