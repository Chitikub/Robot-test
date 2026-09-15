keyword.robot
*** Keywords ***
Login with Successful
    Open Browser    ${LOGIN_URL}    chrome
    Input Text    id=username    ${VALID_USER}
    Input Text    id=password    ${VALID_PASS}
    Click Element    id=log-in