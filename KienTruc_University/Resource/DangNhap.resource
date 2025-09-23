*** Settings ***
Library    SeleniumLibrary    run_on_failure=Nothing

Variables    ../locator.py

*** Variables ***
${URL}    https://demo-clo.minds.vn/

*** Keywords ***

Open Applications
    Open Browser    ${URL}    chrome
    Maximize Browser Window

Enter Credential
    [Arguments]    ${username}    ${password}
    Wait Until Element Is Visible    ${USERNAME_INPUT}    30s
    Input Text    ${USERNAME_INPUT}    ${username}
    Input Text    ${PASSWORD_INPUT}    ${password}

Click Login Button
    Click Button    ${LOGIN_BUTTON}

Verify Login Successful
    Location Should Contain    https://demo-clo.minds.vn/en/
    Wait Until Element Is Visible    //div[@class="logo"]    30s
    Page Should Contain Element    //div[@class="logo"]
    Wait Until Element Is Visible    //div[@class="user-avatar"]    30s
    Page Should Contain Element    //div[@class="user-avatar"]

Verify Login Error
    ${MESSAGE_V}    Set Variable    Tên đăng nhập hoặc mật khẩu không đúng. Vui lòng thử lại.
    ${MESSAGE_E}    Set Variable     Please enter a correct username and password. Note that both fields may be case-sensitive.

    Wait Until Element Is Visible    ${MESSAGE_ERROR_LOGIN_V}    30s
    ${Actual_Message_V}=    Get Text    ${MESSAGE_ERROR_LOGIN_V}
    
    Wait Until Element Is Visible    ${MESSAGE_ERROR_LOGIN_E}    30s
    ${Actual_Message_E}=    Get Text    ${MESSAGE_ERROR_LOGIN_E}

    Should Be Equal    ${Actual_Message_V}    ${MESSAGE_V}
    Should Be Equal    ${Actual_Message_E}    ${MESSAGE_E}


Enter Username
    [Arguments]    ${username}
    Wait Until Element Is Visible    ${USERNAME_INPUT}    30s
    Input Text    ${USERNAME_INPUT}    ${username}
Enter Password
    [Arguments]    ${password}
    Wait Until Element Is Visible    ${USERNAME_INPUT}    30s
    Input Text    ${USERNAME_INPUT}    ${password}

Verify Login Failed Due To Blank Password or User Name
    Location Should Contain    ${URL}