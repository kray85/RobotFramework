*** Settings ***
Library    Collections
Library    RequestsLibrary
Library    ../../customLibraries/API.py
Resource    ../../PO/API.robot






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
    &{req_body}=    Create Dictionary    name=Learn Robot/Selenium Frameworks    isbn=teryerty    aisle=5364    author=Jason Todd
    ${response}=    POST    ${base_url}/Library/Addbook.php    json=${req_body}
#    Status Should Be    200
    log    ${response.json()}
    Dictionary Should Contain Key    ${response.json()}    ID
    ${book_id}=    Get From Dictionary    ${response.json()}    ID
    Log    ${book_id}
    Dictionary Should Contain Key    ${response.json()}    Msg
    ${book_msg}=    Get From Dictionary    ${response.json()}    Msg
    Log    ${book_msg}
    Should Be Equal As Strings    ${response.json()}[Msg]    successfully added
