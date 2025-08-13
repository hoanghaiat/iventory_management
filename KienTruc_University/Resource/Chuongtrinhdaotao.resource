*** Settings ***
Library    SeleniumLibrary
Variables  ../variables/locator.py

*** Variables ***
${URL}    https://demo-clo.minds.vn/
${USERNAME_INPUT}  xpath=//input[@id='id_username']
${PASSWORD_INPUT}  xpath=//input[@id='id_password']
${LOGIN_BUTTON}    xpath=//button[text()='Đăng nhập']

*** Keywords ***
Open Chrome Browser
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --disable-gpu
    Call Method    ${options}    add_argument    --disable-speech-api
    Call Method    ${options}    add_argument    --disable-software-rasterizer
    Open Browser    ${URL}    chrome    options=${options}
Login To System
    [Arguments]    ${username}    ${password}
    Open Browser    ${URL}    chrome
    Wait Until Element Is Visible    ${USERNAME_INPUT}    30s
    Input Text    ${USERNAME_INPUT}    ${username}
    Input Text    ${PASSWORD_INPUT}    ${password}
    Click Button    ${LOGIN_BUTTON}
    Location Should Contain        https://demo-clo.minds.vn/ 

Wait Until Element Is Clickable
    [Arguments]    ${BTN_coursemanagement}    ${timeout}
    Wait Until Element Is Visible    ${BTN_coursemanagement}    ${timeout}
    # Add logic here if needed to ensure the element is clickable
Search Program In Training
    [Arguments]    ${INPUT_KEYWORD}
    # Mở trang Chương trình đào tạo
    Wait Until Element Is Visible    ${Menu_ProGram}    30s
    Scroll Element Into View         ${Menu_ProGram}
    Click Element                    ${Menu_ProGram}

    # Nhập từ khóa tìm kiếm
    Wait Until Element Is Visible    ${TXT_SEARCH}    30s
    Input Text                       ${TXT_SEARCH}    ${INPUT_KEYWORD}
    Click Element                    ${BTN_SEARCH}
    Wait Until Page Contains         ${INPUT_KEYWORD}

    # Quay lại trang Chương trình đào tạo ban đầu
    Click Element                    ${Menu_ProGram}
    Wait Until Element Is Visible    ${TXT_SEARCH}    30s
    Clear Element Text               ${TXT_SEARCH}
    Click Element                    ${BTN_SEARCH}
    Wait Until Page Contains         All Programs   

Click Next Page
    # Cuộn xuống và sang trang 2
    Wait Until Element Is Visible    ${CLICK_NEXT}   10s
    Scroll Element Into View         ${CLICK_NEXT}
    Sleep    1s
    Click Element                    ${CLICK_NEXT}

    # Kiểm tra đã sang trang 2 
    Wait Until Element Is Visible    xpath=//li[@class='page-item active']/a[text()='2']    10s
    Location Should Contain          page=2