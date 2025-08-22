*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${BASE_URL}           https://demo-clo.minds.vn
${BROWSER}            chrome
${USERNAME}           lecturer1
${PASSWORD}           demolecturer

# Cách mở: auto | menu | url
${CLO_NAV}            auto

# URL ứng viên (thử lần lượt)
@{CLO_URLS}
...    ${BASE_URL}/vi/reports/clo/
...    ${BASE_URL}/en/reports/clo/
...    ${BASE_URL}/reports/clo/
...    ${BASE_URL}/vi/report/clo/
...    ${BASE_URL}/en/report/clo/
...    ${BASE_URL}/vi/clo
...    ${BASE_URL}/en/clo
...    ${BASE_URL}/lecturer/reports/clo
...    ${BASE_URL}/lecturer/clo

# Reports hub (fallback)
@{REPORT_HUBS}
...    ${BASE_URL}/vi/reports/
...    ${BASE_URL}/en/reports/
...    ${BASE_URL}/reports/

# Login locators
${LOGIN_USER}         xpath=//input[@id="id_username"]
${LOGIN_PASS}         xpath=//input[@id="id_password"]
${LOGIN_BTN}          xpath=//button[normalize-space(.)="Đăng nhập" or normalize-space(.)="Login"]

# Menu / My Classes
${MENU_CLO}           xpath=//aside//a[contains(@href,'/reports/clo')]
${BTN_MY_CLASSES}     xpath=//*[self::a or self::button][normalize-space(.)="My Classes" or normalize-space(.)="Lớp của tôi"]

