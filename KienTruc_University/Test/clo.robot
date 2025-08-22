*** Settings ***
Library    SeleniumLibrary
Resource    ../Resource/Clo.resource

*** Variables ***
*** Test Cases ***
Login
    Login To System    lecturer1    demolecturer
TC_SM_005
    [Documentation]    TC_SM_005
    [Tags]             Dat Huy View and Create Clo
    View and create Clo    ${ITEM_COURSE}
    Sleep    5s
TC_SM_006
    [Documentation]    TC_SM_006
    [Tags]             Dat Huy Edit Clo
    Edit Clo            ${VIEW_CLO}
    Sleep    5s