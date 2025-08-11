*** Settings ***
Library    SeleniumLibrary
Resource    resource.resource

*** Variables ***

*** Test Cases ***
Login
    Login To System    lecturer1    demolecturer
TC_003_ThaoTacNhanh
    [Documentation]    Đăng nhập và truy cập trang học phần từ Thao tác nhanh
    Go To Course Management
    Go To Home Page
    Go To Course Test
    Sleep    5s
    [Teardown]    Close Browser