# Markers linh hoạt của trang CLO
${CLO_HDR}            xpath=//*[self::h1 or self::h2 or self::h3 or self::h4][contains(.,'CLO') or contains(.,'Chuẩn đầu ra') or contains(.,'Learning Outcome') or contains(.,'Kết quả học tập')]
${CLO_SEARCH}         xpath=//input[@type='search' or contains(translate(@placeholder,'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ'),'SEARCH') or contains(@placeholder,'Tìm')]
${CARD_TRACKING}      xpath=//*[self::a or self::div or self::button][contains(normalize-space(.),"Performance Tracking")]
${CARD_PLO}           xpath=//*[self::a or self::div or self::button][contains(normalize-space(.),"PLO Alignment")]
${CARD_GAP}           xpath=//*[self::a or self::div or self::button][contains(normalize-space(.),"Gap Analysis")]
${ANY_CLO_LINK}       xpath=(//a[contains(.,'CLO') or contains(.,'Chuẩn đầu ra') or contains(.,'Learning Outcome') or contains(.,'Kết quả học tập')])[1]

*** Keywords ***
# ---------- Helpers ----------
Wait Until Document Ready
    # Retry cho tới khi DOM ở trạng thái 'complete'
    Wait Until Keyword Succeeds    40x    0.25s    Assert Document Ready

Assert Document Ready
    ${state}=    Execute Javascript    return document.readyState
    Should Be Equal As Strings    ${state}    complete    Page not fully loaded

Safe Click
    [Arguments]    ${locator}
    ${ok}=    Run Keyword And Return Status    Click Element    ${locator}
    IF    ${ok}
        RETURN
    END
    Run Keyword And Ignore Error    Scroll Element Into View    ${locator}
    ${ok2}=   Run Keyword And Return Status    Click Element    ${locator}
    IF    ${ok2}
        RETURN
    END
    # Thử click bằng JS (dựa trên XPATH)
    Execute Javascript
    ...    var xp='${locator}'.replace(/^xpath=/,'');
    ...    var el=document.evaluate(xp,document,null,XPathResult.FIRST_ORDERED_NODE_TYPE,null).singleNodeValue;
    ...    if(el){el.scrollIntoView({block:"center"});el.click();}

Any Visible
    [Arguments]    ${timeout}=15s    @{locators}
    FOR    ${loc}    IN    @{locators}
        ${ok}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${loc}    ${timeout}
        IF    ${ok}
            RETURN    True
        END
    END
    RETURN    False

# ---------- Session / Login ----------
Ensure Session
    ${has}=    Run Keyword And Return Status    Get Location
    IF    not ${has}
        Open Browser    ${BASE_URL}    ${BROWSER}
        Maximize Browser Window
    END
    Go To    ${BASE_URL}
    Wait Until Document Ready
    Ensure Logged In

Ensure Logged In
    ${need}=    Run Keyword And Return Status    Page Should Contain Element    ${LOGIN_USER}
    IF    ${need}
        Input Text    ${LOGIN_USER}    ${USERNAME}
        Input Text    ${LOGIN_PASS}    ${PASSWORD}
        Click Button   ${LOGIN_BTN}
        Wait Until Document Ready
    END

# ---------- Robust Navigation ----------
Open CLO
    # Điều hướng theo mode: menu | url | auto; chỉ Fail khi tất cả chiến lược đều thất bại
    Ensure Session
    ${mode}=    Set Variable If    '${CLO_NAV}'=='auto'    auto    '${CLO_NAV}'

    IF    '${mode}'=='menu'
        ${ok}=    Open CLO By Menu
        Run Keyword If    not ${ok}    Fail    CLO menu not found/clickable.
        RETURN
    END

    IF    '${mode}'=='url'
        ${ok}=    Open CLO By Url Candidates
        Run Keyword If    not ${ok}    Fail    Cannot open CLO by URL candidates.
        RETURN
    END

    # auto: menu -> urls -> hub
    ${ok}=    Open CLO By Menu
    Run Keyword If    ${ok}    Return From Keyword
    ${ok}=    Open CLO By Url Candidates
    Run Keyword If    ${ok}    Return From Keyword
    ${ok}=    Open CLO From Reports Hub
    Run Keyword If    not ${ok}    Fail    Cannot open CLO page by any strategy.

Open CLO By Menu
    ${has}=    Run Keyword And Return Status    Page Should Contain Element    ${MENU_CLO}
    IF    not ${has}
        RETURN    False
    END
    Safe Click    ${MENU_CLO}
    Wait Until Document Ready
    Ensure Logged In
    ${ok}=    Run Keyword And Return Status    Wait For CLO Page    30s
    RETURN    ${ok}

Open CLO By Url Candidates
    FOR    ${u}    IN    @{CLO_URLS}
        Go To    ${u}
        Wait Until Document Ready
        Ensure Logged In
        ${ok}=    Run Keyword And Return Status    Wait For CLO Page    20s
        IF    ${ok}
            RETURN    True
        END
    END
    RETURN    False

Open CLO From Reports Hub
    FOR    ${h}    IN    @{REPORT_HUBS}
        Go To    ${h}
        Wait Until Document Ready
        Ensure Logged In
        ${clicked}=    Run Keyword And Return Status    Safe Click    ${ANY_CLO_LINK}
        Wait Until Document Ready
        ${ok}=    Run Keyword And Return Status    Wait For CLO Page    25s
        IF    ${ok}
            RETURN    True
        END
    END
    RETURN    False

# ---------- Page readiness ----------
Wait For CLO Page
    [Arguments]    ${timeout}=25s
    # Chỉ định nghĩa ASSERT; retry nằm ở đây
    Wait Until Keyword Succeeds    ${timeout}    0.5s    Assert CLO Ready

Assert CLO Ready
    ${ok}    ${url}=    Clo Markers Ready Check
    Should Be True    ${ok}    CLO markers not visible yet. URL=${url}

Clo Markers Ready Check
    ${url}=         Get Location
    ${on_url}=      Evaluate    'clo' in """${url}""".lower()
    ${seen_hdr}=    Run Keyword And Return Status    Page Should Contain Element    ${CLO_HDR}
    ${seen_s}=      Run Keyword And Return Status    Page Should Contain Element    ${CLO_SEARCH}
    ${seen_c1}=     Run Keyword And Return Status    Page Should Contain Element    ${CARD_TRACKING}
    ${seen_c2}=     Run Keyword And Return Status    Page Should Contain Element    ${CARD_PLO}
    ${seen_c3}=     Run Keyword And Return Status    Page Should Contain Element    ${CARD_GAP}
    ${ok}=          Evaluate    ${on_url} or ${seen_hdr} or ${seen_s} or ${seen_c1} or ${seen_c2} or ${seen_c3}
    RETURN    ${ok}    ${url}

# ---------- Actions ----------
CLO Search If Present
    [Arguments]    ${keyword}
    ${has}=    Run Keyword And Return Status    Page Should Contain Element    ${CLO_SEARCH}
    IF    not ${has}
        RETURN
    END
    Clear Element Text    ${CLO_SEARCH}
    Input Text    ${CLO_SEARCH}    ${keyword}
    Press Keys    ${CLO_SEARCH}    ENTER
    Wait Until Document Ready

Open CLO Card
    [Arguments]    ${name}
    ${locator}=    Set Variable If
    ...    '${name}'=='tracking'      ${CARD_TRACKING}
    ...    '${name}'=='plo'           ${CARD_PLO}
    ...    '${name}'=='gap'           ${CARD_GAP}
    ...                               ${EMPTY}
    Should Not Be Empty    ${locator}    Unknown card: ${name}
    ${has}=    Run Keyword And Return Status    Page Should Contain Element    ${locator}
    IF    not ${has}
        RETURN
    END
    Safe Click    ${locator}
    Wait Until Document Ready

Go To My Classes From CLO
    [Arguments]    ${owner}=SIU TOMY
    ${has}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${BTN_MY_CLASSES}    12s
    IF    not ${has}
        RETURN
    END
    Log To Console    Going to My Classes (Owner: ${owner})
    Safe Click    ${BTN_MY_CLASSES}
    Wait Until Keyword Succeeds    20x    0.25s    Assert On Classes

Assert On Classes
    ${url}=    Get Location
    ${ok}=     Evaluate    "/classes" in """${url}""" or "/myclasses" in """${url}"""
    Should Be True    ${ok}    Not on classes page. URL=${url}
