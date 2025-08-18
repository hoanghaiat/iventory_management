*** Settings ***
Library    SeleniumLibrary
Variables   ../variables/locator.py


*** Keywords ***
Open Browser To TaoMoiCauHoi
    # Open Browser    ${URL}    chrome
    Login   admin    demoadmin
Close Web
    Close All Browsers
Login
    [Arguments]    ${username}    ${password}
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Sleep    5s
    Wait Until Element Is Visible    ${BTN_HIDE}    30s
    Click Element    ${BTN_HIDE}
    Wait Until Element Is Visible    ${USERNAME_INPUT}    30s
    Input Text    ${USERNAME_INPUT}    ${username}
    Input Text    ${PASSWORD_INPUT}    ${password}
    Click Button    ${LOGIN_BUTTON}

Add a new question to the data field
    Wait Until Element Is Visible    ${URL_NEW_QUESTION}    20s
    Click Element    ${URL_NEW_QUESTION}
    Wait Until Element Is Visible    ${BUTTON_CREATE_QUESTION}    10s
    Scroll Element Into View    ${BUTTON_CREATE_QUESTION}
    # Nếu có overlay, hãy định nghĩa Close Debug Overlay. Nếu không, có thể bỏ dòng này.
Click Element Via Javascript
    [Arguments]    ${locator}
    Execute Javascript    arguments[0].click();    ${locator}
    Sleep    1s
    Click Element Via Javascript    ${BUTTON_CREATE_QUESTION}
Add new question
    Wait Until Element Is Visible    ${URL_NEW_QUESTION}    20s
    Click Element    ${URL_NEW_QUESTION}

    Wait Until Element Is Visible    ${POST_COURSE}     20s
    Select From List By Value    ${POST_COURSE}   29         #DSA201 - Cấu trúc dữ liệu và giải thuật
    Wait Until Element Is Visible    ${POST_CONTENT}     20s
    Input Text   ${POST_CONTENT}     Cấu trúc dữ liệu và giải thuật là gì?
    Wait Until Element Is Visible    ${POST_TYPE}     20s
    Select From List By Value    ${POST_TYPE}   practical
    Wait Until Element Is Visible    ${POST_DIFFICULTY}     20s
    Select From List By Value    ${POST_DIFFICULTY}   medium
    Wait Until Element Is Visible    ${POST_BLOOM}     20s
    Select From List By Value    ${POST_BLOOM}   apply
    Wait Until Element Is Visible    ${POST_STATUS}     20s
    Select From List By Value    ${POST_STATUS}   inactive
    Wait Until Element Is Visible    ${POST_APPROVAL_STATUS}     20s
    Select From List By Value    ${POST_APPROVAL_STATUS}   pending

    Wait Until Element Is Visible    ${BUTTON_CREATE_QUESTION}     10s
    Scroll Element Into View    ${BUTTON_CREATE_QUESTION}
    Sleep    10s
    Click Element     ${BUTTON_CREATE_QUESTION}
    Sleep    5s
Check the Course field
    Wait Until Element Is Visible    ${URL_NEW_QUESTION}    20s
    Click Element    ${URL_NEW_QUESTION}
    Wait Until Element Is Visible    ${POST_COURSE}     20s
    Select From List By Value    ${POST_COURSE}   29         #DSA201 - Cấu trúc dữ liệu và giải thuật

    Wait Until Element Is Visible    ${BUTTON_CREATE_QUESTION}     10s
    Scroll Element Into View    ${BUTTON_CREATE_QUESTION}
    Sleep    10s
    Click Element     ${BUTTON_CREATE_QUESTION}
    Sleep    5s
Check the Content field
    Wait Until Element Is Visible    ${URL_NEW_QUESTION}    20s
    Click Element    ${URL_NEW_QUESTION}
    Wait Until Element Is Visible    ${POST_CONTENT}     20s
    Input Text   ${POST_CONTENT}     Cấu trúc dữ liệu và giải thuật là gì?

    Wait Until Element Is Visible    ${BUTTON_CREATE_QUESTION}     10s
    Scroll Element Into View    ${BUTTON_CREATE_QUESTION}
    Sleep    10s
    Click Element     ${BUTTON_CREATE_QUESTION}
    Sleep    5s
