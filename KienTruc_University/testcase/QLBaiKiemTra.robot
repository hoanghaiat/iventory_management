*** Settings ***
Library    SeleniumLibrary
Resource    ../resource/QLBaiKiemTra.resource
Suite Setup    Open Browser To BaiKiemTra
Suite Teardown    Close Web
*** Variables ***

*** Test Cases ***
TC_CB_01 : Điều hướng trang My Classes
    [Documentation]    Kiểm tra nút "Lớp học của tôi" điều hướng đúng trang
    Navigate My Classes page
TC_CB_02 : Điều hướng đường dẫn Courses
    [Documentation]    Kiểm tra điều hướng link học phần
    Navigate Link Courses
TC_CB_03 : Thao tác xem bài kiểm tra
    [Documentation]    Thao tác xem bài kiểm tra
    View Test
TC_CB_04 : Thao tác trợ giúp
    [Documentation]    Thao tác trợ giúp
    Help Test
TC_CB_05 : Thao tác điểm
    [Documentation]    Thao tác điểm
    Grade Test
TC_CB_06 : Thao tác xuất báo cáo
    [Documentation]    Thao tác xuất báo cáo
    Export Test

TC_CB_07 : Kiểm tra bộ lọc
    [Documentation]    Kiểm tra bộ lọc
    Check the filter