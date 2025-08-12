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
  
ACC_02 - Thêm tài khoản hợp lệ
    [Documentation]    Kiểm tra thêm tài khoản hợp lệ
    [Tags]    positive
    Open Account Management
    Click Add Account Button
    Add Account        user3   user3@warehouse.vn   password123   password123
    Wait Until Page Contains    Tài khoản ${username} đã được tạo thành công    timeout=10s
ACC_03 - Thêm tài khoản thiếu trường bắt buộc
    [Documentation]    Kiểm tra thêm tài khoản thiếu trường bắt buộc
    [Tags]    negative
    Open Account Management
    Click Add Account Button
    Add Account    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}
    Wait Until Page Contains    Tên đăng nhập là bắt buộc    timeout=10s
    Wait Until Page Contains    Email là bắt buộc             timeout=10s
    Wait Until Page Contains    Mật khẩu là bắt buộc          timeout=10s
    Wait Until Page Contains    Xác nhận mật khẩu là bắt buộc  timeout=10s
   
ACC_04 - Thêm tài khoản khi xác nhận mật khẩu không khớp
    [Documentation]    Kiểm tra thêm tài khoản khi xác nhận mật khẩu không khớp
    [Tags]    negative
    Open Account Management
    Click Add Account Button
    Add Account    user5   user5@warehouse.vn   password123   password456
    Scroll Element Into View    ${addacc_submit_btn_xpath}
    Wait Until Page Contains    Mật khẩu xác nhận không khớp    timeout=10s
    
ACC_05 - Thêm tài khoản khi tên đăng nhập đã tồn tại
    [Documentation]    Kiểm tra thêm tài khoản khi tên đăng nhập đã tồn tại
    [Tags]    negative
    Open Account Management
    Click Add Account Button
    Add Account    user3   user3@warehouse.vn   password123   password123
    Wait Until Page Contains    Tên đăng nhập đã tồn tại   timeout=10s

ACC_06 - Thêm tài khoản khi email không đúng định dạng
    [Documentation]    Kiểm tra thêm tài khoản khi email không đúng định dạng
    [Tags]    negative
    Open Account Management
    Click Add Account Button
    Add Account    user4   user4#warehouse.vn   password123   password123
    Wait Until Page Contains    Email không hợp lệ  timeout=10s
ACC_07 - Xem chi tiết tài khoản
    [Documentation]    Kiểm tra xem chi tiết tài khoản
    [Tags]    positive
    Open Account Management
    View Account Details
ACC_08 - Hiển thị số lượng bản ghi mặc định trên mỗi trang
    [Documentation]    Kiểm tra hiển thị số lượng bản ghi mặc định trên mỗi trang
    [Tags]    positive
    Open Account Management
    Show entities per page    5
ACC_09 - Hiển thị số lượng bản ghi trên mỗi trang
    [Documentation]    Kiểm tra hiển thị số lượng bản ghi trên mỗi trang
    [Tags]    positive
    Open Account Management
    Show entities per page    10
ACC_10 - Điều hướng đến trang Dashboard
    [Documentation]    Kiểm tra điều hướng đến Trang quản trị
    [Tags]    positive
    Open Account Management
    Navigate to Dashboard
    
ACC_11 - Chỉnh sửa tài khoản
    [Documentation]    Kiểm tra chức năng chỉnh sửa tài khoản
    [Tags]    positive
    Open Account Management
    Click Edit Icon
    Capture Page Screenshot
ACC_12 - Xóa trường bắt buộc Email khi sửa tài khoản
    [Documentation]    Kiểm tra xóa trường bắt buộc Email khi sửa tài khoản
    [Tags]    negative
    Open Account Management
    Click Edit Icon
    Clear Required Field Email
    Wait Until Page Contains    Email là bắt buộc    timeout=10s
    Scroll Element Into View    ${update_button}
    Capture Page Screenshot
ACC_13 - Cập nhật tài khoản thành công
    [Documentation]    Kiểm tra cập nhật tài khoản thành công
    [Tags]    positive
    Open Account Management
    Click Edit Icon
    Update Successfully    user4
ACC_14 - Hủy bỏ chỉnh sửa
    [Documentation]    Kiểm tra hủy bỏ chỉnh sửa
    [Tags]    negative
    Open Account Management
    Click Edit Icon
    Cancel Edit
    Capture Page Screenshot
ACC_15 - Xem phân quyền tài khoản
    [Documentation]    Kiểm tra xem phân quyền tài khoản
    [Tags]    positive
    Open Account Management
    Click Edit Icon
    View Permissions
ACC_16 - Nhấn nút "Chỉnh sửa" trong giao diện phân quyền
    [Documentation]    Kiểm tra nhấn nút "Chỉnh sửa" trong giao diện phân quyền
    [Tags]    positive
    Open Account Management
    Click Edit Icon
    View Permissions
    Click Edit Button in Permission Interface
