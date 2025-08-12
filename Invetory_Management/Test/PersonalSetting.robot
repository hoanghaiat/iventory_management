*** Settings ***
Library    SeleniumLibrary
Resource    ../Resource/HomePage.resource
Resource    ../Resource/PersonalSetting.resource
Test Setup    Login To System
Test Teardown    Close Browser
*** Variables ***

*** Test Cases ***
TC048 - Kiểm tra điều hướng khi click "Quay lại" từ trang cài đặt giao diện
    Click Interface
    Button Come Back