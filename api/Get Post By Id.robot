*** Settings ***
Library    RequestsLibrary
Resource    ../resources/variables.robot


*** Test Cases ***
Get Post By Id
    ${response}=    GET    ${BASE_URL}/posts/1

    Status Should Be    200    ${response}

    Log    ${response.text}
    Log    ${response.json()}

    Should Be Equal As Integers
    ...    ${response.json()}[id]
    ...    1