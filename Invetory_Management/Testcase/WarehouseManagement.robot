*** Settings ***
Library    SeleniumLibrary
Resource    ../Resource/WarehouseManagement.resource
Resource    ../Resource/Login.resource
Test Setup    Login To System
Task Teardown    Close Browser

*** Test Cases ***
# Warehouse Storage
WH_001 - Thêm kho mới thành công
    [Documentation]    WH_001
    [Tags]    Thu Uyên    Kho lưu trữ
    Navigate to Warehouse Storage
    Click Add Storage Button
    Add Storage     KHO_D    Kho D - Lưu trữ phụ      Tầng 4, Tòa nhà chính      200      950
    Click Save Button
    Wait Until Page Contains    Thêm kho thành công!
WH_002 - Thêm mới kho lưu trữ khi bỏ trống Mã kho
    [Documentation]    WH_002
    [Tags]    Thu Uyên    Kho lưu trữ
    Navigate to Warehouse Storage
    Click Add Storage Button
    Add Storage    ${EMPTY}    Kho E - Lưu trữ phụ    Tầng 4, Tòa nhà chính    200    950
    Click Save Button
    Verify Field Is Focused    ${storage_code_input}
WH_003 - Kiểm tra trường diện tích không chấp nhận giá trị âm 
    [Documentation]    WH_003
    [Tags]    Thu Uyên    Kho lưu trữ
    Navigate to Warehouse Storage
    Click Add Storage Button
    Add Storage    KHO_E    Kho E - Lưu trữ phụ    Tầng 4, Tòa nhà chính    -200    950
    Click Save Button
    Wait Until Page Contains    Diện tích phải >= 0
WH_004 - Kiểm tra nút “Hủy bỏ” hoạt động đúng
    [Documentation]    WH_004
    [Tags]    Thu Uyên    Kho lưu trữ
    Navigate to Warehouse Storage
    Click Add Storage Button
    Add Storage    KHO_F    Kho F - Lưu trữ phụ    Tầng 4, Tòa nhà chính    200    950
    Click Cancel Button
              
WH_005 - Kiểm tra điều hướng khi click nút “Quay lại”
    [Documentation]    WH_005
    [Tags]    Thu Uyên    Kho lưu trữ
    Navigate to Warehouse Storage
    Click Add Storage Button
    Add Storage    KHO_G    Kho G - Lưu trữ phụ    Tầng 4, Tòa nhà chính    200    950
    Click Back Button
WH_006 - Kiểm tra hiển thị thông tin kho cần chỉnh sửa
    [Documentation]    WH_006
    [Tags]    Thu Uyên    Kho lưu trữ
    Navigate to Warehouse Storage
    Click Edit Icon
WH_007 - Kiểm tra cập nhật tên kho
    [Documentation]    WH_007
    [Tags]    Thu Uyên    Kho lưu trữ
    Navigate to Warehouse Storage
    Click Edit Icon
    Update Storage Name    Kho D - Chi nhánh
    Wait Until Page Contains    Cập nhật kho thành công!
WH_008 - Kiểm tra cập nhật kho khi để trống trường tên kho  
    [Documentation]    WH_008
    [Tags]    Thu Uyên    Kho lưu trữ
    Navigate to Warehouse Storage
    Click Edit Icon
    Update Storage Name    ${EMPTY}
    Verify Field Is Focused    ${storage_name_input}
WH_009 - Kiểm tra cập nhật kho khi nhập sai định dạng
    [Documentation]    WH_009
    [Tags]    Thu Uyên    Kho lưu trữ
    Navigate to Warehouse Storage
    Click Edit Icon
    Update Storage Area    abc
    Wait Until Page Contains    Not a valid float value.    10s
    Wait Until Page Contains    Diện tích phải >= 0    10s
WH_010 - Kiểm tra điều hướng khi click nút “Quay lại”
    [Documentation]    WH_010
    [Tags]    Thu Uyên    Kho lưu trữ
    Navigate to Warehouse Storage
    Click Edit Icon
    Update Storage Capacity    800 hộp tài liệu
    Cancel Update
WH_011 - Kiểm tra xóa kho
    [Documentation]    WH_011
    [Tags]    Thu Uyên    Kho lưu trữ
    Navigate to Warehouse Storage
    Delete Storage
    Wait Until Page Contains    Xóa kho thành công!
    Capture Page Screenshot
WH_012 - Kiểm tra xuất excel
    [Documentation]    WH_012
    [Tags]    Thu Uyên    Kho lưu trữ
    Navigate to Warehouse Storage
    Export Excel - Warehouse Storage Report

