*** Settings ***
Library    SeleniumLibrary
Resource    ../Resource/Hocphan.resource

*** Variables ***
*** Test Cases ***
Login
    Login To System    lecturer1    demolecturer
TC_SM_001
    [Documentation]    TC_SM_001
    [Tags]             Dat Huy View Course
    View Course    ${ITEM_COURSE}
    Sleep    5s
TC_SM_002
    [Documentation]    TC_SM_002
    [Tags]             Dat Huy View Module Detail
    View module detail
    Sleep    5s
TC_SM_003
    [Documentation]    TC_SM_003
    [Tags]             Dat Huy Edit Course
    Edit Course
    Sleep    5s
TC_SM_004
    [Documentation]    TC_SM_004
    [Tags]             Dat Huy Search Course
    Search Course    CNTT001 
    Sleep    5s
