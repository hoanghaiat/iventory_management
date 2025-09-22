*** Settings ***
Library    SeleniumLibrary    run_on_failure=No Operation
Library             String
Resource          ../resources/program_university.resource
Resource          ../Resources/common.resource

Suite Setup       Open Browser To Login Page 
Test Setup        Go To Programs Page 
Suite Teardown    Close All Browsers

*** Test Cases ***
 Verify user can open detail program page successfully
    [Documentation]       TC_PP_01
    [Tags]                Thu Phuong    Interface of Program 
    Click First View Program Courses Button 
    Wait Until Element Is Visible    ${DETAIL_PROGRAM_TITLE}

 Verify user can open courses page successfully
    [Documentation]       TC_PP_02
    [Tags]                Thu Phuong     Interface of Program
    Click First Program Courses Button
    Page Should Contain    Courses

 Verify user can view all course page successfully
    [Documentation]       TC_PP_03
    [Tags]                Thu Phuong     Interface of Program
    Click First View Program Courses Button 
    Click See All Button Courses

Verify user can view detail course page successfully 
    [Documentation]       TC_PP_04
    [Tags]                Thu Phuong    Interface of Program
    Click First View Program Courses Button 
    Click View Course Button In Detail Program

 Verify user can click All Button successfully
    [Documentation]       TC_PP_05
    [Tags]                Thu Phuong    Interface of Program
    Click First Program Courses Button
    Click All Course Button in Course Page

 Verify user can click Add Button successfully
    [Documentation]       TC_PP_06
    [Tags]                Thu Phuong     Interface of Program
    Click First Program Courses Button
    Click Add Course Button In Courses Page
 Verify user can click Back to Program Button successfully
    [Documentation]       TC_PP_07
    [Tags]                Thu Phuong     Interface of Program 
    Click First Program Courses Button
    Click Back To Program Button In Courses Page
 Verify user can click Trang Chu successfully
    [Documentation]       TC_PP_08
    [Tags]                Thu Phuong     Interface of Program 
    Click First Program Courses Button
    CLick Trang Chu Link In Course Page
 Verify user can click Eyes Button successfully
    [Documentation]       TC_PP_09
    [Tags]                Thu Phuong    Interface of Program
    Click First Program Courses Button
    Click Eyes Button In Course Page
 Verify user can click Edit Button successfully
    [Documentation]       TC_PP_10
    [Tags]                Thu Phuong    Interface of Program
    Click First Program Courses Button
    Click Edit Button In Course Page
 Verify user can click View CLOs Button successfully
    [Documentation]       TC_PP_11
    [Tags]                Thu Phuong     Interface of Program
    Click First Program Courses Button
    Click View CLOs Button In Course Page
   
# Search Program 

TC Search With Valid Keyword
    [Documentation]        TC_PS_01
    [Tags]           Thu Phuong    Search 
    Perform Search    Block chain
    Verify Search Result Exists   Block chain 
TC Search With Empty Keyword
    [Documentation]        TC_PS_02
    [Tags]           Thu Phuong    Search 
    Click Element    ${SEARCH_BTN}  
    Wait Until Page Contains Element    ${RESULT_TABLE}  
TC Search With Keyword Not in List Program 
    [Documentation]  TC_PS_03 
    [Tags]           Thu Phuong    Search 
    Perform Search    59 công nghệ 
    Verify Search No Result 
TC Search With Special Characters Keyword 
    [Documentation]  TC_PS_04
    [Tags]           Thu Phuong    Search 
    Perform Search    @# 
    Verify Search No Result
TC Search With Valid Data In Course of Program 
    [Documentation]  TC_PS_05
    [Tags]           Thu Phuong    Search 
    Click First Program Courses Button 
    Perform Search    block chain cơ bản 
    Verify Search Result Exists    block chain cơ bản 
TC Search With Empty Data In Course of Program 
    [Documentation]  TC_PS_06
    [Tags]           Thu Phuong    Search 
    Click First Program Courses Button 
    Click Element    ${SEARCH_BTN}
    Wait Until Page Contains Element    ${RESULT_TABLE} 

TC Search With Keyword Not in List Course 
    [Documentation]  TC_PS_07
    [Tags]           Thu Phuong    Search 
    Click First Program Courses Button
    Perform Search    artificial intelligence 
    Verify Search No Result
TC Search With Special Characters Keyword In Program 
    [Documentation]  TC_PS_08
    [Tags]           Thu Phuong    Search 
    Click First Program Courses Button
    Perform Search    @# 
    Click Add One Link in Course
    Wait Until Page Contains Element    ${CREATE_COURSE_FORM}  
    