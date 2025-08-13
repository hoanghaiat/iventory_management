*** Settings ***
Library    SeleniumLibrary
Resource    ../Resource/Chuongtrinhdaotao.resource

*** Variables ***
*** Test Cases ***
Login
    Login To System    lecturer1    demolecturer
TC_002
    [Documentation]    Thao tac nhanh
    Search Program In Training    Khoa Luan
    Sleep    5s
    [Teardown]    Close Browser