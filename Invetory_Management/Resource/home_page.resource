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
    Wait Until Element Is Visible    ${username_xpath}    30s
    Input Text    ${username_xpath}    ${username}
    Input Text    ${password_xpath}    ${password}
    Click Button  ${loginbtn_xpath}
    
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
    Click Element    ${quick_add_new_unit}
    Wait Until Location Is    ${url_add_unit}

Quick Add Phong
    Click Element    ${quick_add_phong}
    Wait Until Location Is    ${url_add_phong}

Quick Add Profile Table of Contents
    Scroll Element Into View    ${quick_add_index}
    Click Element    ${quick_add_index}
    Wait Until Location Is    ${url_add_index}

Quick Add Warehouse
    #Wait Until Element Is Visible    ${Quick_Add_Warehouse}    10s
    Scroll Element Into View    ${quick_add_warehouse}
    Click Element    ${quick_add_warehouse}
    Wait Until Location Is    ${url_add_warehouse}

Quick Add shelf
    Wait Until Element Is Visible    ${quick_add_shelf}    10s
    Scroll Element Into View    ${quick_add_shelf}
    Click Element    ${quick_add_shelf}
    Wait Until Location Is    ${url_add_shelf}

Quick Add Box
    Wait Until Element Is Visible    ${quick_add_box}    10s
    Scroll Element Into View    ${quick_add_box}
    Click Element    ${quick_add_box}
    Wait Until Location Is    ${url_add_box}

Quick Add Document Search
    Click Element    ${quick_add_document_search}
    Wait Until Location Is    ${url_search}

Quick Add See report
    Wait Until Element Is Visible    ${quick_add_see_report}    10s
    Scroll Element Into View    ${quick_add_see_report}
    Click Element    ${quick_add_see_report}
    Wait Until Location Is    ${url_report}
Logout
    Wait Until Element Is Visible    ${logout}    10s
    Scroll Element Into View    ${logout}
    Click Element    ${logout}
    Wait Until Element Is Visible    ${username_xpath}    10s

Verify Page Title
    [Arguments]    ${expected_title}
    Wait Until Element Is Visible    ${page_title}    10s
    Element Should Contain    ${page_title}    ${expected_title}

Click Unit
    Wait Until Element Is Visible    ${item_unit}    10s
    Click Element    ${item_unit}
    
Click Phong
    Wait Until Element Is Visible    ${item_phong}    10s
    Click Element    ${item_phong}

Click Profile Table of Contents
    Wait Until Element Is Visible    ${item_index}    10s
    Click Element    ${item_index}

Click Warehouse
    Wait Until Element Is Visible    ${item_warwhouse}    10s
    Click Element    ${item_warwhouse}

Click shelf
    Wait Until Element Is Visible    ${item_shelf}    10s
    Click Element    ${item_shelf}

Click Box
    Wait Until Element Is Visible    ${item_box}    10s
    Click Element    ${item_box}

Click Search
    Wait Until Element Is Visible    ${item_search}    10s
    Click Element    ${item_search}

Click Report
    Wait Until Element Is Visible    ${item_report}    10s
    Click Element    ${item_report}

Click Admin Page
    Wait Until Element Is Visible    ${item_admin_page}    10s
    Scroll Element Into View    ${item_admin_page}
    Click Element    ${item_admin_page}
    Wait Until Page Contains    Trang quản trị hệ thống

Click Account Management
    Wait Until Element Is Visible    ${item_account_management}    10s
    Scroll Element Into View    ${item_account_management}
    Click Element    ${item_account_management}

Click System Log
    Wait Until Element Is Visible    ${item_system_log}    10s
    Scroll Element Into View    ${item_system_log}
    Click Element    ${item_system_log}
    Wait Until Page Contains    Nhật ký hệ thống

Click Interface 
    Wait Until Element Is Visible    ${item_interface}    10s
    Scroll Element Into View    ${item_interface}
    Click Element    ${item_interface}
    Wait Until Page Contains    Cài đặt giao diện

Click Logout menu
    Wait Until Element Is Visible    ${logout_menu}    10s
    Scroll Element Into View    ${logout_menu}
    Click Element    ${logout_menu}
    Wait Until Element Is Visible    ${username_xpath}    10s

Close menu
    Wait Until Page Contains    Quản lý Kho    10s
    Click Element    ${sidebar}
    Wait Until Element Is Not Visible    ${ql_khoo}    10s

Close QLToChuc
    Wait Until Page Contains    Quản lý Kho    10s
    Click Element    ${ql_to_chuc}
    Wait Until Element Is Not Visible    ${item_unit}    10s

Close QLKho2
    Wait Until Page Contains    Quản lý Kho    10s
    Click Element    ${ql_khoo}
    Wait Until Element Is Not Visible    ${item_warwhouse}    10s

Close Search_Report
    Wait Until Page Contains    Quản lý Kho    10s
    Click Element    ${search_report}
    Wait Until Element Is Not Visible    ${item_search}    10s

Close QTHeThong
    Wait Until Page Contains    Quản lý Kho    10s
    Click Element    ${qt_he_thong}
    Wait Until Element Is Not Visible    ${item_admin_page}    10s
Close CaNhan
    Wait Until Page Contains    Quản lý Kho    10s
    Click Element    ${ca_nhan}
    Wait Until Element Is Not Visible    ${item_interface}    10s