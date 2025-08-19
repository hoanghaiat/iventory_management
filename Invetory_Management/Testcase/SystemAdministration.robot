*** Settings ***
Library    SeleniumLibrary
Resource    ../Resource/SystemAdministration.resource
Resource    ../Resource/Login.resource
Variables    ../Variables/locator.py
Test Setup    Login To System
Test Teardown    Close Browser


*** Test Cases ***
AD_001 - Kiểm tra truy cập trang quản trị sau khi đăng nhập
    [Documentation]    AD_001  
    [Tags]    Thu Uyên    Trang quản trị
    Open Admin Page
    
AD_002 - Điều hướng đến trang quản lý tài khoản
    [Documentation]    AD_002
    [Tags]    Thu Uyên    Trang quản trị
    Open Admin Page
    Navigate to Account Management
    
AD_003 - Điều hướng đến trang quản lý đơn vị
    [Documentation]    AD_003
    [Tags]    Thu Uyên    Trang quản trị
    Open Admin Page
    Navigate to Unit Management
   
AD_004 - Điều hướng đến trang quản lý phông lưu trữ
    [Documentation]    AD_004
    [Tags]    Thu Uyên    Trang quản trị
    Open Admin Page
    Navigate to Fonds Management
    Open Admin Page
    Navigate to Fonds Management
AD_005 - Điều hướng đến trang quản lý mục lục hồ sơ
    [Documentation]    AD_005
    [Tags]    Thu Uyên    Trang quản trị
    Open Admin Page
    Navigate to Catalog Management
AD_006 - Điều hướng từ liên kết "Quản lý tài khoản người dùng" đến quản lý tài khoản
    [Documentation]    AD_006
    [Tags]    Thu Uyên    Trang quản trị
    Open Admin Page
    Navigate from User Menu to Account Management
AD_007 - Điều hướng đến trang nhật ký hệ thống
    [Documentation]    AD_007
    [Tags]    Thu Uyên    Trang quản trị
    Open Admin Page
    Navigate to System Logs
ACC_01 - Mở trang quản lý tài khoản
    [Documentation]    ACC_01
    [Tags]    Thu Uyên    Quản lý tài khoản
    Open Account Management 
ACC_02 - Thêm tài khoản hợp lệ
    [Documentation]    ACC_02
    [Tags]    Thu Uyên    Quản lý tài khoản
    Open Account Management
    Click Add Account Button
    Add Account        user3   user3@warehouse.vn   password123   password123
    Wait Until Page Contains    Tài khoản ${username} đã được tạo thành công    timeout=10s
ACC_03 - Thêm tài khoản thiếu trường bắt buộc
    [Documentation]    ACC_03
    [Tags]    Thu Uyên    Quản lý tài khoản
    Open Account Management
    Click Add Account Button
    Add Account    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}
    Wait Until Page Contains    Tên đăng nhập là bắt buộc    timeout=10s
    Wait Until Page Contains    Email là bắt buộc             timeout=10s
    Wait Until Page Contains    Mật khẩu là bắt buộc          timeout=10s
    Wait Until Page Contains    Xác nhận mật khẩu là bắt buộc  timeout=10s
ACC_04 - Thêm tài khoản khi xác nhận mật khẩu không khớp
    [Documentation]    ACC_04
    [Tags]    Thu Uyên    Quản lý tài khoản
    Open Account Management
    Click Add Account Button
    Add Account    user5   user5@warehouse.vn   password123   password456
    Scroll Element Into View    ${addacc_submit_btn_xpath}
    Wait Until Page Contains    Mật khẩu xác nhận không khớp    timeout=10s
ACC_05 - Thêm tài khoản khi tên đăng nhập đã tồn tại
    [Documentation]    ACC_05
    [Tags]    Thu Uyên    Quản lý tài khoản
    Open Account Management
    Click Add Account Button
    Add Account    user3   user@warehouse.vn   password123   password123
    Wait Until Page Contains    Tên đăng nhập đã tồn tại   timeout=10s
ACC_06 - Thêm tài khoản khi email không đúng định dạng
    [Documentation]    ACC_06
    [Tags]    Thu Uyên    Quản lý tài khoản
    Open Account Management
    Click Add Account Button
    Add Account    user4   user4#warehouse.vn   password123   password123
    Wait Until Page Contains    Email không hợp lệ  timeout=10s
ACC_07 - Xem chi tiết tài khoản
    [Documentation]    ACC_07
    [Tags]    Thu Uyên    Quản lý tài khoản
    Open Account Management
    View Account Details
ACC_08 - Hiển thị số lượng bản ghi mặc định trên mỗi trang
    [Documentation]    ACC_08
    [Tags]    Thu Uyên    Quản lý tài khoản
    Open Account Management
    Show entities per page    5
ACC_09 - Hiển thị số lượng bản ghi trên mỗi trang
    [Documentation]    ACC_09
    [Tags]    Thu Uyên    Quản lý tài khoản
    Open Account Management
    Show entities per page    10
ACC_10 - Điều hướng đến trang Dashboard
    [Documentation]    ACC_10
    [Tags]    Thu Uyên    Quản lý tài khoản
    Open Account Management
    Navigate to Dashboard
    
ACC_11 - Chỉnh sửa tài khoản
    [Documentation]    ACC_11
    [Tags]    Thu Uyên    Quản lý tài khoản
    Open Account Management
    Click Edit Icon 
