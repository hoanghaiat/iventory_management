*** Settings ***
Library    SeleniumLibrary    run_on_failure=No Operation
Library      CustomLibrary
Variables     ../Variables/locator.py
Resource      ../Resources/course_university.resource 
Resource    ../Resources/common.resource

Suite Setup    Open Browser To Login Page
Test Setup    Go To Course Page
Test Teardown    Close All Browsers
Suite Teardown    Close All Browsers

*** Test Cases ***
 Verify User Can Open Program Page successfully
    [Documentation]        TC_CI_01
    [Tags]                Thu Phuong       Interface of Course
    Click Program Button In Course 
    Wait Until Element Is Visible    ${PROGRAMS_PAGE_TITLE}

 Verify User Can Open Detail Course Page successfully
    [Documentation]        TC_CI_02
    [Tags]                Thu Phuong       Interface of Course
    Click First View Courses Button
    Wait Until Element Is Visible    ${DEATAIL_COURSE_TABLE}    10s

 Verify User Can Open Edit Course Page successfully
    [Documentation]        TC_CI_03
    [Tags]                Thu Phuong       Interface of Course
    Click First Edit Courses Button 
    Wait Until Element Is Visible    ${EDIT_COURSE_TITLE}    10s

Verify User Can Open Dashboard Program Page successfully
    [Documentation]        TC_CI_05
    [Tags]                Thu Phuong       Interface of Course
    Click Program Button In Course
    Wait Until Element Is Visible    ${PROGRAMS_PAGE_TITLE}
    
Verify User Can Open CLO Page successfully
    [Documentation]        TC_CI_06
    [Tags]                Thu Phuong       Interface of Course
    Click First View CLO Button
    Wait Until Element Is Visible    ${CLO_TITLE}


Verify User Can Update Courses Successfully
    [Documentation]    TC_CE_01
    [Tags]    Thu Phuong    Edit Course
    Click First Edit Courses Button
    Fill Course Form    Công nghệ thông tin    BL8    block chain    5    Khóa học Block Chain    Elective    Completed    CS301 - Cơ sở dữ liệu
    Click Update Course Button
    Verify Success Message And Course Update

Verify User Can't Update Course With Empty Program Fields
    [Documentation]    TC_CE_02
    [Tags]    Thu Phuong    Edit Course
    Click First Edit Courses Buttonn
    Fill Course Form    ${EMPTY}    BL2    block chain    4    Khóa học Block Chain    Mandatory    Completed    CS301 - Cơ sở dữ liệu
    Click Update Course Button
    Verify Error Update Message For Required Fields    program

Verify User Can't Update Course With Empty Course Code Fields
    [Documentation]    TC_CE_03
    [Tags]    Thu Phuong    Edit Course
    Click First Edit Courses Button
    Fill Course Form    Công nghệ thông tin    ${EMPTY}    block chain    4    Khóa học Block Chain    Mandatory    Completed    CS301 - Cơ sở dữ liệu
    Click Update Course Button
    Verify Error Update Message For Required Fields    course code

Verify User Can't Update Course With Empty Course Name
    [Documentation]    TC_CE_04
    [Tags]    Thu Phuong    Edit Course
    Click First Edit Courses Button
    Fill Course Form    Công nghệ thông tin    BL2    ${EMPTY}    4    Khóa học Block Chain    Mandatory    Completed    CS301 - Cơ sở dữ liệu
    Click Update Course Button
    Verify Error Update Message For Required Fields    course name

Verify User Can't Update Course With Empty Credits Fields
    [Documentation]    TC_CE_05
    [Tags]    Thu Phuong    Edit Course
    Click First Edit Courses Button
    Fill Course Form    Công nghệ thông tin    BL2    block chain    ${EMPTY}    Khóa học Block Chain    Mandatory    Completed    CS301 - Cơ sở dữ liệu
    Click Update Course Button
    Verify Error Update Message For Required Fields    credit

Verify User Can't Update Course With Empty Description Fields
    [Documentation]    TC_CE_06
    [Tags]    Thu Phuong    Edit Course
    Click First Edit Courses Button
    Fill Course Form    Công nghệ thông tin    BL2    block chain    4    ${EMPTY}    Mandatory    Completed    CS301 - Cơ sở dữ liệu
    Click Update Course Button
    Verify Error Update Message For Required Fields    description

Mandatory turns blue after update
    [Documentation]    TC_CE_07
    [Tags]    Thu Phuong    Edit Course
    Click First Edit Courses Button
    Fill Course Form    Cử nhân Khoa học Máy tính    BL    block chain    4    Khóa học Block Chain    Mandatory    Completed    CS301 - Cơ sở dữ liệu
    Click Update Course Button
    Verify Success Message And Course Update
    Wait Until Page Contains Element    ${MANDATORY}    
Verify Course Ui Matches Input 
    [Documentation]    TC_CE_08
    [Tags]    Thu Phuong    Edit Course
    Click First Edit Courses Button
    ${course_data}=    Fill Course Form    Cử nhân Khoa học Máy tính    B8    block chain    5    Khóa học Block Chain    Elective    Completed    CS301 - Cơ sở dữ liệu
    Click Update Course Button
    Verify Success Message And Course Update
    Verify Course Data In UI    ${course_data}
  