Check the Type field
    Wait Until Element Is Visible    ${URL_NEW_QUESTION}    20s
    Click Element    ${URL_NEW_QUESTION}
    Wait Until Element Is Visible    ${POST_TYPE}     20s
    Select From List By Value    ${POST_TYPE}   practical

    Wait Until Element Is Visible    ${BUTTON_CREATE_QUESTION}     10s
    Scroll Element Into View    ${BUTTON_CREATE_QUESTION}
    Sleep    10s
    Click Element     ${BUTTON_CREATE_QUESTION}
    Sleep    5s
Check the Difficulty field
    Wait Until Element Is Visible    ${URL_NEW_QUESTION}    20s
    Click Element    ${URL_NEW_QUESTION}
    Wait Until Element Is Visible    ${POST_DIFFICULTY}     20s
    Select From List By Value    ${POST_DIFFICULTY}   medium

    Wait Until Element Is Visible    ${BUTTON_CREATE_QUESTION}     10s
    Scroll Element Into View    ${BUTTON_CREATE_QUESTION}
    Sleep    10s
    Click Element     ${BUTTON_CREATE_QUESTION}
    Sleep    5s

Check the Bloom field
    Wait Until Element Is Visible    ${URL_NEW_QUESTION}    20s
    Click Element    ${URL_NEW_QUESTION}
    Wait Until Element Is Visible    ${POST_BLOOM}     20s
    Select From List By Value    ${POST_BLOOM}   apply

    Wait Until Element Is Visible    ${BUTTON_CREATE_QUESTION}     10s
    Scroll Element Into View    ${BUTTON_CREATE_QUESTION}
    Sleep    10s
    Click Element     ${BUTTON_CREATE_QUESTION}
    Sleep    5s
Check the Status field
    Wait Until Element Is Visible    ${URL_NEW_QUESTION}    20s
    Click Element    ${URL_NEW_QUESTION}
    Wait Until Element Is Visible    ${POST_STATUS}     20s
    Select From List By Value    ${POST_STATUS}   inactive
    
    Wait Until Element Is Visible    ${BUTTON_CREATE_QUESTION}     10s
    Scroll Element Into View    ${BUTTON_CREATE_QUESTION}
    Sleep    10s
    Click Element     ${BUTTON_CREATE_QUESTION}
    Sleep    5s
Check the Approval Status field
    Wait Until Element Is Visible    ${URL_NEW_QUESTION}    20s
    Click Element    ${URL_NEW_QUESTION}
    Wait Until Element Is Visible    ${POST_APPROVAL_STATUS}     20s
    Select From List By Value    ${POST_APPROVAL_STATUS}   pending

    Wait Until Element Is Visible    ${BUTTON_CREATE_QUESTION}     10s
    Scroll Element Into View    ${BUTTON_CREATE_QUESTION}
    Sleep    10s
    Click Element     ${BUTTON_CREATE_QUESTION}
    Sleep    5s
Back to Question Bank
    Wait Until Element Is Visible    ${URL_NEW_QUESTION}    20s
    Click Element    ${URL_NEW_QUESTION}

    Wait Until Element Is Visible    ${BUTTON_BACK}     10s
    Click Element     ${BUTTON_BACK}
    Sleep    3s
Manage Tags navigation
    Wait Until Element Is Visible    ${URL_MANAGE_TAGS}    20s
    Click Element    ${URL_MANAGE_TAGS}
    Sleep    3s
Import Questions navigation
    Wait Until Element Is Visible    ${URL_IMPORT_QUESTION}    30s
    Scroll Element Into View    ${URL_IMPORT_QUESTION}
    Click Element    ${URL_IMPORT_QUESTION}
    Sleep    3s
