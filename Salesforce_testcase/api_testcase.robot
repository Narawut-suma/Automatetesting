
*** Settings ***
Resource          ../resources/main_resources.robot
Test Template     Login With Valid Credentials

*** Variables ***
@{USER DATA}
...    user1    pass1
...    user2    pass2
...    user3    pass3

*** Test Cases ***
Login Test 1    ${USER DATA}[0]    ${USER DATA}[1]
Login Test 2    ${USER DATA}[2]    ${USER DATA}[3]
Login Test 3    ${USER DATA}[4]    ${USER DATA}[5]

*** Keywords ***
Login With Valid Credentials
    [Arguments]    ${username}    ${password}
    Log    Logging in with username=${username} and password=${password}
