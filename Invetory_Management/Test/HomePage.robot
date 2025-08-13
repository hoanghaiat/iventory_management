*** Settings ***
Library    SeleniumLibrary
Resource    ../Resource/HomePage.resource
Test Setup    Login To System
Test Teardown    Close Browser
*** Variables ***

*** Test Cases ***
TC010 - Kiểm tra thao tác nhanh “Thêm đơn vị mới”
    [Documentation]    TC010
    [Tags]    TuAnh    HomePage
    Quick Add New Units       

TC011 - Kiểm tra thao tác nhanh "Thêm phông lưu trữ"
    [Documentation]    TC011
    [Tags]    TuAnh    HomePage
    Quick Add Storage Room

TC012 - Kiểm tra thao tác nhanh "Thêm mục lục hồ sơ"
    [Documentation]    TC012
    [Tags]    TuAnh    HomePage
    Quick Add Profile Table of Contents

TC013 - Kiểm tra thao tác nhanh "Thêm kho mới"
    [Documentation]    TC013
    [Tags]    TuAnh    HomePage
    Quick Add Warehouse

TC014 - Kiểm tra thao tác nhanh "Thêm giá kệ"
    [Documentation]    TC014
    [Tags]    TuAnh    HomePage
    Quick Add shelf

TC015 - Kiểm tra thao tác nhanh "Thêm hộp mới"
    [Documentation]    TC015
    [Tags]    TuAnh    HomePage
    Quick Add Box

TC016 - Kiểm tra thao tác nhanh “Tìm kiếm tài liệu”
    [Documentation]    TC016
    [Tags]    TuAnh    HomePage
    Quick Add Document Search

TC017 - Kiểm tra thao tác nhanh "Xem báo cáo"
    [Documentation]    TC017
    [Tags]    TuAnh    HomePage
    Quick Add See report

TC018 - Kiểm tra nút “Đăng xuất” 
    [Documentation]    TC018
    [Tags]    TuAnh    HomePage
    Logout     

TC020 - Kiểm tra click icon mũi tên ở "Quản lý kho"
    [Documentation]    TC020
    [Tags]    TuAnh    HomePage
    Close menu

TC021 - Kiểm tra click vào "Quản lý tổ chức"
    [Documentation]    TC021
    [Tags]    TuAnh    HomePage
    Close QLToChuc

TC022 - Kiểm tra click vào “Đơn vị”
    [Documentation]    TC022
    [Tags]    TuAnh    HomePage
    Click Unit

TC023 - Kiểm tra click vào “Phông lưu trữ”
    [Documentation]    TC023
    [Tags]    TuAnh    HomePage
    Click Storage Room

TC024 - Kiểm tra click “Mục lục hồ sơ”
    [Documentation]    TC024
    [Tags]    TuAnh    HomePage
    Click Profile Table of Contents

TC025 - Kiểm tra click vào "Quản lý kho"
    [Documentation]    TC025
    [Tags]    TuAnh    HomePage
    Close QLKho2

TC026 - Kiểm tra click “Kho lưu trữ”
    [Documentation]    TC026
    [Tags]    TuAnh    HomePage
    Click Warehouse

TC027 - Kiểm tra click “Giá kệ”
    [Documentation]    TC027
    [Tags]    TuAnh    HomePage
    Click shelf

TC028 - Kiểm tra click “Hộp lưu trữ”
    [Documentation]    TC028
    [Tags]    TuAnh    HomePage
    Click Box

TC029 - Kiểm tra click vào "Tìm kiếm & Báo cáo"
    [Documentation]    TC029
    [Tags]    TuAnh    HomePage
    Close Search_Report

TC030 - Kiểm tra click “Tìm kiếm”
    [Documentation]    TC030
    [Tags]    TuAnh    HomePage
    Click Search

TC032 - Kiểm tra click vào "Quản trị hệ thống"
    [Documentation]    TC032
    [Tags]    TuAnh    HomePage
    Close QTHeThong

TC033 - Kiểm tra click “Trang quản trị”
    [Documentation]    TC033
    [Tags]    TuAnh    HomePage
    Click Admin Page

TC034 - Kiểm tra click “Quản lý tài khoản”
    [Documentation]    TC034
    [Tags]    TuAnh    HomePage
    Click Account Management

TC035 - Kiểm tra click “Nhật ký hệ thống”
    [Documentation]    TC035
    [Tags]    TuAnh    HomePage
    Click System Log

TC036 - Kiểm tra click vào "Cài đặt cá nhân"
    [Documentation]    TC036
    [Tags]    TuAnh    HomePage
    Close CaNhan

TC037 - Kiểm tra click “Giao diện”
    [Documentation]    TC037
    [Tags]    TuAnh    HomePage
    Click Interface

TC038 - Kiểm tra click “Đăng xuất”
    [Documentation]    TC038
    [Tags]    TuAnh    HomePage
    Click Logout menu