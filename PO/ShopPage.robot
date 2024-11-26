*** Settings ***
Documentation    All the page objects and keywords of the Landing page
Library          SeleniumLibrary
Library          Collections
Resource         ../PO/Generic.robot

*** Variables ***
${shop_card_elements}     css:.card-title
@{list_of_products}    Blackberry    Nokia Edge
${shop_page_load}         css:.nav-link
${url}    https://rahulshettyacademy.com/loginpagePractise/

*** Keywords ***
Wait until element is visible on page
    Wait Until element passed is located on Page    ${shop_page_load}

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