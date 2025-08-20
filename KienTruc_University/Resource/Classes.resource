*** Settings ***
Library    SeleniumLibrary

*** Variables ***
# ====== Config ======
${BASE_URL}      https://demo-clo.minds.vn
${BROWSER}       chrome
${USERNAME}      student1
${PASSWORD}      demostudent

# ====== Login page ======
${LOGIN_USER}    xpath=//input[@id="id_username" or @name="username"]
${LOGIN_PASS}    xpath=//input[@id="id_password" or @name="password"]
${BTN_LOGIN}     xpath=//button[@type="submit" or contains(normalize-space(.),"Login") or contains(normalize-space(.),"Đăng nhập")]

# ====== Menu / Classes page ======
${MENU_CLASSES}  xpath=//a[@href="/en/academics/classes/"]
${FILTER_SEM}    xpath=//select[@id="semester"]
${FILTER_AY}     xpath=//select[@id="academic_year"]
${FILTER_STA}    xpath=//select[@id="status"]
${INPUT_Q}       xpath=//input[@id="query"]
${BTN_SEARCH}    xpath=//i[@class="fas fa-search"]/ancestor::button[1]

# ====== Table (Classes) ======
${GRID_ROWS}     xpath=//table//tbody/tr
${COL_NAME}      xpath=.//td[2]
${COL_SEM}       xpath=.//td[3]
${COL_YEAR}      xpath=.//td[4]
${COL_STATUS}    xpath=.//td[last()-1]

*** Keywords ***
*** Keywords ***
Open Chrome Browser
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --disable-gpu
    Call Method    ${options}    add_argument    --disable-speech-api
    Call Method    ${options}    add_argument    --disable-software-rasterizer
    Open Browser    ${BASE_URL}    chrome    options=${options}
Login To System
    [Arguments]    ${USERNAME}    ${PASSWORD}
    Open Browser    ${BASE_URL}    chrome
    Wait Until Element Is Visible    ${LOGIN_USER}    30s
    Input Text    ${LOGIN_USER}    ${USERNAME}
    Input Text    ${LOGIN_PASS}    ${PASSWORD}
    Click Button    ${BTN_LOGIN}
    Location Should Contain        https://demo-clo.minds.vn/


Go To Classes Page
    Click Element    ${MENU_CLASSES}
    Wait Until Element Is Visible    ${FILTER_SEM}    15s

Select Semester
    [Arguments]    ${label}
    Select From List By Label    ${FILTER_SEM}    ${label}

Select Academic Year
    [Arguments]    ${label}
    Select From List By Label    ${FILTER_AY}     ${label}

Select Status
    [Arguments]    ${label}
    Select From List By Label    ${FILTER_STA}    ${label}

Search By Query
    [Arguments]    ${text}
    Clear Element Text    ${INPUT_Q}
    Input Text    ${INPUT_Q}    ${text}
    Click Element         ${BTN_SEARCH}

Wait Table Has Rows
    [Arguments]    ${timeout}=10s
    Wait Until Keyword Succeeds    ${timeout}    1s    Table Should Have At Least One Row

Table Should Have At Least One Row
    ${n}=    Get Element Count    ${GRID_ROWS}
    Should Be True    ${n} > 0    Bảng không có dòng nào hiển thị.

Table Rows Should Match
    [Arguments]    ${semester}=    ${year}=    ${status}=    ${name_contains}=
    ${rows}=    Get WebElements    ${GRID_ROWS}
    FOR    ${r}    IN    @{rows}
        ${ok}=    Set Variable    ${True}
        IF    "${semester}"
            ${sem}=    Get Text    xpath=${r}/${COL_SEM}
            Should Be Equal As Strings    ${sem}    ${semester}
        END
        IF    "${year}"
            ${yr}=     Get Text    xpath=${r}/${COL_YEAR}
            Should Contain    ${yr}    ${year}
        END
        IF    "${status}"
            ${st}=     Get Text    xpath=${r}/${COL_STATUS}
            Should Contain    ${st}    ${status}
        END
        IF    "${name_contains}"
            ${name}=   Get Text    xpath=${r}/${COL_NAME}
            Should Contain    ${name}    ${name_contains}
        END
    END

Assert Default Filters
    ${sem}=    Get Selected List Label    ${FILTER_SEM}
    ${ay}=     Get Selected List Label    ${FILTER_AY}
    ${st}=     Get Selected List Label    ${FILTER_STA}
    Should Be True    "${sem}".lower().strip() in ["all semesters", "tất cả học kỳ"]
    Should Be True    "${ay}".lower().strip() in ["all years", "tất cả năm học"]
    Should Be True    "${st}".lower().strip() in ["all statuses", "tất cả trạng thái"]
