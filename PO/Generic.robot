*** Settings ***
Documentation    A resource file with reusable keywords and variables
...              The system specific keywords created here form our own
...              domain specific language.  They utilize keywords provided
...              by the imported SeleniumLibrary.
Library    SeleniumLibrary
*** Variables ***
${BROWSER}                Chrome
${username}               rahulshettyacademy
${invalid_password}       123456
${valid_password}         learning
${url}                    https://rahulshettyacademy.com/loginpagePractise/
${browser_name}           Chrome

*** Variables ***



*** Keywords ***
Open the browser with the Mortgage payment url
    ${service}=    Evaluate    sys.modules['selenium.webdriver.chrome.service'].Service(executable_path='D:/source/PythonProject/RobotFramework/drivers/chromedriver.exe')    sys, selenium.webdriver
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Create Webdriver    ${BROWSER}    service=${service}    options=${options}
    Go To    ${url}

open the browser with the url
    [Arguments]    ${browser_name}
    Create Webdriver    ${browser_name}    D:/source/PythonProject/RobotFramework/drivers/chromedriver.exe'
    Go To    ${url}

Wait Until element passed is located on Page
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}