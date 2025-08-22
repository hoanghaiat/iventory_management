*** Settings ***
Library    SeleniumLibrary
Library    String
Variables   ../Variables/locator.py


*** Keywords ***
Login To System
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Wait Until Element Is Visible    ${username_xpath}    30s
    Input Text    ${username_xpath}    ${USERNAME}
    Input Text    ${password_xpath}    ${PASSWORD}
    Click Button  ${loginbtn_xpath}
    
Get And Compare Count
    [Arguments]    ${box_name}    ${menu_locator}    ${item_box}
    # Lấy số trên homepage box
    ${locator}=    Set Variable    xpath=//div[contains(@class,"stats-card") and .//div[contains(@class,"stat-label") and contains(normalize-space(.),"${box_name}")]]//span[@class="stat-number"]
    Wait Until Element Is Visible    ${locator}    ${TIMEOUT}
    ${so_trang_chu}=    Get Text                ${locator}
    ${so_trang_chu}=    Strip String            ${so_trang_chu}
    ${so_trang_chu}=    Convert To Integer      ${so_trang_chu}
    Log    Số trên Trang chủ (${box_name}): ${so_trang_chu}

    # Lấy số trong item menu
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
    Click Element    ${Quick_Add_New_Unit_xpath}
    Wait Until Page Contains    Thêm Đơn vị

Quick Add Storage Room
    Click Element    ${Quick_Add_Storage_Room}
    Wait Until Page Contains    Thêm Phông lưu trữ mới

Quick Add Profile Table of Contents
    Scroll Element Into View    ${Quick_Add_Profile_Table_Contents}
    Click Element    ${Quick_Add_Profile_Table_Contents}
    Wait Until Page Contains    Thêm Mục lục hồ sơ mới

Quick Add Warehouse
    #Wait Until Element Is Visible    ${Quick_Add_Warehouse}    10s
    Scroll Element Into View    ${Quick_Add_Warehouse}
    Click Element    ${Quick_Add_Warehouse}
    Wait Until Page Contains    Thêm Kho mới

Quick Add shelf
    Wait Until Element Is Visible    ${Quick_Add_shelf}    10s
    Scroll Element Into View    ${Quick_Add_shelf}
    Click Element    ${Quick_Add_shelf}
    Wait Until Page Contains    Thêm Giá kệ mới

Quick Add Box
    Wait Until Element Is Visible    ${Quick_Add_Box}    10s
    Scroll Element Into View    ${Quick_Add_Box}
    Click Element    ${Quick_Add_Box}
    Wait Until Page Contains    Thêm Hộp lưu trữ mới

Quick Add Document Search
    Click Element    ${Quick_Add_Document_Search}
    Wait Until Page Contains    Tìm kiếm

Quick Add See report
    Wait Until Element Is Visible    ${Quick_Add_See_Report}    10s
    Scroll Element Into View    ${Quick_Add_See_Report}
    Click Element    ${Quick_Add_See_Report}
    Wait Until Page Contains    Hệ thống Quản lý Kho
Logout
    Wait Until Element Is Visible    ${Logout}    10s
    Scroll Element Into View    ${Logout}
    Click Element    ${Logout}
    Wait Until Element Is Visible    ${username_xpath}    10s

Click Unit
    Wait Until Element Is Visible    ${Item_Unit}    10s
    Click Element    ${Item_Unit}
    Wait Until Page Contains    Quản lý Đơn vị

Click Storage Room
    Wait Until Element Is Visible    ${Item_Storage_Room}    10s
    Click Element    ${Item_Storage_Room}
    Wait Until Page Contains    Quản lý Phông Lưu trữ

Click Profile Table of Contents
    Wait Until Element Is Visible    ${Item_Profile_Table_Contents}    10s
    Click Element    ${Item_Profile_Table_Contents}
    Wait Until Page Contains    Quản lý Mục lục hồ sơ

Click Warehouse
    Wait Until Element Is Visible    ${Item_Warehouse}    10s
    Click Element    ${Item_Warehouse}
    Wait Until Page Contains    Quản lý Kho lưu trữ

Click shelf
    Wait Until Element Is Visible    ${Item_shelf}    10s
    Click Element    ${Item_shelf}
    Wait Until Page Contains    Quản lý Giá kệ

Click Box
    Wait Until Element Is Visible    ${Item_Box}    10s
    Click Element    ${Item_Box}
    Wait Until Page Contains    Quản lý Hộp lưu trữ

Click Search
    Wait Until Element Is Visible    ${Item_Search}    10s
    Click Element    ${Item_Search}
    Wait Until Page Contains    Tìm kiếm

Click Report
    Wait Until Element Is Visible    ${Item_Report}    10s
    Click Element    ${Item_Search}
    Wait Until Page Contains    Báo cáo thống kê

Click Admin Page
    Wait Until Element Is Visible    ${Item_Admin_Page}    10s
    Scroll Element Into View    ${Item_Admin_Page}
    Click Element    ${Item_Admin_Page}
    Wait Until Page Contains    Trang quản trị hệ thống

Click Account Management
    Wait Until Element Is Visible    ${Item_Account_Management}    10s
    Scroll Element Into View    ${Item_Account_Management}
    Click Element    ${Item_Account_Management}
    Wait Until Page Contains    Quản lý tài khoản

Click System Log
    Wait Until Element Is Visible    ${Item_System_Log}    10s
    Scroll Element Into View    ${Item_System_Log}
    Click Element    ${Item_System_Log}
    Wait Until Page Contains    Nhật ký hệ thống

Click Interface 
    Wait Until Element Is Visible    ${Item_Interface}    10s
    Scroll Element Into View    ${Item_Interface}
    Click Element    ${Item_Interface}
    Wait Until Page Contains    Cài đặt giao diện

Click Logout menu
    Wait Until Element Is Visible    ${Logout_Menu}    10s
    Scroll Element Into View    ${Logout_Menu}
    Click Element    ${Logout_Menu}
    Wait Until Element Is Visible    ${username_xpath}    10s

Close menu
    Wait Until Page Contains    Quản lý Kho    10s
    Click Element    ${SideBar}
    Wait Until Element Is Not Visible    ${QLKho}    10s

Close QLToChuc
    Wait Until Page Contains    Quản lý Kho    10s
    Click Element    ${QLToChuc}
    Wait Until Element Is Not Visible    ${Item_Unit}    10s

Close QLKho2
    Wait Until Page Contains    Quản lý Kho    10s
    Click Element    ${QLKho2}
    Wait Until Element Is Not Visible    ${Item_Warehouse}    10s

Close Search_Report
    Wait Until Page Contains    Quản lý Kho    10s
    Click Element    ${Search_Report}
    Wait Until Element Is Not Visible    ${Item_Search}    10s

Close QTHeThong
    Wait Until Page Contains    Quản lý Kho    10s
    Click Element    ${QTHeThong}
    Wait Until Element Is Not Visible    ${Item_Admin_Page}    10s
Close CaNhan
    Wait Until Page Contains    Quản lý Kho    10s
    Click Element    ${CaNhan}
    Wait Until Element Is Not Visible    ${Item_Interface}    10s