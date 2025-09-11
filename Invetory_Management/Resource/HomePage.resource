*** Settings ***
Library    SeleniumLibrary
Library    String
Variables   ../Variables/locator.py


*** Keywords ***
Login To System
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Wait Until Element Is Visible    ${USERNAME_XPATH}    30s
    Input Text    ${USERNAME_XPATH}    ${USERNAME}
    Input Text    ${PASSWORD_XPATH}    ${PASSWORD}
    Click Button  ${LOGINBTN_XPATH}
    
Get And Compare Count
    [Arguments]    ${box_name}    ${menu_locator}    ${item_box}
    ${locator}=    Set Variable    xpath=//div[contains(@class,"stats-card") and .//div[contains(@class,"stat-label") and contains(normalize-space(.),"${box_name}")]]//span[@class="stat-number"]
    Wait Until Element Is Visible    ${locator}    ${TIMEOUT}
    ${so_trang_chu}=    Get Text                ${locator}
    ${so_trang_chu}=    Strip String            ${so_trang_chu}
    ${so_trang_chu}=    Convert To Integer      ${so_trang_chu}
    Log    Số trên Trang chủ (${box_name}): ${so_trang_chu}

    Click Element    ${menu_locator}
    Wait Until Page Contains    ${item_box}    ${TimeOut}
    ${item_locator}=    Set Variable    xpath=//div[contains(@class,"stats-card")]//div[normalize-space(.)="${item_box}"]/preceding-sibling::span[@class="stat-number"]
    Wait Until Element Is Visible    ${item_locator}    ${TimeOut}
    ${item_count}=    Get Text                ${item_locator}
    ${item_count}     Strip String            ${item_count}
    ${item_count}=    Convert To Integer      ${item_count}
    Log To Console        Số Trang Item (${item_box}): ${item_count}

    # So sánh
    Should Be Equal As Integers    ${so_trang_chu}    ${item_count}    Số không khớp cho "${box_name}"


Quick Add New Units
    Click Element    ${QUICK_ADD_NEW_UNIT_XPATH}
    Wait Until Page Contains    Thêm Đơn vị

Quick Add Storage Room
    Click Element    ${QUICK_ADD_STORAGE_ROOM}
    Wait Until Page Contains    Thêm Phông lưu trữ mới

Quick Add Profile Table of Contents
    Scroll Element Into View    ${QUICK_ADD_PROFILE_TABLE_CONTENTS}
    Click Element    ${QUICK_ADD_PROFILE_TABLE_CONTENTS}
    Wait Until Page Contains    Thêm Mục lục hồ sơ mới

Quick Add Warehouse
    #Wait Until Element Is Visible    ${Quick_Add_Warehouse}    10s
    Scroll Element Into View    ${QUICK_ADD_WAREHOUSE}
    Click Element    ${QUICK_ADD_WAREHOUSE}
    Wait Until Page Contains    Thêm Kho mới

Quick Add shelf
    Wait Until Element Is Visible    ${QUICK_ADD_SHELF}    10s
    Scroll Element Into View    ${QUICK_ADD_SHELF}
    Click Element    ${QUICK_ADD_SHELF}
    Wait Until Page Contains    Thêm Giá kệ mới

Quick Add Box
    Wait Until Element Is Visible    ${QUICK_ADD_BOX}    10s
    Scroll Element Into View    ${QUICK_ADD_BOX}
    Click Element    ${QUICK_ADD_BOX}
    Wait Until Page Contains    Thêm Hộp lưu trữ mới

Quick Add Document Search
    Click Element    ${QUICK_ADD_DOCUMENT_SEARCH}
    Wait Until Page Contains    Tìm kiếm

Quick Add See report
    Wait Until Element Is Visible    ${QUICK_ADD_SEE_REPORT}    10s
    Scroll Element Into View    ${QUICK_ADD_SEE_REPORT}
    Click Element    ${QUICK_ADD_SEE_REPORT}
    Wait Until Page Contains    Hệ thống Quản lý Kho
Logout
    Wait Until Element Is Visible    ${LOGOUT}    10s
    Scroll Element Into View    ${LOGOUT}
    Click Element    ${LOGOUT}
    Wait Until Element Is Visible    ${USERNAME_XPATH}    10s

Click Unit
    Wait Until Element Is Visible    ${ITEM_UNIT}    10s
    Click Element    ${ITEM_UNIT}
    Wait Until Page Contains    Quản lý Đơn vị

