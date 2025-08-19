*** Settings ***
Library      SeleniumLibrary
Library      CustomLibrary
Variables     ../Variables/locator.py
Resource      ../Resources/course_update.resource 

Test Setup       Open Browser And Login
Test Teardown    Close Browser

*** Test Cases ***

Verify User Can Update Courses Successfully
    [Documentation]        TC_CE_01
    [Tags]                Thu Phuong     Edit Course 
    Go To Course Page
    ${prog_name}=    Get First Course Name
    Click First Edit Courses Button
    Fill Course With Valid Data      Công nghệ thông tin  BL1   block chain   5   Khóa học Block Chain   Mandatory    Completed   CS301 - Cơ sở dữ liệu
    Click Update Course Button 
    Verify Success Message And Course Update 
Verify User Can't Update Course With Empty Program Fields
    [Documentation]        TC_CE_02
    [Tags]                Thu Phuong     Edit Course   
    Go To Course Page
    ${prog_name}=    Get First Course Name
    Click First Edit Courses Button
    Fill Course With Empty Program Field    BL2    block chain   4   Khóa học Block Chain   Mandatory    Completed   CS301 - Cơ sở dữ liệu
    Click Update Course Button
    Verify Error Update Message For Required Fields    program
Verify User Can't Update Course With Empty Course Code Fields
    [Documentation]        TC_CE_03
    [Tags]                Thu Phuong     Edit Course 
    Go To Course Page
    Click First Edit Courses Button
    Fill Course With Empty Course Code    Công nghệ thông tin   block chain   4   Khóa học Block Chain   Mandatory    Completed   CS301 - Cơ sở dữ liệu
    Click Update Course Button
    Verify Error Update Message For Required Fields    course code 
Verify User Can't Update Course With Empty Course Name 
    [Documentation]        TC_CE_04
    [Tags]                Thu Phuong     Edit Course 
    Go To Course Page
    Click First Edit Courses Button
    Fill Course With Empty Course Name    Công nghệ thông tin  BL2   4   Khóa học Block Chain   Mandatory    Completed   CS301 - Cơ sở dữ liệu
    Click Update Course Button
    Verify Error Update Message For Required Fields    course name 

Verify User Can't Update Course With Empty Credits Fields
    [Documentation]        TC_CE_05
    [Tags]                Thu Phuong     Edit Course 
    Go To Course Page
    Click First Edit Courses Button
    Fill Course With Empty Credit   Công nghệ thông tin  BL2  block chain    Khóa học Block Chain   Mandatory    Completed   CS301 - Cơ sở dữ liệu
    Click Update Course Button
    Verify Error Update Message For Required Fields    credit

Verify User Can't Update Course With Empty Description Fields
    [Documentation]        TC_CE_06
    [Tags]                Thu Phuong     Edit Course 
    Go To Course Page
    Click First Edit Courses Button
    Fill Course With Empty Description    Công nghệ thông tin  BL2  block chain   4   Mandatory    Completed   CS301 - Cơ sở dữ liệu
    Click Update Course Button
    Verify Error Update Message For Required Fields    description
    
Mandatory turns blue after update 
    [Documentation]        TC_CE_07
    [Tags]                Thu Phuong     Edit Course 
    Go To Course Page
    Click First Edit Courses Button
    Fill Course With Valid Data      Công nghệ thông tin  BL    block chain   4   Khóa học Block Chain   Mandatory    Completed   CS301 - Cơ sở dữ liệu
    Click Update Course Button
    Verify Success Message And Course Update 
    Wait Until Page Contains Element    ${MANDATORY}


