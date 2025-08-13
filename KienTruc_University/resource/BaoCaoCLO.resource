*** Settings ***
Library    SeleniumLibrary
Variables   ../variables/locator.py
Library    OperatingSystem


*** Keywords ***
Open Browser To BaoCaoCLO
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
Check the report button
    Wait Until Element Is Visible    ${URL_REPORT_CLO}    20s
    Click Element    ${URL_REPORT_CLO}
    Sleep    3s
    Wait Until Element Is Visible    ${BTN_VIEW_CLO}    20s
    Click Element    ${BTN_VIEW_CLO}
    Sleep    3s

check print report button
    Wait Until Element Is Visible    ${URL_REPORT_CLO}    20s
    Click Element    ${URL_REPORT_CLO}
    Sleep    3s
    Wait Until Element Is Visible    ${BTN_PRINT_CLO}    20s
    Click Element    ${BTN_PRINT_CLO}
    Sleep    3s
Back to Reports
    Wait Until Element Is Visible    ${URL_REPORT_CLO}    20s
    Click Element    ${URL_REPORT_CLO}
    Sleep    3s
    Wait Until Element Is Visible    ${BTN_VIEW_CLO}    20s
    Click Element    ${BTN_VIEW_CLO}
    Sleep    3s
    Wait Until Element Is Visible    ${BTN_BACK_CLO}    20s
    Click Element    ${BTN_BACK_CLO}
    Sleep    3s
Search for reports with empty keywords
    Wait Until Element Is Visible    ${URL_REPORT_CLO}    20s
    Click Element    ${URL_REPORT_CLO}

    Wait Until Element Is Visible    ${BTN_SEARCH_CLO}    10s
    Click Element    ${BTN_SEARCH_CLO}
    Wait Until Page Contains Element    ${BTN_SEARCH_CLO}    20s
   
    Wait Until Page Contains Element    ${RESULT_TABLE_CLO}    10s
    Sleep    10s
    Scroll Element Into View    ${RESULT_TABLE_CLO}
    Wait Until Page Contains Element    ${RESULT_TABLE_CLO}    30s
    Sleep    10s

Search for reports with valid keywords
    [Arguments]    ${keywords}
    Wait Until Element Is Visible    ${URL_REPORT_CLO}    20s
    Click Element    ${URL_REPORT_CLO}
    Wait Until Element Is Visible    ${INPUT_SEARCH_CLO}    20s
    Input Text   ${INPUT_SEARCH_CLO}      ${keywords}

    Wait Until Element Is Visible    ${BTN_SEARCH_CLO}    20s
    Click Element    ${BTN_SEARCH_CLO}
    Wait Until Page Contains Element    ${BTN_SEARCH_CLO}    30s
   
    Wait Until Page Contains Element    ${RESULT_TABLE_CLO}    10s
    Sleep    10s
    Scroll Element Into View    ${RESULT_TABLE_CLO}
    Wait Until Page Contains Element    ${RESULT_TABLE_CLO}    30s
    Sleep    10s
Search for reports with invalid keywords
    [Arguments]    ${keywords}
    Wait Until Element Is Visible    ${URL_REPORT_CLO}    20s
    Click Element    ${URL_REPORT_CLO}
    Wait Until Element Is Visible    ${INPUT_SEARCH_CLO}    20s
    Input Text   ${INPUT_SEARCH_CLO}      ${keywords}

    Wait Until Element Is Visible    ${BTN_SEARCH_CLO}    20s
    Click Element    ${BTN_SEARCH_CLO}
    Wait Until Page Contains Element    ${BTN_SEARCH_CLO}    30s
   
    Wait Until Page Contains Element    ${RESULT_TABLE_CLO}    10s
    Sleep    10s
    Scroll Element Into View    ${RESULT_TABLE_CLO}
    Wait Until Page Contains Element    ${RESULT_TABLE_CLO}    30s
    Sleep    10s
Navigate My Classes page
    Wait Until Element Is Visible    ${URL_REPORT_CLO}    20s
    Click Element    ${URL_REPORT_CLO}
    Wait Until Element Is Visible    ${NAV_MY_CLASSES}    20s
    Click Element    ${NAV_MY_CLASSES}
    Sleep    3s
