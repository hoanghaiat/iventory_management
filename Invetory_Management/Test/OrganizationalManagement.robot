*** Settings ***
Library    SeleniumLibrary
Resource    ../Resource/HomePage.resource
Resource    ../Resource/OrganizationalManagement.resource
Variables    ../Variables/locator.py
Test Setup    Login To System
Test Teardown    Close Browser

*** Test Cases ***
#Don vi
TC058 - Kiểm tra chọn số lượng hiển thị bản ghi
    [Documentation]    TC058
    [Tags]    TuAnh    OrganizationalManagement
    Click Unit
    Hien thi so ban ghi    5

TC059 - Kiểm tra huỷ bỏ khi thêm đơn vị mới
    [Documentation]    TC059
    [Tags]    TuAnh    OrganizationalManagement
    Click Unit
    Cancel Add Unit

TC060 - Kiểm tra click quay lại khi thêm đơn vị mới
    [Documentation]    TC060
    [Tags]    TuAnh    OrganizationalManagement
    Click Unit
    Back To List

TC061 - Kiểm tra thêm đơn vị mới
    [Documentation]    TC061
    [Tags]    TuAnh    OrganizationalManagement
    Click Unit
    Verify Add To Unit

TC062 - Kiểm tra huỷ bỏ khi chỉnh sửa đơn vị
    [Documentation]    TC062
    [Tags]    TuAnh    OrganizationalManagement
    Click Unit
    Edit Unit "Cancel"

TC063 - Kiểm tra nút quay lại khi chỉnh sửa đơn vị
    [Documentation]    TC063
    [Tags]    TuAnh    OrganizationalManagement
    Click Unit
    Edit Unit "Back to list"

TC064 - Kiểm tra chỉnh sửa đơn vị
    [Documentation]    TC064
    [Tags]    TuAnh    OrganizationalManagement
    Click Unit
    Edit Unit

TC065 - Kiểm tra xoá đơn vị
    [Documentation]    TC065
    [Tags]    TuAnh    OrganizationalManagement
    Click Unit
    Delete Unit

TC067 - Kiểm tra chọn số lượng hiển thị bản ghi
    [Documentation]    TC067
    [Tags]    TuAnh    OrganizationalManagement
    Click Storage Room
    Hien thi so ban ghi    5

#Phong don vi
TC068 - Kiểm tra huỷ bỏ khi thêm phông mới
    [Documentation]    TC068
    [Tags]    TuAnh    OrganizationalManagement
    Click Storage Room
    Cancel Add Phong

TC069 - Kiểm tra click quay lại khi thêm phông mới
    [Documentation]    TC069
    [Tags]    TuAnh    OrganizationalManagement
    Click Storage Room
    Back To Phong

TC070 - Kiểm tra thêm mới phông lưu trữ
    [Documentation]    TC070
    [Tags]    TuAnh    OrganizationalManagement
    Click Storage Room
    Verify Add To Phong    Ban kiểm soát chỉnh sửa

TC071 - Kiểm tra chỉnh sửa phông lưu trữ
    [Documentation]    TC071
    [Tags]    TuAnh    OrganizationalManagement
    Click Storage Room
    Edit Phong

TC072 - Kiểm tra huỷ bỏ khi chỉnh sửa phòng lưu trữ
    [Documentation]    TC072
    [Tags]    TuAnh    OrganizationalManagement
    Click Storage Room
    Edit Phong "Cancel"

TC073 - Kiểm tra nút quay lại khi chỉnh sửa phòng
    [Documentation]    TC073
    [Tags]    TuAnh    OrganizationalManagement
    Click Storage Room
    Edit Back To Phong

TC074 - Kiểm tra xoá phông lưu trữ
    [Documentation]    TC074
    [Tags]    TuAnh    OrganizationalManagement
    Click Storage Room
    Delete Phong

TC077 - Kiểm tra tìm kiếm phông lưu trữ lọc theo "Lọc theo đơn vị"
    [Documentation]    TC077
    [Tags]    TuAnh    OrganizationalManagement
    Click Storage Room
    Filter Phong    Chi nhánh TP.HCM

#Muc luc ho so
TC078 - Kiểm tra huỷ bỏ khi thêm mục lục mới
    [Documentation]    TC078
    [Tags]    TuAnh    OrganizationalManagement
    Click Profile Table of Contents
    Cancel Add Mucluc

TC079 - Kiểm tra click quay lại khi thêm mục lục mới
    [Documentation]    TC079
    [Tags]    TuAnh    OrganizationalManagement
    Click Profile Table of Contents
    Back To Mucluc

TC080 - Kiểm tra thêm mục lục mới
    [Documentation]    TC080
    [Tags]    TuAnh    OrganizationalManagement
    Click Profile Table of Contents
    Verify Add To Mucluc    Chi nhánh TP.HCM    Phông Hồ sơ Nhân sự

TC081 - Kiểm tra chỉnh sửa mục lục
    [Documentation]    TC081
    [Tags]    TuAnh    OrganizationalManagement
    Click Profile Table of Contents
    Edit Mucluc

TC082 - Kiểm tra nút quay lại khi chỉnh sửa mục lục hồ sơ
    [Documentation]    TC082
    [Tags]    TuAnh    OrganizationalManagement
    Click Profile Table of Contents
    Edit Mucluc "Cancel"

TC083 - Kiểm tra nút quay lại khi chỉnh sửa mục lục hồ sơ
    [Documentation]    TC083
    [Tags]    TuAnh    OrganizationalManagement
    Click Profile Table of Contents
    Edit Back To Mucluc

TC084 - Kiểm tra xoá mục lục hồ sơ
    [Documentation]    TC084
    [Tags]    TuAnh    OrganizationalManagement
    Click Profile Table of Contents
    Delete Mucluc

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
    Add Unit and Name Unit Blank

TC089 - Thêm Đơn vị mới bỏ tróng Mã đơn vị và Tên đơn vị
    [Documentation]    TC089
    [Tags]    TuAnh    OrganizationalManagement
    Click Unit
    Add Unit and ID_Name Unit Blank    

TC090 - Thêm Phông lưu trữ mới để trống Tên Phông
    [Documentation]    TC090
    [Tags]    TuAnh    OrganizationalManagement
    Click Storage Room
    Add Phong but Name Phong Blank    Ban kiểm soát chỉnh sửa
    Verify Field Is Focused    ${Input_Name_Phong}

TC091 - Thêm Phông lưu trữ mới để trống Đơn vịị
    [Documentation]    TC091
    [Tags]    TuAnh    OrganizationalManagement
    Click Storage Room
    Add Phong but Unit Blank    
    
TC092 - Thêm mục lục hồ sơ bỏ trống mã mục lục
    [Documentation]    TC092
    [Tags]    TuAnh    OrganizationalManagement
    Click Profile Table of Contents
    Add Mucluc Blank All
    Verify Field Is Focused    ${Input_ID_Mucluc}

TC093 - Thêm mục lục hồ sơ mới bỏ trống đơn vị
    [Documentation]    TC093
    [Tags]    TuAnh    OrganizationalManagement
    Click Profile Table of Contents
    Add Mucluc Unit Blank
    Verify Field Is Focused    ${Dropdown_DonVi}

TC094 - Thêm mục mục hồ sơ mới bỏ trống tên mục lục
    [Documentation]    TC093
    [Tags]    TuAnh    OrganizationalManagement
    Click Profile Table of Contents
    Add Mucluc but Name MucLuc Blank    Chi nhánh TP.HCM    Phông Hồ sơ Nhân sự
    Verify Field Is Focused    ${Input_Name_Mucluc}
