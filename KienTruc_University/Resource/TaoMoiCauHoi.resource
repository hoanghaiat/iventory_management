*** Settings ***
Library    SeleniumLibrary
Variables  ../variables/locator.py

*** Variables ***
${BROWSER}    chrome
# Nếu URL chưa có trong locator.py thì mở dòng dưới:
${URL}        https://demo-clo.minds.vn

*** Keywords ***
Open Browser To TaoMoiCauHoi
    [Documentation]    Đăng nhập và vào hệ thống (mặc định tài khoản admin)
    Login    admin    demoadmin
Login
    [Arguments]    ${username}    ${password}
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    ${BTN_HIDE}    30s
    Click Element    ${BTN_HIDE}
    Wait Until Element Is Visible    ${USERNAME_INPUT}    30s
    Input Text    ${USERNAME_INPUT}    ${username}
    Input Text    ${PASSWORD_INPUT}    ${password}
    Click Button   ${LOGIN_BUTTON}
Go to Question Bank
    [Arguments]    ${Menu_QUEST}
    [Documentation]    Truy cập vào menu Duyệt Câu hỏi
    [Tags]    honghanh    duyệt câu hỏi
    Wait Until Element Is Visible    ${Menu_QUEST}    20s
    Click Element    ${Menu_QUEST}   
Add a new question to the data field
    Wait Until Element Is Visible    ${URL_NEW_QUESTION}    20s
    Click Element    ${URL_NEW_QUESTION}
    Wait Until Element Is Visible    ${BUTTON_CREATE_QUESTION}    10s
    Scroll Element Into View         ${BUTTON_CREATE_QUESTION}
    Sleep    1s
    Click Element    ${BUTTON_CREATE_QUESTION}

Add new question
    Wait Until Element Is Visible    ${URL_NEW_QUESTION}    20s
    Click Element    ${URL_NEW_QUESTION}
    Wait Until Element Is Visible    ${POST_COURSE}    20s
    Select From List By Value        ${POST_COURSE}    29
    Wait Until Element Is Visible    ${POST_CONTENT}   20s
    Input Text                       ${POST_CONTENT}   Cấu trúc dữ liệu và giải thuật là gì?
    Wait Until Element Is Visible    ${POST_TYPE}      20s
    Select From List By Value        ${POST_TYPE}      practical
    Wait Until Element Is Visible    ${POST_DIFFICULTY}    20s
    Select From List By Value        ${POST_DIFFICULTY}    medium
    Wait Until Element Is Visible    ${POST_BLOOM}     20s
    Select From List By Value        ${POST_BLOOM}     apply
    Wait Until Element Is Visible    ${POST_STATUS}    20s
    Select From List By Value        ${POST_STATUS}    inactive
    Wait Until Element Is Visible    ${POST_APPROVAL_STATUS}    20s
    Select From List By Value        ${POST_APPROVAL_STATUS}    pending
    Wait Until Element Is Visible    ${BUTTON_CREATE_QUESTION}    10s
    Scroll Element Into View         ${BUTTON_CREATE_QUESTION}
    Sleep    1s
    Click Element                    ${BUTTON_CREATE_QUESTION}
    Sleep    1s

Check the Course field
    Wait Until Element Is Visible    ${URL_NEW_QUESTION}    20s
    Click Element    ${URL_NEW_QUESTION}
    Wait Until Element Is Visible    ${POST_COURSE}   20s
    Select From List By Value        ${POST_COURSE}   29
    Wait Until Element Is Visible    ${BUTTON_CREATE_QUESTION}    10s
    Scroll Element Into View         ${BUTTON_CREATE_QUESTION}
    Click Element                    ${BUTTON_CREATE_QUESTION}
    Sleep    1s

