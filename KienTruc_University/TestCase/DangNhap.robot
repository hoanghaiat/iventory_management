*** Settings ***
Library    SeleniumLibrary
Variables    ../locator.py
Resource    ../Resource/DangNhap.resource
*** Variables ***

*** Test Cases ***
TC-LG-01: Đăng nhập hợp lệ
    Open Applications      
    Enter Credential    truongkhoa1   demotruongkhoa
    Click Login Button
    Verify Login Successful
    
TC-LG-02: Đăng nhập sai mật khẩu
    Open Applications      
    Enter Credential    truongkhoa1   demotruongkhoa1
    Click Login Button
    Verify Login Error

TC-LG-03: Đăng nhập sai tên đăng nhập
    Open Applications      
    Enter Credential    truongphong   demotruongkhoa1
    Click Login Button
    Verify Login Error
TC-LG-04:Đăng nhập tài khoản không tồn tại
    Open Applications      
    Enter Credential    truongkhoa1   demotruongkhoa1
    Click Login Button
    Verify Login Error

TC-LG-05:: Bỏ trống tên đăng nhập
    Open Applications      
    Enter Password    demotruongkhoa
    Click Login Button
    Verify Login Failed Due To Blank Password or User Name
    
TC-LG-06: Bỏ trống mật khẩu
    Open Applications
    Enter Username    truongkhoa1
    Click Login Button
    Verify Login Failed Due To Blank Password or User Name
TC-LG-07: Bỏ trống tên đăng nhập và mật khẩu
    Open Applications
    Click Login Button
    Verify Login Failed Due To Blank Password or User Name