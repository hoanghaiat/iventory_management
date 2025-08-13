*** Settings ***

Library      SeleniumLibrary
Variables     ../Variables/locator.py
Resource      ../Resources/course_ui.resource 


Test Setup       Open Browser And Login
Test Teardown    Close Browser

*** Test Cases ***
 Verify User Can Open Program Page successfully
    [Documentation]        TC_CI_01
    [Tags]                Thu Phuong       Interface of Course
    Go To Course Page
    ${prog_name}=    Get First Course Name
    Click Program Button In Course 


 Verify User Can Open Detail Course Page successfully
    [Documentation]        TC_CI_02
    [Tags]                Thu Phuong       Interface of Course
    Go To Course Page
    ${prog_name}=    Get First Course Name
    Click First View Courses Button
    Page Should Contain    ${prog_name}
 Verify User Can Open Edit Course Page successfully
    [Documentation]        TC_CI_03
    [Tags]                Thu Phuong       Interface of Course
    Go To Course Page
    ${prog_name}=    Get First Course Name
    Click First Edit Courses Button

 Verify User Can Open CLOs of Course Page successfully
    [Documentation]        TC_CI_04
    [Tags]                Thu Phuong       Interface of Course
    Go To Course Page
    ${prog_name}=    Get First Course Name
    Click First View CLO Button

Verify User Can Open Dashboard Program Page successfully
    [Documentation]        TC_CI_05
    [Tags]                Thu Phuong       Interface of Course
    Go To Course Page
    Click Program Button In Course
Verify User Can Open CLO Page successfully
    [Documentation]        TC_CI_06
    [Tags]                Thu Phuong       Interface of Course
    Go To Course Page
    ${prog_name}=    Get First Course Name
    Click First View CLO Button

Verify user can edit courses successfully
    [Documentation]        TC_CI_07
    [Tags]                Thu Phuong     Edit Course 
    Go To Course Page
    Click First Edit Courses Button
    Fill Course With Valid Data      Công nghệ thông tin  BL2    block chain   4   Khóa học Block Chain   Mandatory    Completed   CS301 - Cơ sở dữ liệu
    Click Update Course Button
    Verify Success Message And Course Update
