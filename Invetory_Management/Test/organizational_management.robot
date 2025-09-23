*** Settings ***
Library    SeleniumLibrary
Resource    ../resource/home_page.resource
Resource    ../resource/organizational_management.resource
Variables    ../variables/locator.py
Test Setup    Login To System
Test Teardown    Close Browser

*** Test Cases ***
#Unit
TC058 - Kiểm tra chọn số lượng hiển thị bản ghi
    [Documentation]    TC058
    [Tags]    TuAnh    OrganizationalManagement
    Click Unit
    Hien thi so ban ghi    5

TC059 - Kiểm tra huỷ bỏ khi thêm đơn vị mới
    [Documentation]    TC059
    [Tags]    TuAnh    OrganizationalManagement
    Click Unit
    Click Add Unit Form
    Fill Unit Form    1    Ban kiểm soát
    Click Cancel Unit

TC060 - Kiểm tra click quay lại khi thêm đơn vị mới
    [Documentation]    TC060
    [Tags]    TuAnh    OrganizationalManagement
    Click Unit
    Click Add Unit Form
    Fill Unit Form    1    Ban kiểm soát
    Click Back To List

TC061 - Kiểm tra thêm đơn vị mới
    [Documentation]    TC061
    [Tags]    TuAnh    OrganizationalManagement
    Click Unit
    Click Add Unit Form
    Fill Unit Form    3    Ban kiểm soát
    Click Save Unit
    Verify Success Alert    Thêm đơn vị thành công!

TC062 - Kiểm tra huỷ bỏ khi chỉnh sửa đơn vị
    [Documentation]    TC062
    [Tags]    TuAnh    OrganizationalManagement
    Click Unit
    Click Edit Unit
    Click Add Unit Form
    Edit Unit Form    Ban tổ chức
    Click Cancel Unit

TC063 - Kiểm tra nút quay lại khi chỉnh sửa đơn vị
    [Documentation]    TC063
    [Tags]    TuAnh    OrganizationalManagement
    Click Unit
    Click Edit Unit
    Click Add Unit Form
    Edit Unit Form    Ban tổ chức
    Click Back To List

TC064 - Kiểm tra chỉnh sửa đơn vị
    [Documentation]    TC064
    [Tags]    TuAnh    OrganizationalManagement
    Click Unit
    Click Edit Unit
    Click Add Unit Form
    Edit Unit Form    Ban tổ chức
    Click Update Unit
    Verify Success Alert    Cập nhật đơn vị thành công!

TC065 - Kiểm tra xoá đơn vị
    [Documentation]    TC065
    [Tags]    TuAnh    OrganizationalManagement
    Click Unit
    Click Delete Unit
    Verify Success Alert    Xoá đơn vị thành công!

#Phong
TC067 - Kiểm tra chọn số lượng hiển thị bản ghi
    [Documentation]    TC067
    [Tags]    TuAnh    OrganizationalManagement
    Click Phong
    Hien thi so ban ghi    5

TC068 - Kiểm tra huỷ bỏ khi thêm phông mới
    [Documentation]    TC068
    [Tags]    TuAnh    OrganizationalManagement
    Click Phong
    Click Add Phong Form
    Fill Phong Form    Ban kiểm soát chỉnh sửa
    Click Cancel Phong

TC069 - Kiểm tra click quay lại khi thêm phông mới
    [Documentation]    TC069
    [Tags]    TuAnh    OrganizationalManagement
    Click Phong
    Click Add Phong Form
    Fill Phong Form    Ban kiểm soát chỉnh sửa
    Click Back To Phong

TC070 - Kiểm tra thêm mới phông lưu trữ
    [Documentation]    TC070
    [Tags]    TuAnh    OrganizationalManagement
    Click Phong
    Click Add Phong Form
    Fill Phong Form    Ban kiểm soát chỉnh sửa
    Click Save Phong
    Verify Success Alert    Thêm phông lưu trữ thành công!

TC071 - Kiểm tra chỉnh sửa phông lưu trữ
    [Documentation]    TC071
    [Tags]    TuAnh    OrganizationalManagement
    Click Phong
    Click Edit Phong
    Edit Phong Form    Tài liệu
    Click Update Phong
    Verify Success Alert    Cập nhật phông lưu trữ thành công!

TC072 - Kiểm tra huỷ bỏ khi chỉnh sửa phòng lưu trữ
    [Documentation]    TC072
    [Tags]    TuAnh    OrganizationalManagement
    Click Phong
    Click Edit Phong
    Edit Phong Form    Tài liệu
    Click Update Phong
    Click Cancel Phong

TC073 - Kiểm tra nút quay lại khi chỉnh sửa phòng
    [Documentation]    TC073
    [Tags]    TuAnh    OrganizationalManagement
    Click Phong
    Click Edit Phong
    Edit Phong Form    Tài liệu
    Click Update Phong
    Click Back To Phong

TC074 - Kiểm tra xoá phông lưu trữ
    [Documentation]    TC074
    [Tags]    TuAnh    OrganizationalManagement
    Click Phong
    Click Delete Phong
    Verify Success Alert    Xoá phong lưu trữ thành công!

TC077 - Kiểm tra tìm kiếm phông lưu trữ lọc theo "Lọc theo đơn vị"
    [Documentation]    TC077
    [Tags]    TuAnh    OrganizationalManagement
    Click Phong
    Filter Phong    Chi nhánh TP.HCM

