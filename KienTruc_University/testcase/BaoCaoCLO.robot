*** Settings ***
Library    SeleniumLibrary
Resource    ../resource/BaoCaoCLO.resource
Suite Setup    Open Browser To BaoCaoCLO
Suite Teardown    Close Web
*** Variables ***

*** Test Cases ***
TC_CB_01 : Danh sách báo cáo CLO
    [Documentation]    Kiểm tra hiển thị danh sách báo cáo CLO
    View report list CLO