ACC_12 - Xóa trường bắt buộc Email khi sửa tài khoản
    [Documentation]    ACC_12
    [Tags]    Thu Uyên    Quản lý tài khoản
    Open Account Management
    Click Edit Icon
    Clear Required Field Email
    Wait Until Page Contains    Email là bắt buộc    timeout=10s
ACC_13 - Cập nhật tài khoản thành công
    [Documentation]    ACC_13
    [Tags]    Thu Uyên    Quản lý tài khoản
    Open Account Management
    Click Edit Icon
    Update Successfully    user3
ACC_14 - Hủy bỏ chỉnh sửa
    [Documentation]    ACC_14
    [Tags]    Thu Uyên    Quản lý tài khoản
    Open Account Management
    Click Edit Icon
    Cancel Edit
    Capture Page Screenshot
ACC_15 - Xem phân quyền tài khoản
    [Documentation]    ACC_15
    [Tags]    Thu Uyên    Quản lý tài khoản
    Open Account Management
    Click Edit Icon
    View Permissions
ACC_16 - Nhấn nút "Chỉnh sửa" trong giao diện phân quyền
    [Documentation]    ACC_16
    [Tags]    Thu Uyên    Quản lý tài khoản
    Open Account Management
    Click Edit Icon
    View Permissions
    Click Edit Button in Permission Interface
ACC_17 - Nhấn nút "Đổi mật khẩu" trong giao diện phân quyền
    [Documentation]    ACC_17
    [Tags]    Thu Uyên    Quản lý tài khoản
    Open Account Management
    Click Key Icon (Change Password)
    Capture Page Screenshot
ACC_18 - Thay đổi mật khẩu thành công
    [Documentation]    ACC_18
    [Tags]    Thu Uyên    Quản lý tài khoản
    Open Account Management
    Click Key Icon (Change Password)
    Change Password    newpassword123   newpassword123
    Wait Until Page Contains    Mật khẩu của người dùng ${acc_to_change} đã được cập nhật   timeout=15s
ACC_19 - Bỏ trống các trường khi thay đổi mật khẩu
    [Documentation]    ACC_19
    [Tags]    Thu Uyên    Quản lý tài khoản
    Open Account Management
    Click Key Icon (Change Password)
    Change Password    ${EMPTY}   ${EMPTY}
    Wait Until Page Contains    Trường này là bắt buộc.    timeout=15s
ACC_20 - Thay đổi mật khẩu không khớp
    [Documentation]    ACC_20
    [Tags]    Thu Uyên    Quản lý tài khoản
    Open Account Management
    Click Key Icon (Change Password)
    Change Password    newpassword123   differentpassword
    Wait Until Page Contains    Mật khẩu xác nhận không khớp  timeout=15s
ACC_21 - Mật khẩu quá ngắn
    [Documentation]    ACC_21
    [Tags]    Thu Uyên    Quản lý tài khoản
    Open Account Management
    Click Key Icon (Change Password)
    Check Password Length Error Message    abc    abc
ACC_22 - Nhấn hủy đổi mật khẩu
    [Documentation]    ACC_22
    [Tags]    Thu Uyên    Quản lý tài khoản
    Open Account Management
    Click Key Icon (Change Password)
    Click Cancel Password Change


SL_001 - Mở trang Nhật ký hệ thống
    [Documentation]    SL_001
    [Tags]    Thu Uyên   Nhật ký hệ thống
    Open System Logs
SL_002 - Kiểm tra Lọc log Lỗi (ERROR)
    [Documentation]    SL_002
    [Tags]    Thu Uyên   Nhật ký hệ thống
    Open System Logs
    Select Log Type    Lỗi (ERROR)
    Click Filter Button
    Wait Until Page Contains    ERROR
    Check Log Type Color    ERROR    red
SL_003 - Kiểm tra Lọc log Cảnh báo (WARNING)
    [Documentation]    SL_003
    [Tags]    Thu Uyên   Nhật ký hệ thống
    Open System Logs
    Select Log Type    Cảnh báo (WARNING)
    Click Filter Button
    Wait Until Page Contains    WARNING
    Check Log Type Color    WARNING    orange
SL_004 - Kiểm tra Lọc log Thông tin (INFO)
    [Documentation]    SL_004
    [Tags]    Thu Uyên   Nhật ký hệ thống
    Open System Logs
    Select Log Type    Thông tin (INFO)
    Click Filter Button
    Wait Until Page Contains    INFO
    Check Log Type Color    INFO    green
SL_005 - Kiểm tra Lọc log Debug
    [Documentation]    SL_005
    [Tags]    Thu Uyên   Nhật ký hệ thống
    Open System Logs
    Select Log Type    Debug
    Click Filter Button
    Wait Until Page Contains    DEBUG
    Check Log Type Color    DEBUG    purple
SL_006 - Kiểm tra thay đổi số lượng log hiển thị
    [Documentation]    SL_006
    [Tags]    Thu Uyên   Nhật ký hệ thống
    Open System Logs
    Show Logs Per Page And Verify   10
SL_007 - Kiểm tra phân trang
    [Documentation]    SL_007
    [Tags]    Thu Uyên   Nhật ký hệ thống
    Open System Logs
    Go To Page    3
SL_008 - Kiểm tra nút "Quay lại trang quản trị"
    [Documentation]    SL_008
    [Tags]    Thu Uyên   Nhật ký hệ thống
    Open System Logs
    Back to Admin Page
SL_009 - Kiểm tra nút "Làm mới" dữ liệu log
    [Documentation]    SL_009
    [Tags]    Thu Uyên   Nhật ký hệ thống
    Open System Logs
    Refresh Logs
