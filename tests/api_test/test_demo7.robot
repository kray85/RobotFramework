*** Settings ***
Library    Collections
Library    RequestsLibrary
Library    ../../customLibraries/API.py
Resource    ../../PO/API.robot


*** Variables ***
${book_id}
${book_name}    Learn Robot/Selenium Frameworks


*** Test Cases ***
#Add New Book to Library
#    API.Add New Book to Library
#Add New Book to Library Failure
#    API.Add New Book to Library Failure


#Play around with Dictionary
#    &{data}=    Create Dictionary    name=rahulshetty    course=robot    website=rahulshettyacademy.com
#    Log    ${data}
#    Dictionary Should Contain Key    ${data}    name
#    Log    ${data}[name]
#    ${url}=    Get From Dictionary    ${data}     course


Add Book into Library Database
    &{req_body}=    Create Dictionary    name=${book_name}    isbn=sffsdf    aisle=34563    author=Jason Todd
    ${response}=    POST    ${base_url}/Library/Addbook.php    json=${req_body}
#    Status Should Be    200
    log    ${response.json()}
    Dictionary Should Contain Key    ${response.json()}    ID
    ${book_id}=    Get From Dictionary    ${response.json()}    ID
    Set Global Variable    ${book_id}
    Log    ${book_id}
    Dictionary Should Contain Key    ${response.json()}    Msg
    ${book_msg}=    Get From Dictionary    ${response.json()}    Msg
    Log    ${book_msg}
    Should Be Equal As Strings    ${response.json()}[Msg]    successfully added


Get the Book Details for Current Book added
    ${get_response}=    GET    ${base_url}/Library/GetBook.php    params=ID=${book_id}    expected_status=200
    log    ${get_response.json()}
    Should Be Equal As Strings    ${book_name}    ${get_response.json()}[0][book_name]