Check the Content field
    Wait Until Element Is Visible    ${URL_NEW_QUESTION}    20s
    Click Element    ${URL_NEW_QUESTION}
    Wait Until Element Is Visible    ${POST_CONTENT}   20s
    Input Text                       ${POST_CONTENT}   Cấu trúc dữ liệu và giải thuật là gì?
    Wait Until Element Is Visible    ${BUTTON_CREATE_QUESTION}    10s
    Scroll Element Into View         ${BUTTON_CREATE_QUESTION}
    Click Element                    ${BUTTON_CREATE_QUESTION}
    Sleep    1s

Check the Type field
    Wait Until Element Is Visible    ${URL_NEW_QUESTION}    20s
    Click Element    ${URL_NEW_QUESTION}
    Wait Until Element Is Visible    ${POST_TYPE}      20s
    Select From List By Value        ${POST_TYPE}      practical
    Wait Until Element Is Visible    ${BUTTON_CREATE_QUESTION}    10s
    Scroll Element Into View         ${BUTTON_CREATE_QUESTION}
    Click Element                    ${BUTTON_CREATE_QUESTION}
    Sleep    1s

Check the Difficulty field
    Wait Until Element Is Visible    ${URL_NEW_QUESTION}    20s
    Click Element    ${URL_NEW_QUESTION}
    Wait Until Element Is Visible    ${POST_DIFFICULTY}    20s
    Select From List By Value        ${POST_DIFFICULTY}    medium
    Wait Until Element Is Visible    ${BUTTON_CREATE_QUESTION}    10s
    Scroll Element Into View         ${BUTTON_CREATE_QUESTION}
    Click Element                    ${BUTTON_CREATE_QUESTION}
    Sleep    1s

Check the Bloom field
    Wait Until Element Is Visible    ${URL_NEW_QUESTION}    20s
    Click Element    ${URL_NEW_QUESTION}
    Wait Until Element Is Visible    ${POST_BLOOM}     20s
    Select From List By Value        ${POST_BLOOM}     apply
    Wait Until Element Is Visible    ${BUTTON_CREATE_QUESTION}    10s
    Scroll Element Into View         ${BUTTON_CREATE_QUESTION}
    Click Element                    ${BUTTON_CREATE_QUESTION}
    Sleep    1s

Check the Status field
    Wait Until Element Is Visible    ${URL_NEW_QUESTION}    20s
    Click Element    ${URL_NEW_QUESTION}
    Wait Until Element Is Visible    ${POST_STATUS}    20s
    Select From List By Value        ${POST_STATUS}    inactive
    Wait Until Element Is Visible    ${BUTTON_CREATE_QUESTION}    10s
    Scroll Element Into View         ${BUTTON_CREATE_QUESTION}
    Click Element                    ${BUTTON_CREATE_QUESTION}
    Sleep    1s

Check the Approval Status field
    Wait Until Element Is Visible    ${URL_NEW_QUESTION}    20s
    Click Element    ${URL_NEW_QUESTION}
    Wait Until Element Is Visible    ${POST_APPROVAL_STATUS}    20s
    Select From List By Value        ${POST_APPROVAL_STATUS}    pending
    Wait Until Element Is Visible    ${BUTTON_CREATE_QUESTION}    10s
    Scroll Element Into View         ${BUTTON_CREATE_QUESTION}
    Click Element                    ${BUTTON_CREATE_QUESTION}
    Sleep    1s

Back to Question Bank
    Wait Until Element Is Visible    ${URL_NEW_QUESTION}    20s
    Click Element    ${URL_NEW_QUESTION}
    Wait Until Element Is Visible    ${BUTTON_BACK}    10s
    Click Element                    ${BUTTON_BACK}
    Sleep    1s

Manage Tags navigation
    Wait Until Element Is Visible    ${URL_MANAGE_TAGS}    20s
    Click Element    ${URL_MANAGE_TAGS}
    Sleep    1s

Import Questions navigation
    Wait Until Element Is Visible    ${URL_IMPORT_QUESTION}    20s
    Click Element    ${URL_IMPORT_QUESTION}
    Sleep    1s
