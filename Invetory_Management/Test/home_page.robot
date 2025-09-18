*** Settings ***
Library    SeleniumLibrary
Library    String
Resource    ../resource/home_page.resource
Test Setup    Login To System
Test Teardown    Close Browser
*** Variables ***


*** Test Cases ***
TC002 - Kiểm tra hiển thị đúng số lượng "Đơn vị"
    [Documentation]    TC002
    [Tags]    TuAnh    HomePage
    Get And Compare Count    Đơn vị    ${item_unit}    Tổng số đơn vị

TC003 - Kiểm tra hiển thị đúng số lượng "Phông lưu trữ"
    [Documentation]    TC003
    [Tags]    TuAnh    HomePage
    Get And Compare Count    Phông lưu trữ    ${item_phong}    xpath=//table//tbody//tr

TC004 - Kiểm tra hiển thị đúng "Mục lục hồ sơ"
    [Documentation]    TC004
    [Tags]    TuAnh    HomePage
    Get And Compare Count    Mục lục hồ sơ    ${item_index}    Tổng mục lục

TC005 - Kiểm tra hiển thị đúng "Kho lưu trữ"
    [Documentation]    TC005
    [Tags]    TuAnh    HomePage
    Get And Compare Count    Kho lưu trữ    ${item_warwhouse}    Tổng số kho

TC006 - Kiểm tra hiển thị đúng số lượng "Giá kệ"
    [Documentation]    TC006
    [Tags]    TuAnh    HomePage
    Get And Compare Count    Giá kệ    ${item_shelf}    Tổng số giá

TC007 - Kiểm tra hiển thị đúng số lượng "Tổng số hộp"
    [Documentation]    TC007
    [Tags]    TuAnh    HomePage
    Get And Compare Count    Tổng số hộp    ${item_box}    Tổng số hộp

TC008 - Kiểm tra hiển thị đúng số lượng "Hộp có tài liệu"
    [Documentation]    TC008
    [Tags]    TuAnh    HomePage
    Get And Compare Count    Hộp có tài liệu    ${item_box}    Tổng số hộp
    
TC010 - Kiểm tra thao tác nhanh “Thêm đơn vị mới”
    [Documentation]    TC010
    [Tags]    TuAnh    HomePage
    Quick Add New Units       

TC011 - Kiểm tra thao tác nhanh "Thêm phông lưu trữ"
    [Documentation]    TC011
    [Tags]    TuAnh    HomePage
    Quick Add Phong

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
    Verify Page Title    Quản lý Đơn vị

TC023 - Kiểm tra click vào “Phông lưu trữ”
    [Documentation]    TC023
    [Tags]    TuAnh    HomePage
    Click Phong
    Verify Page Title    Quản lý Phông Lưu trữ

TC024 - Kiểm tra click “Mục lục hồ sơ”
    [Documentation]    TC024
    [Tags]    TuAnh    HomePage
    Click Profile Table of Contents
    Verify Page Title    Quản lý Mục lục hồ sơ

TC025 - Kiểm tra click vào "Quản lý kho"
    [Documentation]    TC025
    [Tags]    TuAnh    HomePage
    Close QLKho2


TC026 - Kiểm tra click “Kho lưu trữ”
    [Documentation]    TC026
    [Tags]    TuAnh    HomePage
    Click Warehouse
    Verify Page Title    Quản lý Kho lưu trữ

TC027 - Kiểm tra click “Giá kệ”
    [Documentation]    TC027
    [Tags]    TuAnh    HomePage
    Click shelf
    Verify Page Title    Quản lý Giá kệ

TC028 - Kiểm tra click “Hộp lưu trữ”
    [Documentation]    TC028
    [Tags]    TuAnh    HomePage
    Click Box
    Verify Page Title    Quản lý Hộp lưu trữ

TC029 - Kiểm tra click vào "Tìm kiếm & Báo cáo"
    [Documentation]    TC029
    [Tags]    TuAnh    HomePage
    Close Search_Report


TC030 - Kiểm tra click “Tìm kiếm”
    [Documentation]    TC030
    [Tags]    TuAnh    HomePage
    Click Search
    Verify Page Title    Tìm kiếm

TC031 - Kiểm tra click “Báo cáo”
    [Documentation]    TC030
    [Tags]    TuAnh    HomePage
    Click Report
    Verify Page Title    Báo cáo thống kê

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
    Verify Page Title    Quản lý tài khoản

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