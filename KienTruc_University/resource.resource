*** Settings ***
Library    SeleniumLibrary
Variables  locator.py

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
    

Go To Course Management
    [Documentation]    Mở mục Thao tác nhanh và click vào Quản lý học phần
    Wait Until Element Is Visible    ${BTN_coursemanagement}    30s
    Scroll Element Into View         ${BTN_coursemanagement}
    Wait Until Element Is Clickable  ${BTN_coursemanagement}    30s
    Wait Until Element Is Not Visible    xpath=//a[@class='CachePanel']    30s
    Click Element                    ${BTN_coursemanagement}
    Wait Until Element Is Visible    ${Menu_HP}    50s
    Element Should Contain           ${Menu_HP}    Học phần 
Go To Home Page
    [Documentation]    Click vào nút Trang chủ để quay lại trang chủ
    Wait Until Element Is Visible    ${BTN_HOME}    30s
    Scroll Element Into View         ${BTN_HOME}
    Wait Until Element Is Clickable  ${BTN_HOME}    30s
    Click Element                    ${BTN_HOME}
    Wait Until Element Is Visible    ${Menu_HOME}    50s
    Element Should Contain           ${Menu_HOME}    Trang chủ
Go To Course Test
    [Documentation]    Mở mục Thao tác nhanh và click vào Quản lý bài kiểm tra
    Wait Until Element Is Visible    ${BTN_TEST}    30s
    Execute Javascript    arguments[0].scrollIntoView({block: "center"});    ${BTN_TEST}
    Wait Until Element Is Clickable  ${BTN_TEST}    30s
    Execute Javascript    arguments[0].click();    ${BTN_TEST}
    Wait Until Element Is Visible    ${Menu_BKT}    50s
    Element Should Contain           ${Menu_BKT}    Bài kiểm tra

