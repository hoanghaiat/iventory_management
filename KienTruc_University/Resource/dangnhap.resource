*** Settings ***
Library    SeleniumLibrary
Variables  ../variables/locator.py

*** Variables ***
${BROWSER}    chrome
# Nếu URL chưa có trong locator.py thì mở dòng dưới:
${URL}        https://demo-clo.minds.vn

*** Keywords ***
Login To System
    [Arguments]    ${username}    ${password}
    # Mở trực tiếp trang login EN
    Open Browser    ${URL}/en/accounts/login/?next=/en/    chrome
    Maximize Browser Window

    # Chờ input username xuất hiện
    Wait Until Element Is Visible    ${USERNAME_INPUT}    30s
    Input Text    ${USERNAME_INPUT}    ${username}
    Input Text    ${PASSWORD_INPUT}    ${password}
    Click Button   ${LOGIN_BUTTON}

    # Chờ login thành công bằng nhiều dấu hiệu (aside/nav/sidebar/link Question Bank)
    Wait Until Page Contains Element
    ...    xpath=//aside | //nav | //a[contains(@href, '/questionbank/')] | //*[contains(@class,'sidebar')]
    ...    45s

    # Kiểm tra nếu vẫn ở trang login → fail rõ ràng
    ${still_login}=    Run Keyword And Return Status    Page Should Contain Element    ${USERNAME_INPUT}
    IF    ${still_login}
        Capture Page Screenshot
        Log Location
        Log Source
        Fail    Login failed: Vẫn ở trang login. Kiểm tra username/password hoặc locator.
    END
 