Check the CLO detailed report screen
    Wait Until Element Is Visible    ${URL_REPORT_CLO}    20s
    Click Element    ${URL_REPORT_CLO}
    Sleep    3s
    Wait Until Element Is Visible    ${BTN_VIEW_CLO}    20s
    Click Element    ${BTN_VIEW_CLO}
    Wait Until Page Contains Element    ${RESULT_TABLE_VIEW}    10s
    Sleep    10s
    Scroll Element Into View    ${RESULT_TABLE_VIEW}
    Wait Until Page Contains Element    ${RESULT_TABLE_VIEW}    30s
    Sleep    5s
Check print report button in the CLO details
    Wait Until Element Is Visible    ${URL_REPORT_CLO}    20s
    Click Element    ${URL_REPORT_CLO}
    Sleep    3s
    Wait Until Element Is Visible    ${BTN_VIEW_CLO}    20s
    Click Element    ${BTN_VIEW_CLO}
    Sleep    2s
    Wait Until Element Is Visible    ${BTN_PRINT_REPORT}    20s
    Click Element    ${BTN_PRINT_REPORT}
    Press Keys    NONE    ESC
    Sleep    1s
Check valid search of student name
   [Arguments]    ${student_name}
    Wait Until Element Is Visible    ${URL_REPORT_CLO}    20s
    Click Element    ${URL_REPORT_CLO}
    Sleep    3s

    Wait Until Element Is Visible    ${BTN_VIEW_CLO}    20s
    Click Element    ${BTN_VIEW_CLO}
    Sleep    2s
    Wait Until Page Contains Element    ${RESULT_TABLE_STUDENT}    10s
    Sleep    8s
    Scroll Element Into View    ${RESULT_TABLE_STUDENT}
    Wait Until Page Contains Element    ${RESULT_TABLE_STUDENT}    30s
    Sleep  3s
    Wait Until Element Is Visible    ${BTN_SEARCH_STUDENT}    20s
    Click Element    ${BTN_SEARCH_STUDENT}
    Sleep  2s
    Input Text    ${IP_SEARCH_STUDENT}    ${student_name}
    Sleep  10s
Check invalid search of student name
   [Arguments]    ${student_name}
    Wait Until Element Is Visible    ${URL_REPORT_CLO}    20s
    Click Element    ${URL_REPORT_CLO}
    Sleep    3s

    Wait Until Element Is Visible    ${BTN_VIEW_CLO}    20s
    Click Element    ${BTN_VIEW_CLO}
    Sleep    2s
    Wait Until Page Contains Element    ${RESULT_TABLE_STUDENT}    10s
    Sleep    8s
    Scroll Element Into View    ${RESULT_TABLE_STUDENT}
    Wait Until Page Contains Element    ${RESULT_TABLE_STUDENT}    30s
    Sleep  3s
    Wait Until Element Is Visible    ${BTN_SEARCH_STUDENT}    20s
    Click Element    ${BTN_SEARCH_STUDENT}
    Sleep  2s
    Input Text    ${IP_SEARCH_STUDENT}    ${student_name}
    Sleep  10s
Check search by valid student code
    [Arguments]    ${student_name}
    Wait Until Element Is Visible    ${URL_REPORT_CLO}    20s
    Click Element    ${URL_REPORT_CLO}
    Sleep    3s

    Wait Until Element Is Visible    ${BTN_VIEW_CLO}    20s
    Click Element    ${BTN_VIEW_CLO}
    Sleep    2s
    Wait Until Page Contains Element    ${RESULT_TABLE_STUDENT}    10s
    Sleep    8s
    Scroll Element Into View    ${RESULT_TABLE_STUDENT}
    Wait Until Page Contains Element    ${RESULT_TABLE_STUDENT}    30s
    Sleep  3s
    Wait Until Element Is Visible    ${BTN_SEARCH_STUDENT}    20s
    Click Element    ${BTN_SEARCH_STUDENT}
    Sleep  2s
    Input Text    ${IP_SEARCH_STUDENT}    ${student_name}
    Sleep  10s
