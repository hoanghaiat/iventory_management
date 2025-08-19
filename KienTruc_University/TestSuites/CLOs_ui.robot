
*** Settings ***

Library      SeleniumLibrary
Library      CustomLibrary
Library    ../Resources/program_UI.resource
Variables     ../Variables/locator.py
Resource      ../Resources/CLOs_ui.resource 
Resource    ../Resources/student_profile.resource


Test Setup       Open Browser And Login
Test Teardown    Close Browser

*** Test Cases *** 
Verify Open Create Page Successfully 
   [Documentation]      TC_AC_12 
   [Tags]             Thu Phuong     Add CLOs 
    Go To Course Page
    Click First View CLO Button
    Click Add Clos Button
    Wait Until Page Contains Element    ${CLO_CREATE_TITLE} 
Verify Open Home Page Successfully
    [Documentation]      TC_AC_13
    [Tags]               Thu Phuong     Add CLOs  
    Go To Course Page
    Click First View CLO Button
    Click Add Clos Button
    Click Home Link 
Verify Open Back Clos Page Successfully 
    [Documentation]      TC_AC_11
    [Tags]               Thu Phuong     Add CLOs  
    Go To Course Page
    Click First View CLO Button
    Click Add Clos Button
    Click Back To CLOs 
Verify User Can Create LOs Successfully
    [Documentation]      TC_AC_00
    [Tags]               Thu Phuong     Add CLOs  
    Go To Course Page
    Click First View CLO Button
    Click Add Clos Button

Verify User Can Create CLO Successfully
    [Documentation]    TC_AC_01
    [Tags]         Thu Phuong     Add CLOs  
    Go To Course Page
    Click First View CLO Button
    Click Add Clos Button
    Fill CLOs Form With Valid Database
    Click Create CLO Button
    Wait Until Element Is Visible    ${SUCCESS_CLO_MESSAGE}    10s
    Page Should Contain Element      ${SUCCESS_CLO_MESSAGE}  
Verify User Cann't Create CLO With Empty Course Fields 
    [Documentation]    TC_AC_14
    [Tags]         Thu Phuong     Add CLOs  
    Go To Course Page
    Click First View CLO Button
    Click Add Clos Button
    Fill CLOs Form With Empty Course Field
    Click Create CLO Button
    Verify Error Create CLO Message For Required Fields       course

 Verify User Cann't Create CLO With Empty Clo Code Fields 
    [Documentation]    TC_AC_02
    [Tags]         Thu Phuong     Add CLOs  
    Go To Course Page
    Click First View CLO Button
    Click Add Clos Button
    Fill CLOs Form With Empty CLO Code
    Click Create CLO Button
    Verify Error Create CLO Message For Required Fields    clo code
Verify User Cann't Create CLO With Empty Description Fields 
    [Documentation]    TC_AC_03
    [Tags]         Thu Phuong     Add CLOs  
    Go To Course Page
    Click First View CLO Button
    Click Add Clos Button
    Fill CLOs Form With Empty Description
    Click Create CLO Button
    Verify Error Create CLO Message For Required Fields    description 
 Verify User Cann't Create CLO With Empty Category Fields 
    [Documentation]    TC_AC_04
    [Tags]         Thu Phuong     Add CLOs  
    Go To Course Page
    Click First View CLO Button
    Click Add Clos Button
    Fill CLOs Form With Empty Category
    Click Create CLO Button
    Verify Error Create CLO Message For Required Fields    category
 Verify User Cann't Create CLO With Empty Level Fields 
    [Documentation]    TC_AC_16
    [Tags]         Thu Phuong     Add CLOs  
    Go To Course Page
    Click First View CLO Button
    Click Add Clos Button
    Fill CLOs Form With Empty Level
    Click Create CLO Button
    Verify Error Create CLO Message For Required Fields    level 
 Verify User Cann't Create CLO With Empty Weight Fields 
    [Documentation]    TC_AC_17
    [Tags]         Thu Phuong     Add CLOs  
    Go To Course Page
    Click First View CLO Button
    Click Add Clos Button
    Fill CLOs Form With Empty Weight
    Click Create CLO Button
    Verify Error Create CLO Message For Required Fields    weight
 Verify User Cann't Create CLO With Empty Assessment Method Fields 
    [Documentation]    TC_AC_18
    [Tags]         Thu Phuong     Add CLOs  
    Go To Course Page
    Click First View CLO Button
    Click Add Clos Button
    Fill CLOs Form With Empty Assessment Method
    Click Create CLO Button
    Verify Error Create CLO Message For Required Fields    assessment method
Verify Negative Value In The Weight Field
    [Documentation]    TC_AC_05
    [Tags]         Thu Phuong     Add CLOs  
    Go To Course Page
    Click First View CLO Button
    Click Add Clos Button
    Fill CLOs Form With Empty Assessment Method
    Click Create CLO Button
    Verify Error Negative Message
Verify Over 5 Digits In The Weight Field
    [Documentation]    TC_AC_06
    [Tags]         Thu Phuong     Add CLOs  
    Go To Course Page
    Click First View CLO Button
    Click Add Clos Button
    Fill CLOs Form With 5 Digits In Weight Fields
    Click Create CLO Button
    Verify Warning Message
Verify All Fields Empty 
    [Documentation]    TC_AC_07
    [Tags]         Thu Phuong     Add CLOs  
    Go To Course Page
    Click First View CLO Button
    Click Add Clos Button
    Fill CLOs Form With Empty All Field
    Click Create CLO Button
    Verify Error Create CLO Message For Required Fields    course   

Verify Fill CLO Code With CLO COde Already Exists 
   [Documentation]    TC_AC_08
    [Tags]         Thu Phuong     Add CLOs  
    Go To Course Page
    Click First View CLO Button
    Click Add Clos Button
    Fill CLOs Form With CLO Code Already Exists
    Click Create CLO Button
    Error Message With Special Character    

Verify Fill CLO Code With Special Character 
   [Documentation]    TC_AC_09
    [Tags]         Thu Phuong     Add CLOs  
    Go To Course Page
    Click First View CLO Button
    Click Add Clos Button
    Fill CLOs Form With Special Character
    Click Create CLO Button
    Error Message With Special Character     