#Rack Management
RK_001 - Mở trang Quản lý Giá kệ
    [Documentation]    RK_001
    [Tags]    Thu Uyên    Giá kệ
    Open Rack Management
    Click Add Rack Button
RK_002 - Thêm giá kệ thành công
    [Documentation]    RK_002
    [Tags]    Thu Uyên    Giá kệ
    Open Rack Management
    Click Add Rack Button
    Add Rack    KHO_D_G02    Giá 2 - Kho D - Chi nhánh   Kho D - Chi nhánh    4 tầng    7m x 4m x 4m
    Click Save Rack Button
    Wait Until Page Contains    text=Thêm giá thành công!    timeout=15s
RK_003 - Thêm giá kệ với mã giá trùng
    [Documentation]    RK_003
    [Tags]    Thu Uyên    Giá kệ
    Open Rack Management
    Click Add Rack Button
    Add Rack    KHO_D_G01    Giá 2 - Kho D - Chi nhánh    Kho D - Chi nhánh     2 tầng    4m x 1.5m x 1.5m
    Click Save Rack Button
    Wait Until Page Contains    Mã giá đã tồn tại!
RK_004 - Thêm giá kệ với trường Mã giá để trống
    [Documentation]    RK_004
    [Tags]    Thu Uyên    Giá kệ
    Open Rack Management
    Click Add Rack Button
    Add Rack    ${EMPTY}    Giá 2 - Kho D - Chi nhánh    Kho D - Chi nhánh    4 tầng    7m x 4m x 4m
    Click Save Rack Button
    Verify Field Is Focused    ${rack_code_input}
RK_005 - Thêm giá kệ với trường Kho để trống
    [Documentation]    RK_005
    [Tags]    Thu Uyên    Giá kệ
    Open Rack Management
    Click Add Rack Button
    Add Rack    KHO_D_G03    Giá 3 - Kho D - Chi nhánh    ${EMPTY}    3 tầng    5m x 2m x 2m
    Click Save Rack Button
    Wait Until Page Contains    Vui lòng chọn kho
RK_006 - Kiểm tra nút “Hủy bỏ” khi thêm mới
    [Documentation]    RK_006
    [Tags]    Thu Uyên    Giá kệ
    Open Rack Management
    Click Add Rack Button
    Add Rack    KHO_D_G04    Giá 4 - Kho D - Chi nhánh    Kho D - Chi nhánh    5 tầng    8m x 5m x 5m
    Click Cancel Rack Button
    Wait Until Page Contains    Danh sách giá kệ
RK_007 - Kiểm tra điều hướng khi click nút “Quay lại”
    [Documentation]    RK_007
    [Tags]    Thu Uyên    Giá kệ
    Open Rack Management
    Click Add Rack Button
    Add Rack    KHO_D_G04    Giá 4 - Kho D - Chi nhánh    Kho D - Chi nhánh    5 tầng    8m x 5m x 5m
    Click Back Rack Button
RK_008 - Kiểm tra xóa giá kệ
    [Documentation]    RK_008
    [Tags]    Thu Uyên    Giá kệ
    Open Rack Management
    Delete Rack
    Wait Until Page Contains    Xóa giá thành công!
RK_009 - Kiểm tra xuất excel
    [Documentation]    RK_009
    [Tags]    Thu Uyên    Giá kệ
    Open Rack Management
    Export Excel - Rack Report
RK_010 - Kiểm tra hiển thị thông tin giá kệ cần chỉnh sửa
    [Documentation]    RK_010
    [Tags]    Thu Uyên    Giá kệ
    Open Rack Management
    Click Edit Rack Icon
RK_011 - Kiểm tra cập nhật giá kệ thành công
    [Documentation]    RK_011
    [Tags]    Thu Uyên    Giá kệ
    Open Rack Management
    Click Edit Rack Icon
    Update Rack Name   Giá 2 - Kho D - Chi nhánh - Cập nhật
    Click Update Rack Button
    Wait Until Page Contains    Cập nhật giá thành công!
RK_012 - Kiểm tra cập nhật giá kệ với trường Tên giá để trống
    [Documentation]    RK_012
    [Tags]    Thu Uyên    Giá kệ
    Open Rack Management
    Click Edit Rack Icon
    Update Rack Name   ${EMPTY}
    Click Update Rack Button
    Verify Field Is Focused    ${rack_name_input}
