*** Settings ***
Library    SeleniumLibrary
Resource    ../Resource/SystemAdministration.resource
Test Setup    Login To System
Test Teardown    Close Browser


*** Test Cases ***
AD_001 - Truy cập trang quản trị
    [Documentation]    Kiểm tra truy cập trang quản trị sau khi đăng nhập
    [Tags]    positive
    Open Admin Page
    
AD_002 - Điều hướng đến trang quản lý tài khoản
    [Documentation]    Kiểm tra liên kết "Người dùng"
    [Tags]    positive
    Open Admin Page
    Navigate to Account Management
    
AD_003 - Điều hướng đến trang quản lý đơn vị
    [Documentation]    Kiểm tra liên kết "Đơn vị"
    [Tags]    positive
    Open Admin Page
    Navigate to Unit Management
   
AD_004 - Điều hướng đến trang quản lý phông lưu trữ
    [Documentation]    Kiểm tra liên kết "Phông lưu trữ"
    [Tags]    positive
    Open Admin Page
    Navigate to Fonds Management
 
AD_005 - Điều hướng đến trang quản lý mục lục hồ sơ
    [Documentation]    Kiểm tra liên kết "Mục lục hồ sơ"
    [Tags]    positive
    Open Admin Page
    Navigate to Catalog Management
   
AD_006 - Điều hướng từ liên kết "Quản lý tài khoản người dùng" đến quản lý tài khoản
    [Documentation]    Kiểm tra liên kết "Quản lý tài khoản người dùng"
    [Tags]    positive
    Open Admin Page
    Navigate from User Menu to Account Management
   
AD_007 - Điều hướng đến trang nhật ký hệ thống
    [Documentation]    Kiểm tra liên kết "Xem nhật ký hệ thống"
    [Tags]    positive
    Open Admin Page
    Navigate to System Logs
  
ACC_01 - Mở trang quản lý tài khoản
    [Documentation]    Kiểm tra truy cập trang quản lý tài khoản
    [Tags]    positive
    Open Account Management 
    
ACC_02 - Nhấn nút "Thêm tài khoản"
    [Documentation]    Kiểm tra nút "Thêm tài khoản"
    [Tags]    positive
    Open Account Management
    Click Add Account Button
  
ACC_03 - Thêm tài khoản hợp lệ
    [Documentation]    Kiểm tra thêm tài khoản hợp lệ
    [Tags]    positive
    Open Account Management
    Click Add Account Button
    Add Account        user3   user3@warehouse.vn   password123   password123
    Wait Until Page Contains    Tài khoản ${username} đã được tạo thành công    timeout=10s
ACC_04 - Thêm tài khoản thiếu trường bắt buộc
    [Documentation]    Kiểm tra thêm tài khoản thiếu trường bắt buộc
    [Tags]    negative
    Open Account Management
    Click Add Account Button
    Add Account    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}
    Wait Until Page Contains    Tên đăng nhập là bắt buộc    timeout=10s
    Wait Until Page Contains    Email là bắt buộc             timeout=10s
    Wait Until Page Contains    Mật khẩu là bắt buộc          timeout=10s
    Wait Until Page Contains    Xác nhận mật khẩu là bắt buộc  timeout=10s
   
ACC_05 - Thêm tài khoản khi xác nhận mật khẩu không khớp
    [Documentation]    Kiểm tra thêm tài khoản khi xác nhận mật khẩu không khớp
    [Tags]    negative
    Open Account Management
    Click Add Account Button
    Add Account    user5   user5@warehouse.vn   password123   password456
    Scroll Element Into View    ${addacc_submit_btn_xpath}
    Wait Until Page Contains    Mật khẩu xác nhận không khớp    timeout=10s
    
ACC-05 - Thêm tài khoản khi tên đăng nhập đã tồn tại
    [Documentation]    Kiểm tra thêm tài khoản khi tên đăng nhập đã tồn tại
    [Tags]    negative
    Open Account Management
    Click Add Account Button
    Add Account    user3   user3@warehouse.vn   password123   password123
    Wait Until Page Contains    Tên đăng nhập đã tồn tại   timeout=10s