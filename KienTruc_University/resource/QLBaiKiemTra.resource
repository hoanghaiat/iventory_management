*** Settings ***
Library    SeleniumLibrary
Variables   ../variables/locator.py


*** Keywords ***
Open Browser To BaiKiemTra
    # Open Browser    ${URL}    chrome
    Login   admin    demoadmin
Close Web
    Close All Browsers
Login
    [Arguments]    ${username}    ${password}
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Wait Until Element Is Visible    ${BTN_HIDE}    30s
    Click Element    ${BTN_HIDE}
    Wait Until Element Is Visible    ${USERNAME_INPUT}    30s
    Input Text    ${USERNAME_INPUT}    ${username}
    Input Text    ${PASSWORD_INPUT}    ${password}
    Click Button    ${LOGIN_BUTTON}
Navigate My Classes page
    Wait Until Element Is Visible    ${URL_TEST}    20s
    Click Element    ${URL_TEST}
    Wait Until Element Is Visible    ${NAV_MY_CLASSES}    20s
    Click Element    ${NAV_MY_CLASSES}
    Sleep    3s
Navigate Link Courses
    Wait Until Element Is Visible    ${URL_TEST}    20s
    Click Element    ${URL_TEST}
    Wait Until Element Is Visible    ${NAV_COURSES}    20s
    Click Element    ${NAV_COURSES}
    Sleep    3s
View Test
    Wait Until Element Is Visible    ${URL_TEST}    20s
    Click Element    ${URL_TEST}
    Wait Until Element Is Visible    ${BTN_VIEW}    20s
    Click Element    ${BTN_VIEW}
    Sleep    3s
Help Test
    Wait Until Element Is Visible    ${URL_TEST}    20s
    Click Element    ${URL_TEST}
    Wait Until Element Is Visible    ${BTN_HELP}    20s
    Click Element    ${BTN_HELP}
    Sleep    3s
Grade Test
    Wait Until Element Is Visible    ${URL_TEST}    20s
    Click Element    ${URL_TEST}
    Wait Until Element Is Visible    ${BTN_GRADE}    20s
    Click Element    ${BTN_GRADE}
    Sleep    3s
Export Test
    Wait Until Element Is Visible    ${URL_TEST}    20s
    Click Element    ${URL_TEST}
    Wait Until Element Is Visible    ${BTN_EXPORT}    20s
    Click Element    ${BTN_EXPORT}
    Sleep    3s

Check the filter
    Wait Until Element Is Visible    ${URL_TEST}    20s
    Click Element    ${URL_TEST}
    Sleep    5s 
    Wait Until Page Contains Element    ${FILTER_ALL}    20s
    Scroll Element Into View    ${FILTER_ALL}
    Click Element    ${FILTER_ALL}
    Sleep    2s

    Wait Until Page Contains Element    ${FILTER_MIDTERM}    20s
    Scroll Element Into View    ${FILTER_MIDTERM}
    Click Element    ${FILTER_MIDTERM}
    Sleep    2s

    Wait Until Page Contains Element    ${FILTER_FINAL}    20s
    Scroll Element Into View    ${FILTER_FINAL}
    Click Element    ${FILTER_FINAL}
    Sleep    2s

    Wait Until Page Contains Element    ${FILTER_QUIZ}    20s
    Scroll Element Into View    ${FILTER_QUIZ}
    Click Element    ${FILTER_QUIZ}
    Sleep    2s

    Wait Until Page Contains Element    ${FILTER_ASIGNMENT}    20s
    Scroll Element Into View    ${FILTER_ASIGNMENT}
    Click Element    ${FILTER_ASIGNMENT}
    Sleep    2s

    Wait Until Page Contains Element    ${FILTER_PROJECT}    20s
    Scroll Element Into View    ${FILTER_PROJECT}
    Click Element    ${FILTER_PROJECT}
    Sleep    2s