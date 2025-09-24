*** Settings ***
Library    SeleniumLibrary
Library    String
Variables   ../variables/locator.py
*** Variables ***
${url}    https://kholuutru.minds.vn
${timeout}    10s
${username}    admin_qc_automation
${password}    admin_qc_automation

${url_unit}     ${url}/don-vi
${url_phong}    ${url}/phong
${url_index}    ${url}/muc-luc
${url_warehouse}    ${url}/kho
${url_box}    ${url}/hop
${url_shelf}    ${url}/gia
${url_search}    ${url}/search
${url_report}    ${url}/reports

${url_add_unit}    ${url_unit}/add
${url_add_phong}    ${url_phong}/add
${url_add_index}    ${url_index}/add
${url_add_warehouse}    ${url_warehouse}/add
${url_add_box}    ${url_box}/add
${url_add_shelf}    ${url_shelf}/add


*** Keywords ***
Login To System
    Open Browser    ${url}    chrome
    Maximize Browser Window
    Wait Until Element Is Visible    ${INPUT_USERNAME}    30s
    Input Text    ${INPUT_USERNAME}    ${username}
    Input Text    ${INPUT_PASSWORD}    ${password}
    Click Button  ${LOGINBTN}
    
Get And Compare Count
    [Arguments]    ${box_name}    ${menu_locator}    ${item_box}
    ${locator}=    Set Variable    xpath=//div[contains(@class,"stats-card") and .//div[contains(@class,"stat-label") and contains(normalize-space(.),"${box_name}")]]//span[@class="stat-number"]
    Wait Until Element Is Visible    ${locator}    ${timeout}
    ${so_trang_chu}=    Get Text                ${locator}
    ${so_trang_chu}=    Strip String            ${so_trang_chu}
    ${so_trang_chu}=    Convert To Integer      ${so_trang_chu}
    Log    Số trên Trang chủ (${box_name}): ${so_trang_chu}

    Click Element    ${menu_locator}
    Wait Until Page Contains    ${item_box}    ${timeout}
    ${item_locator}=    Set Variable    xpath=//div[contains(@class,"stats-card")]//div[normalize-space(.)="${item_box}"]/preceding-sibling::span[@class="stat-number"]
    Wait Until Element Is Visible    ${item_locator}    ${timeout}
    ${item_count}=    Get Text                ${item_locator}
    ${item_count}     Strip String            ${item_count}
    ${item_count}=    Convert To Integer      ${item_count}
    Log To Console        Số Trang Item (${item_box}): ${item_count}

    # So sánh
    Should Be Equal As Integers    ${so_trang_chu}    ${item_count}    Số không khớp cho "${box_name}"


Quick Add New Units
    Click Element    ${QUICK_ADD_NEW_UNIT}
    Wait Until Location Is    ${url_add_unit}

Quick Add Phong
    Click Element    ${QUICK_ADD_PHONG}
    Wait Until Location Is    ${url_add_phong}

Quick Add Profile Table of Contents
    Scroll Element Into View    ${QUICK_ADD_INDEX}
    Click Element    ${QUICK_ADD_INDEX}
    Wait Until Location Is    ${url_add_index}

Quick Add Warehouse
    #Wait Until Element Is Visible    ${Quick_Add_Warehouse}    10s
    Scroll Element Into View    ${QUICK_ADD_WAREHOUSE}
    Click Element    ${QUICK_ADD_WAREHOUSE}
    Wait Until Location Is    ${url_add_warehouse}

Quick Add shelf
    Wait Until Element Is Visible    ${QUICK_ADD_SHELF}    30s
    Scroll Element Into View    ${QUICK_ADD_SHELF}
    Click Element    ${QUICK_ADD_SHELF}
    Wait Until Location Is    ${url_add_shelf}

Quick Add Box
    Wait Until Element Is Visible    ${quick_add_box}    30s
    Scroll Element Into View    ${QUICK_ADD_BOX}
    Click Element    ${QUICK_ADD_BOX}
    Wait Until Location Is    ${url_add_box}

Quick Add Document Search
    Click Element    ${QUICK_ADD_DOCUMENT_SEARCH}
    Wait Until Location Is    ${url_search}

Quick Add See report
    Wait Until Element Is Visible    ${QUICK_ADD_SEE_REPORT}    30s
    Scroll Element Into View    ${QUICK_ADD_SEE_REPORT}
    Click Element    ${QUICK_ADD_SEE_REPORT}
    Wait Until Location Is    ${url_report}
