*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LOGIN_URL}    https://seleniumbase.io/simple/login
${VALID_USER}   demo_user
${VALID_PASS}   secret_pass

*** Test Cases ***
Successful Login
    Open Browser    ${LOGIN_URL}    edge    options=page_load_strategy="normal"
    Maximize Browser Window
    Input Text      id=username    ${VALID_USER}
    Input Text      id=password    ${VALID_PASS}
    Click Element   id=log-in

    # Validate Login Success
    Wait Until Page Contains       Welcome!    10s
    Element Text Should Be         xpath=//h1  Welcome!

    [Teardown]    Close Browser