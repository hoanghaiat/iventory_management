*** Settings ***
Documentation     Test suite - Program Tab (TC_PP_01 -> TC_PP_11)
Library           SeleniumLibrary
Resource          ../resources/program_UI.resource
Variables         ../variables/locator.py

Test Setup        Open Browser And Login
Test Teardown     Close Browser

*** Test Cases ***
 Verify user can open detail program page successfully
    [Documentation]       TC_PP_01
    [Tags]                Thu Phuong    Interface of Program 
    Go To Programs Page
    ${prog_name}=    Get First Program Name
    Click First View Program Courses Button 
    Page Should Contain    ${prog_name}

 Verify user can open courses page successfully
    [Documentation]       TC_PP_02
    [Tags]                Thu Phuong     Interface of Program
    Go To Programs Page
    ${prog_name}=    Get First Program Name
    Click First Program Courses Button
    Page Should Contain    ${prog_name}
    Page Should Contain    Courses

 Verify user can view all course page successfully
    [Documentation]       TC_PP_03
    [Tags]                Thu Phuong     Interface of Program
    Go To Programs Page
    ${prog_name}=    Get First Program Name
    Click First View Program Courses Button 
    Page Should Contain    ${prog_name}
    Click See All Button Courses
    # You can further assert a known title or element in the "See All" page here
Verify user can view detail course page successfully 
    [Documentation]       TC_PP_04
    [Tags]                Thu Phuong    Interface of Program
    Go To Programs Page
    ${prog_name}=  Get First Program Name
    Click First View Program Courses Button 
    Page Should Contain    ${prog_name}
    Click View Course Button In Detail Program

 Verify user can click All Button successfully
    [Documentation]       TC_PP_05
    [Tags]                Thu Phuong    Interface of Program
    Go To Programs Page
    ${prog_name}=  Get First Program Name 
    Click First Program Courses Button
    Page Should Contain    ${prog_name}
    Click All Course Button in Course Page

 Verify user can click Add Button successfully
    [Documentation]       TC_PP_06
    [Tags]                Thu Phuong     Interface of Program
    Go To Programs Page
    ${prog_name}=  Get First Program Name 
    Click First Program Courses Button
    Page Should Contain    ${prog_name}
    Click Add Course Button In Courses Page
 Verify user can click Back to Program Button successfully
    [Documentation]       TC_PP_07
    [Tags]                Thu Phuong     Interface of Program 
    Go To Programs Page
    ${prog_name}=  Get First Program Name 
    Click First Program Courses Button
    Page Should Contain    ${prog_name}
    Click Back To Program Button In Courses Page
 Verify user can click Trang Chu successfully
    [Documentation]       TC_PP_08
    [Tags]                Thu Phuong     Interface of Program 
    Go To Programs Page
    ${prog_name}=  Get First Program Name 
    Click First Program Courses Button
    Page Should Contain    ${prog_name}
    CLick Trang Chu Link In Course Page
 Verify user can click Eyes Button successfully
    [Documentation]       TC_PP_09
    [Tags]                Thu Phuong    Interface of Program
    Go To Programs Page
    ${prog_name}=  Get First Program Name 
    Click First Program Courses Button
    Page Should Contain    ${prog_name}
    Click Eyes Button In Course Page
 Verify user can click Edit Button successfully
    [Documentation]       TC_PP_10
    [Tags]                Thu Phuong    Interface of Program
    Go To Programs Page
    ${prog_name}=  Get First Program Name 
    Click First Program Courses Button
    Page Should Contain    ${prog_name}
    Click Edit Button In Course Page
 Verify user can click View CLOs Button successfully
    [Documentation]       TC_PP_11
    [Tags]                Thu Phuong     Interface of Program
    Go To Programs Page
    ${prog_name}=  Get First Program Name 
    Click First Program Courses Button
    Page Should Contain    ${prog_name}
    Click View CLOs Button In Course Page