Logout
    Wait Until Element Is Visible    ${LOGOUT}    30s
    Scroll Element Into View    ${LOGOUT}
    Click Element    ${LOGOUT}
    Wait Until Element Is Visible    ${INPUT_USERNAME}    30s

Verify Page Title
    [Arguments]    ${expected_title}
    Wait Until Element Is Visible    ${PAGE_TITLE}    30s
    Element Should Contain    ${PAGE_TITLE}    ${expected_title}

Click Unit
    Wait Until Element Is Visible    ${ITEM_UNIT}    30s
    Click Element    ${ITEM_UNIT}
    
Click Phong
    Wait Until Element Is Visible    ${ITEM_PHONG}    30s
    Click Element    ${ITEM_PHONG}

Click Profile Table of Contents
    Wait Until Element Is Visible    ${ITEM_INDEX}    30s
    Click Element    ${ITEM_INDEX}

Click Warehouse
    Wait Until Element Is Visible    ${ITEM_WARWHOUSE}    30s
    Click Element    ${ITEM_WARWHOUSE}

Click shelf
    Wait Until Element Is Visible    ${ITEM_SHELF}    30s
    Click Element    ${ITEM_SHELF}

Click Box
    Wait Until Element Is Visible    ${ITEM_BOX}    30s
    Click Element    ${ITEM_BOX}

Click Search
    Wait Until Element Is Visible    ${ITEM_SEARCH}    30s
    Click Element    ${ITEM_SEARCH}

Click Report
    Wait Until Element Is Visible    ${ITEM_REPORT}    30s
    Click Element    ${ITEM_REPORT}

Click Admin Page
    Wait Until Element Is Visible    ${ITEM_ADMIN_PAGE}    30s
    Scroll Element Into View    ${ITEM_ADMIN_PAGE}
    Click Element    ${ITEM_ADMIN_PAGE}
    Wait Until Page Contains    Trang quản trị hệ thống

Click Account Management
    Wait Until Element Is Visible    ${ITEM_ACCOUNT_MANAGEMENT}    30s
    Scroll Element Into View    ${ITEM_ACCOUNT_MANAGEMENT}
    Click Element    ${ITEM_ACCOUNT_MANAGEMENT}

Click System Log
    Wait Until Element Is Visible    ${ITEM_SYSTEM_LOG}    30s
    Scroll Element Into View    ${ITEM_SYSTEM_LOG}
    Click Element    ${ITEM_SYSTEM_LOG}
    Wait Until Page Contains    Nhật ký hệ thống

Click Interface 
    Wait Until Element Is Visible    ${ITEM_INTERFACE}    30s
    Scroll Element Into View    ${ITEM_INTERFACE}
    Click Element    ${ITEM_INTERFACE}
    Wait Until Page Contains    Cài đặt giao diện

Click Logout menu
    Wait Until Element Is Visible    ${LOGOUT_MENU}    30s
    Scroll Element Into View    ${LOGOUT_MENU}
    Click Element    ${LOGOUT_MENU}
    Wait Until Element Is Visible    ${INPUT_USERNAME}    30s

Close menu
    Wait Until Element Is Not Visible    ${MENU}    30s
    Click Element    ${SIDEBAR}
    Wait Until Element Is Not Visible    ${QL_KHOO}    30s

Close QLToChuc
    Wait Until Element Is Not Visible    ${MENU}    30s
    Click Element    ${QL_TO_CHUC}
    Wait Until Element Is Not Visible    ${ITEM_UNIT}    30s

Close QLKho2
    Wait Until Element Is Not Visible    ${MENU}    30s
    Click Element    ${QL_KHOO}
    Wait Until Element Is Not Visible    ${ITEM_WARWHOUSE}    30s

Close Search_Report
    Wait Until Element Is Not Visible    ${MENU}    30s
    Click Element    ${SEARCH_REPORT}
    Wait Until Element Is Not Visible    ${ITEM_SEARCH}    30s

Close QTHeThong
    Wait Until Element Is Not Visible    ${MENU}    30s
    Click Element    ${QT_HE_THONG}
    Wait Until Element Is Not Visible    ${ITEM_ADMIN_PAGE}    30s
Close CaNhan
    Wait Until Element Is Not Visible    ${MENU}    30s
    Click Element    ${CA_NHAN}
    Wait Until Element Is Not Visible    ${ITEM_INTERFACE}    30s