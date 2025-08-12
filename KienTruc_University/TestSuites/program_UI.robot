*** Settings ***
Documentation     Test suite - Program Tab (TC_PP_01 -> TC_PP_03)
Library           SeleniumLibrary
Resource          ../resources/program_UI.resource
Variables         ../variables/locator.py

Test Setup        Open Browser And Login
Test Teardown     Close Browser

*** Test Cases ***
TC_PP_01 Verify user can open detail program page successfully
    Go To Programs Page
    ${prog_name}=    Get First Program Name
    Click First View Program Courses Button  # reused keyword
    Page Should Contain    ${prog_name}

TC_PP_02 Verify user can open courses page successfully
    Go To Programs Page
    ${prog_name}=    Get First Program Name
    Click First Program Courses Button
    Page Should Contain    ${prog_name}
    Page Should Contain    Courses

TC_PP_03 Verify user can view all course page successfully
    Go To Programs Page
    ${prog_name}=    Get First Program Name
    Click First View Program Courses Button 
    Page Should Contain    ${prog_name}
    Click See All Button Courses
    # You can further assert a known title or element in the "See All" page here
TC_PP_04 Verify user can view detail course page successfully 
    Go To Programs Page
    ${prog_name}=  Get First Program Name
    Click First View Program Courses Button 
    Page Should Contain    ${prog_name}
    Click View Course Button In Detail Program

TC_PP_05 Verify user can click All Button successfully
    Go To Programs Page
    ${prog_name}=  Get First Program Name 
    Click First Program Courses Button
    Page Should Contain    ${prog_name}
    Click All Course Button in Course Page

TC_PP_06 Verify user can click Add Button successfully
    Go To Programs Page
    ${prog_name}=  Get First Program Name 
    Click First Program Courses Button
    Page Should Contain    ${prog_name}
    Click Add Course Button In Courses Page
TC_PP_07 Verify user can click Back to Program Button successfully
    Go To Programs Page
    ${prog_name}=  Get First Program Name 
    Click First Program Courses Button
    Page Should Contain    ${prog_name}
    Click Back To Program Button In Courses Page
TC_PP_08 Verify user can click Trang Chu successfully
    Go To Programs Page
    ${prog_name}=  Get First Program Name 
    Click First Program Courses Button
    Page Should Contain    ${prog_name}
    CLick Trang Chu Link In Course Page
TC_PP_09 Verify user can click Eyes Button successfully
    Go To Programs Page
    ${prog_name}=  Get First Program Name 
    Click First Program Courses Button
    Page Should Contain    ${prog_name}
    Click Eyes Button In Course Page
TC_PP_10 Verify user can click Edit Button successfully
    Go To Programs Page
    ${prog_name}=  Get First Program Name 
    Click First Program Courses Button
    Page Should Contain    ${prog_name}
    Click Edit Button In Course Page
TC_PP_11 Verify user can click View CLOs Button successfully
    Go To Programs Page
    ${prog_name}=  Get First Program Name 
    Click First Program Courses Button
    Page Should Contain    ${prog_name}
    Click View CLOs Button In Course Page
