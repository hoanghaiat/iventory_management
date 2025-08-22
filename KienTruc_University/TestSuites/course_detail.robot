*** Settings ***
Library     SeleniumLibrary

Variables    ../Variables/locator.py
Resource      ../Resources/course_detail.resource

Test Setup     Open Browser And Login
Test Teardown     Close Browser

*** Test Cases ***
Verify Open Edit Course Page 
    [Documentation]      TC_DCI_01
    [Tags]         Thu Phuong        Details Course 
    Go To Course Page
    Click View Course Button
    Wait Until Page Contains Element    ${CLO_TITLE} 
    
Verify Open CLOs Page 
    [Documentation]      TC_DCI_02
    [Tags]         Thu Phuong        Details Course 
    Go To Course Page
    Click View Course Button
    Click Edit Course Button
    Wait Until Page Contains Element    ${CLO_TITLE}
Verify Open Create New Class Page 
    [Documentation]      TC_DCI_03
    [Tags]         Thu Phuong        Details Course 
    Go To Course Page
    Click View Course Button 
    Click Create Class Button
    Wait Until Page Contains Element    ${CREATE_CLASS_TITLE}

Verify Open Course Page 
    [Documentation]      TC_DCI_04
    [Tags]         Thu Phuong        Details Course 
    Go To Course Page
    Click View Course Button 
    Click Back To Courses Button
    Wait Until Page Contains Element    ${COURSE_TITLE}

Verify Open Detail Course Page 
    [Documentation]      TC_DCI_05
    [Tags]         Thu Phuong        Details Course 
    Go To Course Page
    Click View Course Button 


Verify Open Create New CLO Page 
    [Documentation]      TC_DCI_06
    [Tags]         Thu Phuong        Details Course 
    Go To Course Page
    Click View Course Button 
    Click Add CLO Button
    Wait Until Page Contains Element    ${CLO_TITLE}
Verify Open Create New CLO Page By Link 
    [Documentation]      TC_DCI_07
    [Tags]         Thu Phuong        Details Course 
    Go To Course Page
    Click View Course Button 


Verify Open New Chapter Page 
    [Documentation]      TC_DCI_08
    [Tags]         Thu Phuong        Details Course 
    Go To Course Page
    Click View Course Button 
    Click Add Content Button
    Wait Until Page Contains Element    ${ADD_CHAPTER_TITLE}
Verify Open CLO Details Page 
    [Documentation]      TC_DCI_09
    [Tags]         Thu Phuong        Details Course 
    Go To Course Page
    Click View Course Button
    Click View CLOs Button
    Wait Until Page Contains Element    ${CLO_TITLE} 

Verify Open Edit CLO Page 
    [Documentation]      TC_DCI_10
    [Tags]         Thu Phuong        Details Course 
    Go To Course Page
    Click View Course Button 
    Click Edit CLOs Button
    Wait Until Page Contains Element    ${CLO_TITLE} 

Verify Open Edit Chapter Page 
    [Documentation]      TC_DCI_11
    [Tags]         Thu Phuong        Details Course 
    Go To Course Page
    Click View Course Button 
    Click Setting Button
    Click First Assessment Category Action    update
    Wait Until Page Contains Element    ${EDIT_EVALUATE_TITLE} 

Verify Delete Course Schedule
    [Documentation]      TC_DCI_12
    [Tags]         Thu Phuong        Details Course 
    Go To Course Page
    Click View Course Button  
    Click Setting Button
    Click First Assessment Category Action     delete 
    Wait Until Page Contains Element    ${ERROR_DELETE_TITLE}

Verify Open Add New Evaluate Page 
    [Documentation]      TC_DCI_13
    [Tags]         Thu Phuong        Details Course 
    Go To Course Page
    Click View Course Button
    Click Add Assessment Button
    Wait Until Page Contains Element    ${ADD_EVALUATE_TITLE}

Verify Delete Exams Button
    [Documentation]      TC_DCI_15
    [Tags]         Thu Phuong        Details Course 
    Go To Course Page
    Click View Course Button 
    Click Setting Button
    Click First Assessment Category Action     delete 
    Page Should Contain Button     Delete 

Verify Open Create New Class Page By click TLH
    [Documentation]      TC_DCI_16
    [Tags]         Thu Phuong        Details Course 
    Go To Course Page
    Click View Course Button 
    Click Add Class Button 
    Wait Until Element Is Visible    ${CREATE_CLASS_TITLE}
