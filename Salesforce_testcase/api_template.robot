*** Settings ***
Library           RequestsLibrary
Resource          ../resources/main_resources.robot
*** Variables ***
${BASE_URL}       https://jsonplaceholder.typicode.com

*** Test Cases ***
Get Posts Should Return 200
    [Documentation]    This test case checks if the GET request to the posts endpoint returns a 200 status code.
    [Tags]    api   jsonplaceholder
    [Setup]    Create Session    jsonplaceholder    ${BASE_URL}         
    
    Create Session    jsonplaceholder    ${BASE_URL}
    ${response}=      Get Request    jsonplaceholder    /posts
    Should Be Equal As Integers    ${response.status_code}    200