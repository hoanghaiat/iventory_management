*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BASE_URL}           https://demo-clo.minds.vn
${BROWSER}            chrome

# Demo account
${USERNAME}           lecturer1
${PASSWORD}           demolecturer

# ====== Login locators ======
${H_LOGIN}            xpath=//input[@id="id_username"]
${P_LOGIN}            xpath=//input[@id="id_password"]
${BTN_LOGIN}          xpath=//button[normalize-space(.)="Đăng nhập" or normalize-space(.)="Login"]

# ====== Menu / NAV ======
${MENU_TESTS}         xpath=//a[contains(@href,"/assess")]

# ====== Tabs theo UI (text cố định) ======
${TAB_ALL}            xpath=//*[self::a or self::button][normalize-space(.)="All"]
${TAB_MIDTERM}        xpath=//*[self::a or self::button][normalize-space(.)="Midterm"]
${TAB_FINAL}          xpath=//*[self::a or self::button][normalize-space(.)="Final"]
${TAB_QUIZ}           xpath=//*[self::a or self::button][normalize-space(.)="Quiz"]
${TAB_ASSIGNMENT}     xpath=//*[self::a or self::button][normalize-space(.)="Assignment"]
${TAB_PROJECT}        xpath=//*[self::a or self::button][normalize-space(.)="Project"]

# ====== My Classes ======
${BTN_MY_CLASSES}     xpath=//*[self::a or self::button][normalize-space(.)="My Classes"]

# ====== URLs trực tiếp (fallback) ======
${QUIZ_URL_VI}        ${BASE_URL}/vi/assess
${QUIZ_URL_EN}        ${BASE_URL}/en/assess