# Search Course 

Search With Valid Keywords Course Page
    [Documentation]    TC_CS_01
    [Tags]         Thu Phuong    Search Course 
    Perform And Click Search Button In Course    CNTT
    Verify Search Result Exists In Course    CNTT

Search With Empty Textbox In Courses
    [Documentation]    TC_CS_02
    [Tags]         Thu Phuong      Search Course 
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${SEARCH_BTN}
    Wait Until Element Is Visible    ${RESULT_TABLE} 

Search With Keyword Not In List In Courses
     [Documentation]    TC_CS_03
    [Tags]         Thu Phuong      Search Course 
    Perform And Click Search Button In Course    111111 
    Verify Search No Course Result
Search With Special Character Courses 
    [Documentation]    TC_CS_04 
    [Tags]         Thu Phuong      Search Course 
    Perform And Click Search Button In Course     @# 
    Verify Search No Course Result
 Search With Partial Keyword Course
    [Documentation]    TC_CS_05 
    [Tags]         Thu Phuong      Search Course 
    Perform And Click Search Button In Course    phần mềm 
    Verify Search Result Exists In Course    phần mềm 
   
Search With Uppercase Keyword Course 
    [Documentation]    TC_CS_05 
    [Tags]         Thu Phuong      Search Course 
    Perform And Click Search Button In Course    CƠ BẢN 
    Verify Search Result Exists In Course    CƠ BẢN

Verify Open Edit Course Page 
    [Documentation]      TC_DCI_01
    [Tags]         Thu Phuong        Details Course 
    Click View Course Button 
    Wait Until Page Contains Element    ${CLO_TITLE} 
    
Verify Open CLOs Page 
    [Documentation]      TC_DCI_02
    [Tags]         Thu Phuong        Details Course 
    Click View Course Button
    Click Edit Course Button
    Wait Until Page Contains Element    ${CLO_TITLE}
Verify Open Create New Class Page 
    [Documentation]      TC_DCI_03
    [Tags]         Thu Phuong        Details Course  
    Click View Course Button
    Click Create Class Button
    Wait Until Page Contains Element    ${CREATE_CLASS_TITLE}

Verify Open Course Page 
    [Documentation]      TC_DCI_04
    [Tags]         Thu Phuong        Details Course  
    Click View Course Button
    Click Back To Courses Button
    Wait Until Page Contains Element    ${COURSE_TITLE}

Verify Open Detail Course Page 
    [Documentation]      TC_DCI_05
    [Tags]         Thu Phuong        Details Course
    Click View Course Button
    Wait Until Element Is Visible    ${COURSE_TITLE}

Verify Open Create New CLO Page 
    [Documentation]      TC_DCI_06
    [Tags]         Thu Phuong        Details Course  
    Click View Course Button
    Click Add CLO Button
    Wait Until Page Contains Element    ${CLO_TITLE}
    
Verify Open Create New CLO Page By Link 
    [Documentation]      TC_DCI_07
    [Tags]         Thu Phuong        Details Course  
    Click View Course Button
    Wait Until Element Is Visible    ${CLO_CREATE_TITLE}

Verify Open New Chapter Page 
    [Documentation]      TC_DCI_08
    [Tags]         Thu Phuong        Details Course  
    Click View Course Button
    Click Add Content Button
    Wait Until Page Contains Element    ${ADD_CHAPTER_TITLE}
Verify Open CLO Details Page 
    [Documentation]      TC_DCI_09
    [Tags]         Thu Phuong        Details Course 
    Click View Course Button
    Click View CLOs Button
    Wait Until Page Contains Element    ${CLO_TITLE} 

Verify Open Edit CLO Page 
    [Documentation]      TC_DCI_10
    [Tags]         Thu Phuong        Details Course  
    Click View Course Button
    Click Edit CLOs Button
    Wait Until Page Contains Element    ${CLO_TITLE} 

Verify Open Edit Chapter Page 
    [Documentation]      TC_DCI_11
    [Tags]         Thu Phuong        Details Course  
    Click View Course Button
    Click Setting Button
    Click First Assessment Category Action    update
    Wait Until Page Contains Element    ${EDIT_EVALUATE_TITLE} 

Verify Delete Course Schedule
    [Documentation]      TC_DCI_12
    [Tags]         Thu Phuong        Details Course   
    Click View Course Button
    Click Setting Button
    Click First Assessment Category Action     delete 
    Wait Until Page Contains Element    ${ERROR_DELETE_TITLE}

Verify Open Add New Evaluate Page 
    [Documentation]      TC_DCI_13
    [Tags]         Thu Phuong        Details Course 
    Click View Course Button
    Click Add Assessment Button
    Wait Until Page Contains Element    ${ADD_EVALUATE_TITLE}

Verify Delete Exams Button
    [Documentation]      TC_DCI_15
    [Tags]         Thu Phuong        Details Course  
    Click View Course Button
    Click Setting Button
    Click First Assessment Category Action     delete 
    Page Should Contain Button     Delete 

Verify Open Create New Class Page By click TLH
    [Documentation]      TC_DCI_16
    [Tags]         Thu Phuong        Details Course  
    Click View Course Button
    Click Add Class Button 
    Wait Until Element Is Visible    ${CREATE_CLASS_TITLE}