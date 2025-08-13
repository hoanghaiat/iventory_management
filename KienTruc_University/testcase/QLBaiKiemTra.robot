*** Settings ***
Library    SeleniumLibrary
Resource    ../resource/QLBaiKiemTra.resource
Suite Setup    Open Browser To BaiKiemTra
Suite Teardown    Close Web
*** Variables ***

*** Test Cases ***
TC_EV_01 : Điều hướng trang My Classes
    [Documentation]    TC_EV_01 
    [Tags]    AnhTuyet    QuanLyBaiKiemTra
    Navigate My Classes page
TC_EV_02: Kiểm tra hiển thị danh sách bài kiểm tra
    [Documentation]    TC_EV_02
    [Tags]    AnhTuyet    QuanLyBaiKiemTra
    Check the list of tests
TC_EV_03 : Điều hướng đường dẫn Courses
    [Documentation]    TC_EV_03
    [Tags]    AnhTuyet    QuanLyBaiKiemTra
    Navigate Link Courses
TC_EV_04 : Thao tác xem bài kiểm tra
    [Documentation]    TC_EV_04
    [Tags]    AnhTuyet    QuanLyBaiKiemTra
    View Test

TC_EV_05 : Thao tác trợ giúp
    [Documentation]    TC_EV_05
    [Tags]    AnhTuyet    QuanLyBaiKiemTra
    Help Test

TC_EV_06 : Thao tác điểm
    [Documentation]    TC_EV_06
    [Tags]    AnhTuyet    QuanLyBaiKiemTra
    Grade Test

TC_EV_07 : Thao tác xuất báo cáo
    [Documentation]    TC_EV_07
    [Tags]    AnhTuyet    QuanLyBaiKiemTra
    Export Test

TC_EV_08 : Kiểm tra bộ lọc Tất cả
    [Documentation]    TC_EV_08
    [Tags]    AnhTuyet    QuanLyBaiKiemTra
    Check the filter All
TC_EV_09 : Kiểm tra bộ lọc Cuối kỳ
    [Documentation]    TC_EV_09
    [Tags]    AnhTuyet    QuanLyBaiKiemTra
    Check the filter Final

TC_EV_10 : Kiểm tra bộ lọc Bài kiểm tra nhanh
    [Documentation]    TC_EV_10
    [Tags]    AnhTuyet    QuanLyBaiKiemTra
    Check the filter Quiz

TC_EV_11 : Kiểm tra bộ lọc Bài tập
    [Documentation]    TC_EV_11
    [Tags]    AnhTuyet    QuanLyBaiKiemTra
    Check the filter Assignment

TC_EV_12 : Kiểm tra bộ lọc Dự án
    [Documentation]    TC_EV_12
    [Tags]    AnhTuyet    QuanLyBaiKiemTra
    Check the filter Project