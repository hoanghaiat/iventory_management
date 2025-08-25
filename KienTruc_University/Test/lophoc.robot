*** Settings ***
Library    SeleniumLibrary
Resource    ../Resource/LopHoc.resource

*** Variables ***
*** Test Cases ***
Login
    Login To System    lecturer1    demolecturer
TC_Cl_001
    [Documentation]    TC_CL_001
    [Tags]             Dat Huy View Class
    View Class
    Sleep    5s    
TC_CL_002
    [Documentation]    TC_CL_002
    [Tags]             Dat Huy Search Class
    Search Class    cs101
    Sleep    5s