ACC_17 - Nhấn nút "Đổi mật khẩu" trong giao diện phân quyền
    [Documentation]    Kiểm tra nhấn nút "Đổi mật khẩu" trong giao diện phân quyền
    [Tags]    positive
    Open Account Management
    Click Key Icon (Change Password)
    Capture Page Screenshot
ACC_18 - Thay đổi mật khẩu thành công
    [Documentation]    Kiểm tra thay đổi mật khẩu thành công
    [Tags]    positive
    Open Account Management
    Click Key Icon (Change Password)
    Change Password    newpassword123   newpassword123
    Wait Until Page Contains    Mật khẩu của người dùng ${acc_to_change} đã được cập nhật   timeout=15s
ACC_19 - Bỏ trống các trường khi thay đổi mật khẩu
    [Documentation]    Kiểm tra bỏ trống các trường khi thay đổi mật khẩu
    [Tags]    negative
    Open Account Management
    Click Key Icon (Change Password)
    Change Password    ${EMPTY}   ${EMPTY}
    Wait Until Page Contains    Trường này là bắt buộc.    timeout=15s
ACC_20 - Thay đổi mật khẩu không khớp
    [Documentation]    Kiểm tra thay đổi mật khẩu không khớp
    [Tags]    negative
    Open Account Management
    Click Key Icon (Change Password)
    Change Password    newpassword123   differentpassword
    Wait Until Page Contains    Mật khẩu xác nhận không khớp  timeout=15s
    Capture Page Screenshot
ACC_21 - Mật khẩu quá ngắn
    [Documentation]    Kiểm tra mật khẩu quá ngắn
    [Tags]    negative
    Open Account Management
    Click Key Icon (Change Password)
    Check Password Length Error Message    abc    abc
ACC_22 - Nhấn hủy đổi mật khẩu
    [Documentation]    Kiểm tra mật khẩu quá ngắn
    [Tags]    negative
    Open Account Management
    Click Key Icon (Change Password)
    Click Cancel Password Change


SL_001 - Mở trang Nhật ký hệ thống
    [Documentation]    Kiểm tra truy cập trang Nhật ký hệ thống
    [Tags]    positive
    Open System Logs
SL_002 - Kiểm tra Lọc log Lỗi (ERROR)
    [Documentation]    Chỉ hiển thị log cấp độ ERROR và màu đỏ
    [Tags]    positive
    Open System Logs
    Select Log Type    Lỗi (ERROR)
    Click Filter Button
    Wait Until Page Contains    ERROR
    Check Log Type Color    ERROR    red
SL_003 - Kiểm tra Lọc log Cảnh báo (WARNING)
    [Documentation]    Chỉ hiển thị log cấp độ WARNING và màu cam
    [Tags]    positive
    Open System Logs
    Select Log Type    Cảnh báo (WARNING)
    Click Filter Button
    Wait Until Page Contains    WARNING
    Check Log Type Color    WARNING    orange
SL_004 - Kiểm tra Lọc log Thông tin (INFO)
    [Documentation]    Chỉ hiển thị log cấp độ INFO và màu xanh lá
    [Tags]    positive
    Open System Logs
    Select Log Type    Thông tin (INFO)
    Click Filter Button
    Wait Until Page Contains    INFO
    Check Log Type Color    INFO    green
SL_005 - Kiểm tra Lọc log Debug
    [Documentation]    Chỉ hiển thị log cấp độ DEBUG và màu tím
    [Tags]    positive
    Open System Logs
    Select Log Type    Debug
    Click Filter Button
    Wait Until Page Contains    DEBUG
    Check Log Type Color    DEBUG    purple
SL_006 - Kiểm tra thay đổi số lượng log hiển thị
    [Documentation]    Chọn hiển thị 10 dòng log
    Open System Logs
    Select Log Rows Per Page  10
    Click Filter Button
    Wait Until Page Contains Element    xpath=//table/tbody/tr[10]     timeout=20s
    ${count}=    Get Element Count    xpath=//table/tbody/tr
    Should Be Equal As Integers    ${count}    10

SL_007 - Kiểm tra phân trang
    [Documentation]    Chọn trang 2 và kiểm tra log hiển thị đúng
    Open System Logs
    Click Pagination Page    2
    Wait Until Page Contains    Hiển thị 21 - 40 trong tổng số
    # Thêm kiểm tra nội dung bảng nếu cần

SL_008 - Kiểm tra nút "Quay lại trang quản trị"
    [Documentation]    Bấm nút quay lại trang quản trị
    Open System Logs
    Click Button    xpath=//button[contains(text(),'Quay lại trang quản trị')]
    Wait Until Page Contains    Trang quản trị hệ thống

SL_009 - Kiểm tra nút "Làm mới" dữ liệu log
    [Documentation]    Bấm nút làm mới để tải lại log trang đầu
    Open System Logs
    Click Button    xpath=//button[contains(text(),'Làm mới')]
    Wait Until Page Contains    Hiển thị 1 - 20 trong tổng số