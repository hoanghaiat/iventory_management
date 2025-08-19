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
TC_PR_003
    [Documentation]    TC_PR_003
    [Tags]             Dat Huy Click Next/Previous Page
    Click Next Page    
    Sleep    5s
    Click Previous Page
    Sleep    5s
TC_PR_005
    [Documentation]    TC_PR_005
    [Tags]             Dat Huy View Program
    View Program    
    Sleep    5s
TC_PR_006
    [Documentation]    TC_PR_006
    [Tags]             Dat Huy View Coppy Program
    Coppy Program    
    Sleep    5s
TC_PR_007
    [Documentation]    TC_PR_007
    [Tags]             Dat Huy View Course
    View Course    
    Sleep    5s
TC_PR_008
    [Documentation]    TC_PR_008
    [Tags]             Dat Huy Create Course
    Create Course 
    Sleep    5s