Click Storage Room
    Wait Until Element Is Visible    ${ITEM_STORAGE_ROOM}    10s
    Click Element    ${ITEM_STORAGE_ROOM}
    Wait Until Page Contains    Quản lý Phông Lưu trữ

Click Profile Table of Contents
    Wait Until Element Is Visible    ${ITEM_PROFILE_TABLE_CONTENTS}    10s
    Click Element    ${ITEM_PROFILE_TABLE_CONTENTS}
    Wait Until Page Contains    Quản lý Mục lục hồ sơ

Click Warehouse
    Wait Until Element Is Visible    ${ITEM_WAREHOUSE}    10s
    Click Element    ${ITEM_WAREHOUSE}
    Wait Until Page Contains    Quản lý Kho lưu trữ

Click shelf
    Wait Until Element Is Visible    ${ITEM_SHELF}    10s
    Click Element    ${ITEM_SHELF}
    Wait Until Page Contains    Quản lý Giá kệ

Click Box
    Wait Until Element Is Visible    ${ITEM_BOX}    10s
    Click Element    ${ITEM_BOX}
    Wait Until Page Contains    Quản lý Hộp lưu trữ

Click Search
    Wait Until Element Is Visible    ${ITEM_SEARCH}    10s
    Click Element    ${ITEM_SEARCH}
    Wait Until Page Contains    Tìm kiếm

Click Report
    Wait Until Element Is Visible    ${ITEM_REPORT}    10s
    Click Element    ${ITEM_SEARCH}
    Wait Until Page Contains    Báo cáo thống kê

Click Admin Page
    Wait Until Element Is Visible    ${ITEM_ADMIN_PAGE}    10s
    Scroll Element Into View    ${ITEM_ADMIN_PAGE}
    Click Element    ${ITEM_ADMIN_PAGE}
    Wait Until Page Contains    Trang quản trị hệ thống

Click Account Management
    Wait Until Element Is Visible    ${ITEM_ACCOUNT_MANAGEMENT}    10s
    Scroll Element Into View    ${ITEM_ACCOUNT_MANAGEMENT}
    Click Element    ${ITEM_ACCOUNT_MANAGEMENT}
    Wait Until Page Contains    Quản lý tài khoản

Click System Log
    Wait Until Element Is Visible    ${ITEM_SYSTEM_LOG}    10s
    Scroll Element Into View    ${ITEM_SYSTEM_LOG}
    Click Element    ${ITEM_SYSTEM_LOG}
    Wait Until Page Contains    Nhật ký hệ thống

Click Interface 
    Wait Until Element Is Visible    ${ITEM_INTERFACE}    10s
    Scroll Element Into View    ${ITEM_INTERFACE}
    Click Element    ${ITEM_INTERFACE}
    Wait Until Page Contains    Cài đặt giao diện

Click Logout menu
    Wait Until Element Is Visible    ${LOGOUT_MENU}    10s
    Scroll Element Into View    ${LOGOUT_MENU}
    Click Element    ${LOGOUT_MENU}
    Wait Until Element Is Visible    ${USERNAME_XPATH}    10s

Close menu
    Wait Until Page Contains    Quản lý Kho    10s
    Click Element    ${SIDEBAR}
    Wait Until Element Is Not Visible    ${QLKHOO}    10s

Close QLToChuc
    Wait Until Page Contains    Quản lý Kho    10s
    Click Element    ${QLTOCHUC}
    Wait Until Element Is Not Visible    ${ITEM_UNIT}    10s

Close QLKho2
    Wait Until Page Contains    Quản lý Kho    10s
    Click Element    ${QLKHOO}
    Wait Until Element Is Not Visible    ${ITEM_WAREHOUSE}    10s

Close Search_Report
    Wait Until Page Contains    Quản lý Kho    10s
    Click Element    ${SEARCH_REPORT}
    Wait Until Element Is Not Visible    ${ITEM_SEARCH}    10s

Close QTHeThong
    Wait Until Page Contains    Quản lý Kho    10s
    Click Element    ${QTHETHONG}
    Wait Until Element Is Not Visible    ${ITEM_ADMIN_PAGE}    10s
Close CaNhan
    Wait Until Page Contains    Quản lý Kho    10s
    Click Element    ${CANHAN}
    Wait Until Element Is Not Visible    ${ITEM_INTERFACE}    10s