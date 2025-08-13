*** Settings ***
Library    SeleniumLibrary
Resource    ../Resource/Chuongtrinhdaotao.resource

*** Variables ***
*** Test Cases ***
Login
    Login To System    lecturer1    demolecturer
TC_PR_001
    [Documentation]    TC_PR_001
    [Tags]             Dat Huy Search
    Search Program In Training    Khoa Luan
    Sleep    5s
TC_002
    [Documentation]    TC_002
    [Tags]             Dat Huy Click Next Page
    Click Next Page    
    Sleep    5s
    [Teardown]    Close Browser