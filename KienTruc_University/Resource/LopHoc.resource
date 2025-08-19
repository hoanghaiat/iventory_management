*** Settings ***
Library    SeleniumLibrary
Library    String
Library    Collections
Library    XML
Variables    ../locator.py
Resource    ../Resource/DangNhap.resource
Resource    ../Resource/HocPhan.resource


*** Variables ***
${ACTUAL_TITLE_CLASS}    Quản lý lớp học
${TITLE_CREATE_CLASS}    Create New Class
${TITLE_COURSES}    All Courses
*** Keywords ***
Handle Advertise
    ${check}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${BOX_ADVERTISE}    5s
    IF    "${check}" == "True"
        Click Element    //a[@id="djHideToolBarButton"]
    END
Open Class List
    Wait Until Element Is Visible   ${URL_CLASS}    30s
    Scroll Element Into View    ${URL_CLASS} 
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${URL_CLASS}
    Handle Advertise
Verify The Page
    Wait Until Element Is Visible    ${TITLE_PAGE}    30s
    ${title}=    Get Text    ${TITLE_PAGE}
    Should Be Equal    ${title}    ${ACTUAL_TITLE_CLASS}

Click The Button Create Class In Page Class
    Wait Until Element Is Visible    ${URL_CREATE_PAGE_CLASS}    30s
    Scroll Element Into View    ${URL_CREATE_PAGE_CLASS}
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${URL_CREATE_PAGE_CLASS}
    Page Should Contain    ${TITLE_CREATE_CLASS}

Click The Button Courses In Page Class
    Wait Until Element Is Visible    ${URL_COURSES_PAGE_CLASS}    30s
    Scroll Element Into View    ${URL_COURSES_PAGE_CLASS}
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${URL_COURSES_PAGE_CLASS}
    Page Should Contain    ${TITLE_COURSES}

Fill All The Input Search
    [Arguments]    ${semester}    ${academicyear}    ${status}    ${keyword}
    Wait Until Element Is Visible    ${SELECT_SEMESTER}    30s
    Select From List By Label  ${SELECT_SEMESTER}    ${semester}
    Select From List By Label    ${SELECT_ACADEMIC_YEAR}    ${academicyear}
    Select From List By Label    ${SELECT_STATUS}    ${status}
    Wait Until Element Is Visible    ${INPUT_SEARCH_CLASS}    30s
    Input Text    ${INPUT_SEARCH_CLASS}    ${keyword}

Click The Button Search In The Page Class
    Wait Until Element Is Visible    ${SEARCH_CLASS_BTN}    30s
    Scroll Element Into View    ${SEARCH_CLASS_BTN}
    Wait Until Keyword Succeeds    30s    1s    Click Button    ${SEARCH_CLASS_BTN}  
    
Verify Search Results Contain Keyword Class
    [Arguments]    ${keyword}
    ${id}    Set Variable    2
    ${expected}    Replace Variables    ${EXPECTED_SEARCH_CLASS}
    Wait Until Element Is Visible    ${expected}    30s
    ${elements}=    Get WebElements    ${expected}
    @{list}=    Create List
    FOR    ${el}    IN    @{elements}
        ${text}=    Get Text    ${el}
        Append To List    ${list}    ${text}
    END

    ${lower_keyword}=    Convert To Lowercase    ${keyword}
    FOR    ${text}    IN    @{list}
        ${lower_text}=    Convert To Lowercase    ${text}
        Should Contain    ${lower_text}    ${lower_keyword}
    END
Verify Search Results Contain Keyword Class Summer
    [Arguments]    ${keyword}
    ${id}    Set Variable    3
    ${expected}    Replace Variables    ${EXPECTED_SEARCH_CLASS}
    Wait Until Element Is Visible    ${expected}    30s
    ${elements}=    Get WebElements    ${expected}
    @{list}=    Create List
    FOR    ${el}    IN    @{elements}
        ${text}=    Get Text    ${el}
        Append To List    ${list}    ${text}
    END

    ${lower_keyword}=    Convert To Lowercase    ${keyword}
    FOR    ${text}    IN    @{list}
        ${lower_text}=    Convert To Lowercase    ${text}
        Should Contain    ${lower_text}    ${lower_keyword}
    END
