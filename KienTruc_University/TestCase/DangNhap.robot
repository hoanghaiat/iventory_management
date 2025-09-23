*** Settings ***
Library    SeleniumLibrary    run_on_failure=No Operation
Variables    ../locator.py
Resource    ../Resource/DangNhap.resource
Suite Setup    Open Applications
*** Variables ***

*** Test Cases ***
Đăng nhập hợp lệ
    [Documentation]    TC-LG-01
    [Tags]    Phương Ly     Đăng nhập thành công
    Enter Credential    truongkhoa1   demotruongkhoa
    Click Login Button
    Verify Login Successful
    
Đăng nhập sai mật khẩu
    [Documentation]    TC-LG-02
    [Tags]    Phương Ly     Đăng nhập thất bại
    Enter Credential    truongkhoa1   demotruongkhoa1
    Click Login Button
    Verify Login Error

Đăng nhập sai tên đăng nhập
    [Documentation]    TC-LG-03
    [Tags]    Phương Ly     Đăng nhập thất bại
    Enter Credential    truongphong   demotruongkhoa1
    Click Login Button
    Verify Login Error
Đăng nhập tài khoản không tồn tại
    [Documentation]    TC-LG-04
    [Tags]    Phương Ly     Đăng nhập thất bại
    Enter Credential    truongkhoa1   demotruongkhoa1
    Click Login Button
    Verify Login Error

Bỏ trống tên đăng nhập
    [Documentation]    TC-LG-05
    [Tags]    Phương Ly     Đăng nhập thất bại
    Enter Password    demotruongkhoa
    Click Login Button
    Verify Login Failed Due To Blank Password or User Name
    
Bỏ trống mật khẩu
    [Documentation]    TC-LG-06
    [Tags]    Phương Ly     Đăng nhập thất bại
    Enter Username    truongkhoa1
    Click Login Button
    Verify Login Failed Due To Blank Password or User Name
Bỏ trống tên đăng nhập và mật khẩu
    [Documentation]    TC-LG-07
    [Tags]    Phương Ly     Đăng nhập thất bại
    Click Login Button
    Verify Login Failed Due To Blank Password or User Name