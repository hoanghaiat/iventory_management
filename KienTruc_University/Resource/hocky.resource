*** Settings ***
Library           SeleniumLibrary
Library    Collections
Variables         ../variables/locator.py

*** Variables ***
${BASE_URL}       https://demo-clo.minds.vn
${BROWSER}        chrome
${USERNAME}       lecturer1
${PASSWORD}       demolecturer
${TIMEOUT}        20s

*** Keywords ***
Open Browser And Login
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    ${H_LOGIN}    ${TIMEOUT}
    Input Text      ${H_LOGIN}      ${USERNAME}
    Input Text      ${P_LOGIN}      ${PASSWORD}
    Click Button    ${BTN_LOGIN}
    ${ok}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${DASHBOARD_H1}    ${TIMEOUT}
    IF    not ${ok}
        Wait Until Element Is Visible    ${SIDEBAR}    ${TIMEOUT}
    END

Open Classes Page
    ${seen}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${MENU_LOPHOC_TEXT}    ${TIMEOUT}
    IF    ${seen}
        Scroll Element Into View    ${MENU_LOPHOC_TEXT}
        Click Element               ${MENU_LOPHOC_TEXT}
    ELSE
        ${seen2}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${MENU_LOPHOC_HREF}    ${TIMEOUT}
        IF    ${seen2}
            Scroll Element Into View    ${MENU_LOPHOC_HREF}
            Click Element               ${MENU_LOPHOC_HREF}
        ELSE
            Scroll Element Into View    ${MENU_LOPHOC_SPAN}
            Click Element               ${MENU_LOPHOC_SPAN}
        END
    END
    Wait For Class Table
    Location Should Contain    /classes    ignore_case=True

Wait For Class Table
    Wait Until Page Contains Element    ${FILTER_PANEL}    ${TIMEOUT}
    Wait Until Page Contains Element    ${TABLE_ROWS}      ${TIMEOUT}

Select Semester
    [Arguments]    ${label}
    Wait Until Element Is Visible    ${SEMESTER_SEL}    ${TIMEOUT}
    ${ok}=    Run Keyword And Return Status    Select From List By Label    ${SEMESTER_SEL}    ${label}
    IF    not ${ok}
        IF    '${label}'=='All Semesters'
            Select From List By Index    ${SEMESTER_SEL}    0
        ELSE
            Select From List By Value    ${SEMESTER_SEL}    ${label}
        END
    END
    Press Keys     ${SEMESTER_SEL}    ENTER
    Wait For Class Table

Assert Table Only Shows Semester
    [Arguments]    ${semester}
    ${total}=       Get Element Count    ${TABLE_ROWS}
    Should Be True  ${total} > 0    Bảng không có dữ liệu sau khi lọc.
    ${rows}=        Get Element Count    xpath=(${TABLE_ROWS})[.//td[contains(normalize-space(.),"${semester}")]]
    Should Be Equal As Integers    ${rows}    ${total}    Có dòng không thuộc học kỳ ${semester}.

Clear Semester Filter To All
    Select Semester    All Semesters

Assert Multiple Semesters Visible
    ${cells}=    Get WebElements    xpath=(${TABLE_ROWS})//td
    ${texts}=    Create List
    FOR    ${c}    IN    @{cells}
        ${t}=    Get Text    ${c}
        ${variable}=    Append To List    ${texts}    ${t}
    END
    ${sem_list}=    Evaluate    [s for s in ["Summer","Fall","Spring","Winter","Autumn"] if any(s in x for x in ${texts})]
    ${uniq}=        Evaluate    len(set(${sem_list}))
    Should Be True  ${uniq} >= 2    Sau khi xoá lọc, bảng chưa hiển thị nhiều học kỳ.

Capture And Close
    Capture Page Screenshot
    Close All Browsers
