*** Settings ***

Library      SeleniumLibrary
Library      CustomLibrary
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
    ${prog_name}=  Get First Course Name 
    Click First Edit Courses Button 

Verify User Can Open Dashboard Program Page successfully
    [Documentation]        TC_CI_05
    [Tags]                Thu Phuong       Interface of Course
    Go To Course Page
    Click Program Button In Course
Verify User Can Open CLO Page successfully
    [Documentation]        TC_CI_06
    [Tags]                Thu Phuong       Interface of Course
    Go To Course Page
    ${prog_name}=  Get First Course Name 
    Click First View CLO Button
    Page Should Contain    ${prog_name} 

# Search Course 

Search With Valid Keywords Course Page
    [Documentation]    TC_CS_01
    [Tags]         Thu Phuong    Search Course 
    Go To Course Page
    Perform And Click Search Button In Course    CNTT
    Verify Search Result Exists In Course    CNTT

Search With Empty Textbox In Courses
    [Documentation]    TC_CS_02
    [Tags]         Thu Phuong      Search Course 
    Go To Course Page
    Click Element    ${SEARCH_BTN}
    Wait Until Element Is Visible    ${RESULT_TABLE} 

Search With Keyword Not In List In Courses
     [Documentation]    TC_CS_03
    [Tags]         Thu Phuong      Search Course 
    Go To Course Page
    Perform And Click Search Button In Course    111111 
    Verify Search No Course Result
Search With Special Character Courses 
    [Documentation]    TC_CS_04 
    [Tags]         Thu Phuong      Search Course 
    Go To Course Page
    Perform And Click Search Button In Course     @# 
    Verify Search No Course Result
 Search With Partial Keyword Course
    [Documentation]    TC_CS_05 
    [Tags]         Thu Phuong      Search Course 
    Go To Course Page
    Perform And Click Search Button In Course    phần mềm 
    Verify Search Result Exists In Course    phần mềm 
   
Search With Uppercase Keyword Course 
    [Documentation]    TC_CS_05 
    [Tags]         Thu Phuong      Search Course 
    Go To Course Page
    Perform And Click Search Button In Course    CƠ BẢN 
    Verify Search Result Exists In Course    CƠ BẢN