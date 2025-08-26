*** Settings ***
Library    SeleniumLibrary
Resource    ../Resource/DangNhap.resource
Resource    ../Resource/TrangChu.resource
Test Setup    Login To System Success
*** Test Cases ***
#TC-DB-01: Các thành phần trong trang chủ
Tạo chương trình mới
    [Documentation]    TC-DB-01
    [Tags]    Phương Ly     Thao tác nhanh
    Wait And Click Quick Operation
    Verify Quick Operation Success
