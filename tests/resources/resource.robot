*** Settings ***
Documentation     A resource file with reusable keywords and variables for the test cases
...
...               The system specific keywords created here form our own 
...               domain specific language. They utilize keywords provided by the
...               by the imported SeleniumLibrary.
...    

Library           SeleniumLibrary

*** Variables ***


*** Keywords ***
the user open '${browser_name}' browser and navigates to the '${url}' page
    [Documentation]
    ...   This keyword opens the browser and navigates to the page
    ...    with the given URL
    ...    

    Open Page   ${url}    ${browser_name}    windows
    
Close Browser Session
    Close Browser
