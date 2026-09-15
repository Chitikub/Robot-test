*** Settings ***
Resource    ../resources/variables.robot
Resource    ../resources/keyword.robot
Library     SeleniumLibrary


*** Test Cases ***
Successful Login
    [Documentation]    Test case to login Successful
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Input Text    id=username    ${VALID_USER}
    Input Text    id=password    ${VALID_PASS}
    Click Element    id=log-in
    Capture Page Screenshot
    [Teardown]    Close Browser

Successful Login with Validate
    Login with Successful

    # Validate Login Success
    Wait Until Element Is Visible    xpath=//h1    10s
    Element Text Should Be    xpath=//h1    Welcome!
    Capture Page Screenshot    filename=validate1.png

    [Teardown]    Close Browser

Successful Login with Validate Text and Image
    Open Browser    ${LOGIN_URL}    chrome
    Input Text    id=username    ${VALID_USER}
    Input Text    id=password    ${VALID_PASS}
    Click Element    id=log-in

    # Validate
    Wait Until Page Contains    Welcome!    10s
    Element Text Should Be    xpath=//h1    Welcome!
    Page Should Contain Element    id=image1
    Capture Page Screenshot    filename=validate2.png

    [Teardown]    Close Browser