Verify Search Results Contain Keyword Class Status Ongoing
    [Arguments]    ${keyword}

    Wait Until Element Is Visible    ${EXPECTED_STATUS_SEARCH_CLASS}    30s
    ${elements}=    Get WebElements    ${EXPECTED_STATUS_SEARCH_CLASS}
    @{list}=    Create List
    FOR    ${el}    IN    @{elements}
        ${text}=    Get Text    ${el}
        Append To List    ${list}    ${text}
    END

    ${lower_keyword}=    Convert To Lowercase    ${keyword}
    FOR    ${text}    IN    @{list}
        ${lower_text}=    Convert To Lowercase    ${text}
        Should Contain    ${lower_text}    ${lower_keyword}
    END

Click The Button View Information Class
    ${id}    Set Variable    2
    ${urlinfo}    Replace Variables    ${URL_CLASS_INFO}
    ${codeinfo}    Replace Variables    ${EXPECTED_CODE_CLASS_INFO}
    ${nameinfo}    Replace Variables    ${EXPECTED_NAME_CLASS_INFO}
    ${semesterinfo}    Replace Variables    ${EXPECTED_SEMESTER_CLASS_INFO}
    ${yearsinfo}    Replace Variables    ${EXPECTED_YEARS_CLASS_INFO}
    Wait Until Element Is Visible    ${codeinfo}    30s
    Scroll Element Into View    ${codeinfo}
    ${codeex}=    Get Text    ${codeinfo}
    ${nameex}=    Get Text    ${nameinfo}
    ${semesterex}=    Get Text    ${semesterinfo}
    ${yearex}=    Get Text    ${yearsinfo}
    Wait Until Element Is Visible    ${urlinfo}    30s
    Scroll Element Into View    ${urlinfo}
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${urlinfo}
    RETURN    ${codeex}    ${nameex}    ${semesterex}    ${yearex}    
Verify The Information View Class
    [Arguments]    ${codeex}    ${nameex}    ${semesterex}    ${yearex}    
    Wait Until Element Is Visible    ${ACTUAL_CODE_COURSE}    30s
    ${code_name}=    Get Text    ${ACTUAL_CODE_CLASS}
    Wait Until Element Is Visible    ${ACTUAL_SEMESTER_CLASS}    30s
    ${semester_year}=    Get Text    ${ACTUAL_SEMESTER_CLASS}
    Should Contain    ${code_name}    ${codeex}
    Should Contain    ${code_name}    ${nameex}
    Should Contain    ${semester_year}    ${semesterex}
    Should Contain    ${semester_year}    ${yearex}

Click The Button View
    ${id}    Set Variable    5
    ${test}    Replace Variables    ${URL_VIEW}
    Wait Until Element Is Visible    ${test}
    Scroll Element Into View    ${test}
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${test}
Click The Button Test
    ${id}    Set Variable    5
    ${test}    Replace Variables    ${URL_TEST}
    Wait Until Element Is Visible    ${test}
    Scroll Element Into View    ${test}
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${test}
    Page Should Contain    Quản lý bài kiểm tra
 Click The Button Back To List
     Wait Until Element Is Visible    ${URL_BACK_LIST}    30s
     Wait Until Keyword Succeeds    30s    1s    Click Element    ${URL_BACK_LIST}
     Wait Until Element Is Visible    ${TITLE_PAGE}    30s
     ${title}=    Get Text    ${TITLE_PAGE}
     Should Be Equal    ${title}    Quản lý lớp học
Click The Button View All CLOs
    ${id}    Set Variable    5
    ${viewall}    Replace Variables    ${URL_VIEW_ALL_CLO}
    Wait Until Element Is Visible    ${viewall}    30s
    Scroll Element Into View    ${viewall}
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${viewall}
    Wait Until Element Is Visible    ${TITLE_PAGE}    30s
    ${title}=    Get Text    ${TITLE_PAGE}
    Should Contain    ${title}    CLOs
Click The Button Add Content
    Wait Until Element Is Visible    ${URL_ADD_CONTENT}    30s
    Scroll Element Into View    ${URL_ADD_CONTENT}
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${URL_ADD_CONTENT}
    Wait Until Element Is Visible    ${TITLE_PAGE}    30s
    ${actual}=    Get Text    ${TITLE_PAGE}
    Should Be Equal    ${actual}    Thêm chương mới

Click The Button Add Assessment
    Wait Until Element Is Visible    ${URL_ADD_ASS}    30s
    Scroll Element Into View    ${URL_ADD_ASS}
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${URL_ADD_ASS}
    Wait Until Element Is Visible    ${TITLE_PAGE}    30s
    ${title}=    Get Text    ${TITLE_PAGE}
    Should Be Equal    ${title}    Thêm đánh giá mới