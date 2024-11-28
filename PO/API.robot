*** Settings ***
Documentation    All the page objects and keywords for the API
Library    ../customLibraries/API.py

*** Variables ***
${base_url}    https://rahulshettyacademy.com


*** Keywords ***
Add New Book to Library
    Add Book To New Library    ${base_url}    Building custom libraries with selenium    dlof    2652    Jason Todd

Add New Book to Library Failure
    Add Book To Library Fail   ${base_url}    Testing API with Robot