*** Settings ***
Library    SeleniumLibrary
Resource    resource.resource
Test Setup    Login To System
Test Teardown    Close Browser
*** Variables ***

*** Test Cases ***
TC010 - Kiểm tra thao tác nhanh “Thêm đơn vị mới”
    Quick Add New Units       

TC011 - Kiểm tra thao tác nhanh "Thêm phông lưu trữ"
    Quick Add Storage Room

TC012 - Kiểm tra thao tác nhanh "Thêm mục lục hồ sơ"
    Quick Add Profile Table of Contents

TC013 - Kiểm tra thao tác nhanh "Thêm kho mới"
    Quick Add Warehouse

TC014 - Kiểm tra thao tác nhanh "Thêm giá kệ"
    Quick Add shelf
TC015 - Kiểm tra thao tác nhanh "Thêm hộp mới"
    Quick Add Box

TC016 - Kiểm tra thao tác nhanh “Tìm kiếm tài liệu”
    Quick Add Document Search

TC017 - Kiểm tra thao tác nhanh "Xem báo cáo"
    Quick Add See report

TC018 - Kiểm tra nút “Đăng xuất” 
    Logout     

TC022 - Kiểm tra click vào “Đơn vị”
    Click Unit

TC023 - Kiểm tra click vào “Phông lưu trữ”
    Click Storage Room

TC024 - Kiểm tra click “Mục lục hồ sơ”
    Click Profile Table of Contents
TC026 - Kiểm tra click “Kho lưu trữ”
    Click Warehouse

TC027 - Kiểm tra click “Giá kệ”
    Click shelf

TC028 - Kiểm tra click “Hộp lưu trữ”
    Click Box

TC030 - Kiểm tra click “Tìm kiếm”
    Click Search