Check search by invalid student code
    [Arguments]    ${student_name}
    Wait Until Element Is Visible    ${URL_REPORT_CLO}    20s
    Click Element    ${URL_REPORT_CLO}
    Sleep    3s

    Wait Until Element Is Visible    ${BTN_VIEW_CLO}    20s
    Click Element    ${BTN_VIEW_CLO}
    Sleep    2s
    Wait Until Page Contains Element    ${RESULT_TABLE_STUDENT}    10s
    Sleep    8s
    Scroll Element Into View    ${RESULT_TABLE_STUDENT}
    Wait Until Page Contains Element    ${RESULT_TABLE_STUDENT}    30s
    Sleep  3s
    Wait Until Element Is Visible    ${BTN_SEARCH_STUDENT}    20s
    Click Element    ${BTN_SEARCH_STUDENT}
    Sleep  2s
    Input Text    ${IP_SEARCH_STUDENT}    ${student_name}
    Sleep  10s
Check search by score
    [Arguments]    ${student_name}
    Wait Until Element Is Visible    ${URL_REPORT_CLO}    20s
    Click Element    ${URL_REPORT_CLO}
    Sleep    3s

    Wait Until Element Is Visible    ${BTN_VIEW_CLO}    20s
    Click Element    ${BTN_VIEW_CLO}
    Sleep    2s
    Wait Until Page Contains Element    ${RESULT_TABLE_STUDENT}    10s
    Sleep    8s
    Scroll Element Into View    ${RESULT_TABLE_STUDENT}
    Wait Until Page Contains Element    ${RESULT_TABLE_STUDENT}    30s
    Sleep  3s
    Wait Until Element Is Visible    ${BTN_SEARCH_STUDENT}    20s
    Click Element    ${BTN_SEARCH_STUDENT}
    Sleep  2s
    Input Text    ${IP_SEARCH_STUDENT}    ${student_name}
    Sleep  10s
Check Search test by status
    [Arguments]    ${student_name}
    Wait Until Element Is Visible    ${URL_REPORT_CLO}    20s
    Click Element    ${URL_REPORT_CLO}
    Sleep    3s

    Wait Until Element Is Visible    ${BTN_VIEW_CLO}    20s
    Click Element    ${BTN_VIEW_CLO}
    Sleep    2s
    Wait Until Page Contains Element    ${RESULT_TABLE_STUDENT}    10s
    Sleep    8s
    Scroll Element Into View    ${RESULT_TABLE_STUDENT}
    Wait Until Page Contains Element    ${RESULT_TABLE_STUDENT}    30s
    Sleep  3s
    Wait Until Element Is Visible    ${BTN_SEARCH_STUDENT}    20s
    Click Element    ${BTN_SEARCH_STUDENT}
    Sleep  2s
    Input Text    ${IP_SEARCH_STUDENT}    ${student_name}
    Sleep  10s

Check search the keyword is empty
    [Arguments]    ${student_name}
    Wait Until Element Is Visible    ${URL_REPORT_CLO}    20s
    Click Element    ${URL_REPORT_CLO}
    Sleep    3s

    Wait Until Element Is Visible    ${BTN_VIEW_CLO}    20s
    Click Element    ${BTN_VIEW_CLO}
    Sleep    2s
    Wait Until Page Contains Element    ${RESULT_TABLE_STUDENT}    10s
    Sleep    8s
    Scroll Element Into View    ${RESULT_TABLE_STUDENT}
    Wait Until Page Contains Element    ${RESULT_TABLE_STUDENT}    30s
    Sleep  3s
    Wait Until Element Is Visible    ${BTN_SEARCH_STUDENT}    20s
    Click Element    ${BTN_SEARCH_STUDENT}
    Sleep  2s
    Input Text    ${IP_SEARCH_STUDENT}    ${student_name}
    Sleep  10s
Print Report Successfully in Test Detail View
    Wait Until Element Is Visible    ${URL_REPORT_CLO}    20s
    Click Element    ${URL_REPORT_CLO}
    Sleep    3s
    Wait Until Element Is Visible    ${BTN_VIEW_CLO}    20s
    Click Element    ${BTN_VIEW_CLO}
    Sleep    2s
    Wait Until Element Is Visible    ${BTN_PRINT_REPORT}    20s
    Click Element    ${BTN_PRINT_REPORT}

  