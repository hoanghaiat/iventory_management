*** Settings ***
Library    SeleniumLibrary
Resource    ../resource/home_page.resource
Resource    ../resource/personal_setting.resource
Test Setup    Login To System
Test Teardown    Close Browser

*** Test Cases ***
TC057 - Kiểm tra điều hướng khi click "Quay lại" từ trang cài đặt giao diện
    [Documentation]    TC057
    [Tags]    TuAnh    PersonalSetting
    Click Interface
    Button Come Back