RK_013 - Kiểm tra cập nhật khi nhập sai định dạng số tầng
    [Documentation]    RK_013
    [Tags]    Thu Uyên    Giá kệ
    Open Rack Management
    Click Edit Rack Icon
    Update Rack Floor   abc
    Click Update Rack Button
RK_014 - Kiểm tra điều hướng khi click nút Quay lại
    [Documentation]    RK_014
    [Tags]    Thu Uyên    Giá kệ
    Open Rack Management
    Click Edit Rack Icon
    Update Rack Name   Giá 2 - Kho D - Chi nhánh - Cập nhật
    Click Back Rack Button - Update
RK_015 - Kiểm tra liên kết “Xem hộp trong giá” khi giá có 0 hộp
    [Documentation]    Kiểm tra khi rack không có hộp nào
    [Tags]    Thu Uyên    Giá kệ
    Open Rack Management
    Click Edit Rack Icon - 1    10    
    View Boxes In Rack - 1  10    0

RK_016 - Kiểm tra lọc danh sách hộp theo giá kệ có chứa hộp
    [Documentation]    Kiểm tra khi rack có 3 hộp
    [Tags]    Thu Uyên    Giá kệ
    Open Rack Management
    Click Edit Rack Icon - 1    1    
    View Boxes In Rack - 1   1    3

RK_017 - Kiểm tra liên kết "Xem kho chứa"
    [Documentation]    RK_017
    [Tags]    Thu Uyên    Giá kệ
    Open Rack Management
    Click Edit Rack Icon
    View Containing Warehouse
    Wait Until Page Contains    Sửa thông tin kho

#Storage Box
BX_001 - Mở trang Quản lý Hộp lưu trữ
    [Documentation]    BX_001
    [Tags]    Thu Uyên    Hộp lưu trữ
    Open Storage Box Management
BX_002 - Thêm hộp lưu trữ với mã hộp trùng
    [Documentation]    BX_002
    [Tags]    Thu Uyên    Hộp lưu trữ
    Open Storage Box Management
    Click Add Box Button
    Add Box    BOX0018    Hộp 18 - Hợp đồng mua bán - 3    Kho A - Tài liệu chính - Giá 1 - Kho A - Tài liệu chính
    Click Box Save Button
    Wait Until Page Contains    Mã hộp đã tồn tại!
BX_003 - Thêm hộp lưu trữ thành công
    [Documentation]    BX_003
    [Tags]    Thu Uyên    Hộp lưu trữ
    Open Storage Box Management
    Click Add Box Button
    Add Box    BX0031    Hộp 18 - Hợp đồng mua bán - 3    Kho A - Tài liệu chính - Giá 1 - Kho A - Tài liệu chính
    Click Box Save Button
    Wait Until Page Contains    Thêm hộp thành công!
BX_004 - Thêm hộp lưu trữ với trường Mã hộp để trống
    [Documentation]    BX_004
    [Tags]    Thu Uyên    Hộp lưu trữ
    Open Storage Box Management
    Click Add Box Button
    Add Box    ${EMPTY}    Hộp 18 - Hợp đồng mua bán - 3    Kho A - Tài liệu chính - Giá 1 - Kho A - Tài liệu chính
    Click Box Save Button
    Verify Field Is Focused    ${box_code_input}
BX_005 - Thêm hộp lưu trữ với trường Giá để trống
    [Documentation]    BX_005
    [Tags]    Thu Uyên    Hộp lưu trữ
    Open Storage Box Management
    Click Add Box Button
    Add Box    BX0032    Hộp 18 - Hợp đồng mua bán - 3     ${EMPTY} 
    Click Box Save Button
    Wait Until Page Contains    Vui lòng chọn giá
BX_006 - Kiểm tra nút “Hủy bỏ” khi thêm mới
    [Documentation]    BX_006
    [Tags]    Thu Uyên    Hộp lưu trữ
    Open Storage Box Management
    Click Add Box Button
    Add Box    BX0032    Hộp 32 - Hợp đồng mua bán - 3    Kho A - Tài liệu chính - Giá 1 - Kho A - Tài liệu chính
    Click Box Cancel Button
BX_007 - Kiểm tra điều hướng khi click nút “Quay lại” khi thêm mới
    [Documentation]    BX_007
    [Tags]    Thu Uyên    Hộp lưu trữ
    Open Storage Box Management
    Click Add Box Button
    Add Box    BX0032    Hộp 32 - Hợp đồng mua bán - 3    Kho A - Tài liệu chính - Giá 1 - Kho A - Tài liệu chính
    Click Back Box Button
