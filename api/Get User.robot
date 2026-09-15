*** Settings ***
Resource    ../resources/variables.robot
Library    RequestsLibrary

*** Test Cases ***
Get User
    ${response}=    GET    ${BASE_URL}/users/1
    Status Should Be    200    ${response}