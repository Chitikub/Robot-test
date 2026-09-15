*** Settings ***
Resource    ../resources/variables.robot
Resource    ../resources/keyword.robot
Library     SeleniumLibrary

*** Test Cases ***
Login with wrong username
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Input Text    id=username    ${INVALID_USER}
    Input Text    id=password    ${VALID_PASS}
    Click Element    id=log-in

    # Invalid User
    Wait Until Element Is Visible    id=top_message    10s
    Element Text Should Be    id=top_message    Invalid Username!
    Capture Page Screenshot
   
    [Teardown]    Close Browser

Login with wrong password
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Input Text    id=username    ${VALID_USER}
    Input Text    id=password    ${INVALID_PASS}
    Click Element    id=log-in

    # Invalid User
    Wait Until Element Is Visible    id=top_message    10s
    Element Text Should Be    id=top_message    Invalid Password!
    Capture Page Screenshot  filename=ts2-wrong-password.png
   
    [Teardown]    Close Browser