BX_008 - Kiểm tra xóa hộp lưu trữ
    [Documentation]    BX_008
    [Tags]    Thu Uyên    Hộp lưu trữ
    Open Storage Box Management
    Delete Box    32
    Wait Until Page Contains    Xóa hộp thành công!
BX_009 - Kiểm tra xuất excel Báo cáo Hộp lưu trữ
    [Documentation]    BX_009
    [Tags]    Thu Uyên    Hộp lưu trữ
    Open Storage Box Management
    Export Excel - Box Report
    Capture Page Screenshot
BX_010 - Kiểm tra cập nhật hộp lưu trữ thành công
    [Documentation]    BX_010
    [Tags]    Thu Uyên    Hộp lưu trữ
    Open Storage Box Management
    Click Edit Box Icon    32
    Update Box Name    Hộp 31 - Hợp đồng mua bán - 1
    Wait Until Page Contains    Cập nhật hộp thành công!
BX_011 - Kiểm tra nút "Hủy bỏ"
    [Documentation]    BX_011
    [Tags]    Thu Uyên    Hộp lưu trữ
    Open Storage Box Management
    Click Edit Box Icon    32
    Click Box Cancel Update Button
BX_012 - Kiểm tra cập nhật hộp lưu trữ với trường Tên hộp để trống
    [Documentation]    BX_012
    [Tags]    Thu Uyên    Hộp lưu trữ
    Open Storage Box Management
    Click Edit Box Icon    32
    Update Box Name    ${EMPTY}
    Verify Field Is Focused    ${box_name_input}
BX_013 - Kiểm tra cập nhật hộp lưu trữ với trường Giá để trống
    [Documentation]    BX_013
    [Tags]    Thu Uyên    Hộp lưu trữ
    Open Storage Box Management
    Click Edit Box Icon    32
    Update Empty Box Rack
    Wait Until Page Contains    Vui lòng chọn giá
BX_014 - Kiểm tra Quay lại khi đang cập nhật
    [Documentation]    BX_014
    [Tags]    Thu Uyên    Hộp lưu trữ
    Open Storage Box Management
    Click Edit Box Icon    32
    Scroll Element Into View    locator=${back_update_box_btn}
    Click Element    ${back_update_box_btn}
    Wait Until Page Contains    Quản lý Hộp lưu trữ
BX_015 - Kiểm tra hiển thị phần “Thao tác liên quan” với hộp lưu trữ chưa gán mục lục
    [Documentation]    BX_015 - Hộp chưa gán mục lục chỉ hiển thị 2 thao tác: Xem giá chứa, Xem kho chứa.
    [Tags]    Thu Uyên    Hộp lưu trữ
    Open Storage Box Management
    Click Edit Box Icon   32
    Scroll Element Into View    ${update_box_button}
    Wait Until Page Contains    text=Xem giá chứa
    Wait Until Page Contains    text=Xem kho chứa
    Wait Until Page Does Not Contain    text=Xem mục lục
BX_016 - Kiểm tra hiển thị phần “Thao tác liên quan” với hộp lưu trữ đã gán mục lục
    [Documentation]    BX_016 - Hộp đã gán mục lục hiển thị đủ 3 thao tác: Xem giá chứa, Xem kho chứa, Xem mục lục.
    [Tags]    Thu Uyên    Hộp lưu trữ
    Open Storage Box Management
    Click Edit Box Icon     18
    Scroll Element Into View    ${update_box_button}
    Wait Until Page Contains    text=Xem giá chứa
    Wait Until Page Contains    text=Xem kho chứa
    Wait Until Page Contains    text=Xem mục lục
BX_017 - Kiểm tra điều hướng từ “Xem giá chứa”
    [Documentation]    BX_017
    [Tags]    Thu Uyên    Hộp lưu trữ
    Open Storage Box Management
    Click Edit Box Icon     18
    Click Related Action    Xem giá chứa
    Page Should Contain    Chỉnh sửa Giá kệ
BX_018 - Kiểm tra điều hướng từ “Xem kho chứa”
    [Documentation]    BX_018
    [Tags]    Thu Uyên    Hộp lưu trữ
    Open Storage Box Management
    Click Edit Box Icon     18
    Click Related Action    Xem kho chứa
    Page Should Contain     Sửa thông tin kho
BX_019 - Kiểm tra điều hướng từ “Xem mục lục”
    [Documentation]    BX_019
    [Tags]    Thu Uyên    Hộp lưu trữ
    Open Storage Box Management
    Click Edit Box Icon     18
    Click Related Action    Xem mục lục
    Page Should Contain     Chỉnh sửa mục lục hồ sơ
