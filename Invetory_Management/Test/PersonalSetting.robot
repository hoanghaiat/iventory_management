*** Settings ***
Library    SeleniumLibrary
Resource    ../Resource/HomePage.resource
Resource    ../Resource/PersonalSetting.resource
Test Setup    Login To System
Test Teardown    Close Browser
*** Variables ***

*** Test Cases ***
TC057 - Kiểm tra điều hướng khi click "Quay lại" từ trang cài đặt giao diện
    [Documentation]    TC057
    [Tags]    TuAnh    PersonalSetting
    Click Interface
    Button Come Back