#index
TC078 - Kiểm tra huỷ bỏ khi thêm mục lục mới
    [Documentation]    TC078
    [Tags]    TuAnh    OrganizationalManagement
    Click Profile Table of Contents
    Click Add Index Form
    Fill Index Form    Chi nhánh TP.HCM    Phông Hồ sơ Nhân sự
    Click Cancel Index

TC079 - Kiểm tra click quay lại khi thêm mục lục mới
    [Documentation]    TC079
    [Tags]    TuAnh    OrganizationalManagement
    Click Profile Table of Contents
    Click Add Index Form
    Fill Index Form    Chi nhánh TP.HCM    Phông Hồ sơ Nhân sự
    Click Back To Index

TC080 - Kiểm tra thêm mục lục mới
    [Documentation]    TC080
    [Tags]    TuAnh    OrganizationalManagement
    Click Profile Table of Contents
    Click Add Index Form
    Fill Index Form    Chi nhánh TP.HCM    Phông Hồ sơ Nhân sự
    Click Save Index
    Verify Success Alert    Thêm mục lục hồ sơ thành công!

TC081 - Kiểm tra chỉnh sửa mục lục
    [Documentation]    TC081
    [Tags]    TuAnh    OrganizationalManagement
    Click Profile Table of Contents
    Click Edit Index
    Edit Index Form    Tài liệu demo1
    Verify Success Alert    Cập nhật mục lục hồ sơ thành công!

TC082 - Kiểm tra nút huỷ bỏ khi chỉnh sửa mục lục hồ sơ
    [Documentation]    TC082
    [Tags]    TuAnh    OrganizationalManagement
    Click Profile Table of Contents
    Click Edit Index
    Edit Index Form    Tài liệu demo1
    Click Cancel Index

TC083 - Kiểm tra nút quay lại khi chỉnh sửa mục lục hồ sơ
    [Documentation]    TC083
    [Tags]    TuAnh    OrganizationalManagement
    Click Profile Table of Contents
    Click Edit Index
    Edit Index Form    Tài liệu demo1
    Click Back To Index

TC084 - Kiểm tra xoá mục lục hồ sơ
    [Documentation]    TC084
    [Tags]    TuAnh    OrganizationalManagement
    Click Profile Table of Contents
    Click Delete Index
    Verify Success Alert    Xoá mục lục hồ sơ thành công!

TC086 - Kiểm tra tìm kiếm mục lục hồ sơ lọc theo "Đơn vị"
    [Documentation]    TC086
    [Tags]    TuAnh    OrganizationalManagement
    Click Profile Table of Contents
    Filter Phong_Donvi    Chi nhánh TP.HCM

TC087 - Kiểm tra tìm kiếm mục lục hồ sơ lọc theo "Đơn vị" và "Phông"
    [Documentation]    TC087
    [Tags]    TuAnh    OrganizationalManagement
    Click Profile Table of Contents
    Filter Phong_Donvi2    Chi nhánh TP.HCM    Phông Hồ sơ Nhân sự

TC088 - Thêm Đơn vị mới để trống Mã đơn vị
    [Documentation]    TC088
    [Tags]    TuAnh    OrganizationalManagement
    Click Unit
    Click Add Index Form
    Add Unit and Name Unit Blank
    Verify Invalid Feedback Unit    Tên đơn vị không được để trống

TC089 - Thêm Đơn vị mới bỏ tróng Mã đơn vị và Tên đơn vị
    [Documentation]    TC089
    [Tags]    TuAnh    OrganizationalManagement
    Click Unit
    Click Add Unit Form
    Click Save Unit
    Verify Invalid Feedback Unit    Mã đơn vị không được để trống
    Verify Invalid Feedback Unit    Tên đơn vị không được để trống

TC090 - Thêm Phông lưu trữ mới để trống Tên Phông
    [Documentation]    TC090
    [Tags]    TuAnh    OrganizationalManagement
    Click Phong
    Click Add Phong Form
    Add Phong but Name Phong Blank    Ban kiểm soát chỉnh sửa
    Click Save Phong
    Verify Field Is Focused    ${input_name_phong}

TC091 - Thêm Phông lưu trữ mới để trống Đơn vị
    [Documentation]    TC091
    [Tags]    TuAnh    OrganizationalManagement
    Click Phong
    Click Add Phong Form
    Add Phong but Unit Blank
    Click Save Phong
    Verify Invalid Feedback Phong    Vui lòng chọn đơn vị
    
TC092 - Thêm mục lục hồ sơ bỏ trống mã mục lục
    [Documentation]    TC092
    [Tags]    TuAnh    OrganizationalManagement
    Click Profile Table of Contents
    Click Add Index Form
    Click Save Index
    Verify Field Is Focused    ${input_id_index}

TC093 - Thêm mục lục hồ sơ mới bỏ trống đơn vị
    [Documentation]    TC093
    [Tags]    TuAnh    OrganizationalManagement
    Click Profile Table of Contents
    Click Add Index Form
    Add Mucluc Unit Blank
    Click Save Index
    Verify Field Is Focused    ${dropdown_donvi}

TC094 - Thêm mục mục hồ sơ mới bỏ trống tên mục lục
    [Documentation]    TC093
    [Tags]    TuAnh    OrganizationalManagement
    Click Profile Table of Contents
    Click Add Index Form
    Add Mucluc but Name MucLuc Blank    Chi nhánh TP.HCM    Phông Hồ sơ Nhân sự
    Click Save Index
    Verify Field Is Focused    ${input_name_index}