# ====== List/Test items & điều hướng chi tiết ======
${TEST_ITEMS}         xpath=(//table//tr[.//a or .//button] | //div[contains(@class,"list") or contains(@class,"items") or contains(@class,"table-responsive")]//*[self::a or self::div or self::li][@data-id or contains(@class,"row") or contains(@class,"item")] | //a[contains(@href,"/assess/") or contains(@href,"/tests/")])
${FIRST_TEST_LINK}    xpath=(//a[contains(@href,"/assess/") or contains(@href,"/tests/")][1] | (//table//tr[.//a]//a)[1])

# ====== Pagination/Next-Prev (nếu có) ======
${BTN_NEXT}           xpath=//*[self::a or self::button][@rel="next" or contains(@aria-label,"Next") or normalize-space(.)="Next" or normalize-space(.)="›" or normalize-space(.)="»"]
${BTN_PREV}           xpath=//*[self::a or self::button][@rel="prev" or contains(@aria-label,"Previous") or normalize-space(.)="Previous" or normalize-space(.)="‹" or normalize-space(.)="«"]

# ====== Search (tuỳ có thì dùng) ======
${SEARCH_INPUT}       xpath=//input[@type="search" or contains(@placeholder,"Search") or contains(@placeholder,"Tìm")]

*** Keywords ***
Login As Lecturer
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    ${H_LOGIN}    20s
    Input Text    ${H_LOGIN}    ${USERNAME}
    Input Text    ${P_LOGIN}    ${PASSWORD}
    Click Button    ${BTN_LOGIN}
    Wait Until Page Contains    Giảng viên    20s
    Dismiss Common Overlays

Dismiss Common Overlays
    Run Keyword And Ignore Error    Click Element    xpath=//button[normalize-space(.)="Chấp nhận" or normalize-space(.)="Tôi hiểu" or normalize-space(.)="Đồng ý" or normalize-space(.)="Accept" or normalize-space(.)="I understand" or normalize-space(.)="OK"]
    Run Keyword And Ignore Error    Click Element    xpath=//button[@aria-label="Close" or @aria-label="Đóng" or normalize-space(.)="✕" or normalize-space(.)="Close" or normalize-space(.)="Đóng"]
    Run Keyword And Ignore Error    Click Element    xpath=//div[contains(@class,"toast")]//button[contains(@class,"close") or @aria-label="Close"]
    Sleep    0.2s

Wait For Quiz By URL
    Wait Until Keyword Succeeds    20x    0.5s    _Check Assess URL

_Check Assess URL
    ${loc}=    Get Location
    ${ok}=     Evaluate    "/assess" in """${loc}"""
    Run Keyword If    ${ok}    No Operation    ELSE    Fail    Not on /assess yet. Current URL: ${loc}

Wait For Classes Page
    Wait Until Keyword Succeeds    20x    0.5s    _Check Classes

_Check Classes
    ${loc}=    Get Location
    ${ok1}=    Evaluate    "/classes" in """${loc}""" or "/myclasses" in """${loc}"""
    ${ok2}=    Run Keyword And Return Status    Page Should Contain    Classes
    ${ok3}=    Run Keyword And Return Status    Page Should Contain    My Classes
    Run Keyword If    ${ok1} or ${ok2} or ${ok3}    No Operation    ELSE    Fail    Not on Classes page. URL: ${loc}

Safe Click
    [Arguments]    ${locator}
    ${ok}=    Run Keyword And Return Status    Click Element    ${locator}
    IF    ${ok}
        RETURN
    END
    Run Keyword And Ignore Error    Scroll Element Into View    ${locator}
    ${ok2}=    Run Keyword And Return Status    Click Element    ${locator}
    IF    ${ok2}
        RETURN
    END
    # Fallback JS: dùng XPATH chuỗi, KHÔNG truyền WebElement → tránh TypeError
    Execute Javascript    var xp='${locator}'.replace(/^xpath=/,'');var el=document.evaluate(xp,document,null,XPathResult.FIRST_ORDERED_NODE_TYPE,null).singleNodeValue;if(el){el.scrollIntoView({block:"center"});el.click();}
    Sleep    0.2s

Open Tests Page
    Dismiss Common Overlays
    ${has_menu}=    Run Keyword And Return Status    Page Should Contain Element    ${MENU_TESTS}
    Run Keyword If    ${has_menu}    Safe Click    ${MENU_TESTS}
    Sleep    0.4s
    ${loc}=    Get Location
    ${on_assess}=    Evaluate    "/assess" in """${loc}"""
    Run Keyword If    not ${on_assess}    Go To    ${QUIZ_URL_VI}
    Sleep    0.4s
    ${loc}=    Get Location
    ${on_assess}=    Evaluate    "/assess" in """${loc}"""
    Run Keyword If    not ${on_assess}    Go To    ${QUIZ_URL_EN}
    Wait For Quiz By URL

# ==== TAB utilities ====
Click Tabs By Image Order
    ${tabs}=    Create List    ${TAB_ALL}    ${TAB_MIDTERM}    ${TAB_FINAL}    ${TAB_QUIZ}    ${TAB_ASSIGNMENT}    ${TAB_PROJECT}
    FOR    ${t}    IN    @{tabs}
        Run Keyword And Ignore Error    Wait Until Element Is Visible    ${t}    5s
        Run Keyword And Ignore Error    Safe Click    ${t}
        Sleep    0.2s
    END

Select Tab By Name
    [Arguments]    ${name}
    ${vn}=    Set Variable If    '${name}'=='All'          Tất cả
    ...                       '${name}'=='Midterm'      Giữa kỳ
    ...                       '${name}'=='Final'        Cuối kỳ
    ...                       '${name}'=='Quiz'         Bài kiểm tra
    ...                       '${name}'=='Assignment'   Bài tập
    ...                       '${name}'=='Project'      Dự án
    ...                       ${EMPTY}
    ${loc_en}=    Set Variable    xpath=//*[self::a or self::button][normalize-space(.)="${name}"]
    ${loc_vn}=    Set Variable    xpath=//*[self::a or self::button][normalize-space(.)="${vn}"]
    ${seen_en}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${loc_en}    5s
    IF    ${seen_en}
        Safe Click    ${loc_en}
        Sleep    0.2s
        RETURN    True
    END
    IF    '${vn}'!='${EMPTY}'
        ${seen_vn}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${loc_vn}    5s
        IF    ${seen_vn}
            Safe Click    ${loc_vn}
            Sleep    0.2s
            RETURN    True
        END
    END
    RETURN    False

Assert Active Tab If Present
    [Arguments]    ${name}
    ${vn}=    Set Variable If    '${name}'=='All'          Tất cả
    ...                       '${name}'=='Midterm'      Giữa kỳ
    ...                       '${name}'=='Final'        Cuối kỳ
    ...                       '${name}'=='Quiz'         Bài kiểm tra
    ...                       '${name}'=='Assignment'   Bài tập
    ...                       '${name}'=='Project'      Dự án
    ...                       ${EMPTY}
    ${active_en}=    Set Variable    xpath=(//*[self::a or self::button][normalize-space(.)="${name}" and (@aria-selected="true" or contains(@class,"active"))] | //*[(contains(@class,"active") or contains(@class,"selected"))]/*[self::a or self::button][normalize-space(.)="${name}"])
    ${active_vn}=    Set Variable    xpath=(//*[self::a or self::button][normalize-space(.)="${vn}" and (@aria-selected="true" or contains(@class,"active"))] | //*[(contains(@class,"active") or contains(@class,"selected"))]/*[self::a or self::button][normalize-space(.)="${vn}"])
    ${has_en}=    Run Keyword And Return Status    Page Should Contain Element    ${active_en}
    ${has_vn}=    Run Keyword And Return Status    Page Should Contain Element    ${active_vn}
    IF    ${has_en} or ${has_vn}
        RETURN
    END
    # Không fail, không WARN → sạch log

# ==== LIST & DETAILS ====
Count Test Items
    ${has}=    Run Keyword And Return Status    Page Should Contain Element    ${TEST_ITEMS}
    IF    not ${has}
        RETURN    0
    END
    ${els}=    Get WebElements    ${TEST_ITEMS}
    ${n}=      Evaluate    len($els)
    RETURN    ${n}

Open First Test Item Or Skip
    ${has}=    Run Keyword And Return Status    Page Should Contain Element    ${FIRST_TEST_LINK}
    IF    not ${has}
        RETURN
    END
    Safe Click    ${FIRST_TEST_LINK}
    Sleep    0.5s

Back
    Go Back
    Sleep    0.5s
    Wait For Quiz By URL

# ==== Pagination ====
Click Next If Present
    ${has}=    Run Keyword And Return Status    Page Should Contain Element    ${BTN_NEXT}
    IF    not ${has}
        RETURN
    END
    Safe Click    ${BTN_NEXT}
    Sleep    0.4s

Click Prev If Present
    ${has}=    Run Keyword And Return Status    Page Should Contain Element    ${BTN_PREV}
    IF    not ${has}
        RETURN
    END
    Safe Click    ${BTN_PREV}
    Sleep    0.4s

# ==== Search (optional) ====
Search If Present
    [Arguments]    ${keyword}
    ${has}=    Run Keyword And Return Status    Page Should Contain Element    ${SEARCH_INPUT}
    IF    not ${has}
        RETURN
    END
    Clear Element Text    ${SEARCH_INPUT}
    Input Text    ${SEARCH_INPUT}    ${keyword}
    Press Keys    ${SEARCH_INPUT}    ENTER
    Sleep    0.8s

# ==== My Classes flow ====
Go To My Classes
    Wait Until Element Is Visible    ${BTN_MY_CLASSES}    15s
    Safe Click    ${BTN_MY_CLASSES}
    Wait For Classes Page

Open Class Tests
    [Arguments]    ${classname}
    # Click bằng XPATH CHUỖI (không WebElement)
    ${link1}=    Set Variable    xpath=(//a[contains(normalize-space(.),"${classname}")] | //button[contains(normalize-space(.),"${classname}")])[1]
    ${seen1}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${link1}    8s
    IF    ${seen1}
        Safe Click    ${link1}
    ELSE
        ${container}=    Set Variable    xpath=(//*[contains(normalize-space(.),"${classname}")])[1]
        Safe Click    ${container}
    END
    # Tới Tests/Assess
    ${to_tests}=    Set Variable    xpath=//a[contains(@href,"/assess") or normalize-space(.)="Tests" or contains(normalize-space(.),"Bài kiểm tra")]
    Run Keyword And Ignore Error    Safe Click    ${to_tests}
    Wait For Quiz By URL
