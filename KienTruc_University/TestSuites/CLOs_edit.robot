
*** Settings ***

Library      SeleniumLibrary
Library      CustomLibrary
Variables     ../Variables/locator.py
Resource      ../Resources/CLOs_edit.resource 


Test Setup       Open Browser And Login
Test Teardown    Close Browser

*** Test Cases *** 
Verify Open Edit CLo Page Successfully 
   [Documentation]      TC_EC_01 
   [Tags]             Thu Phuong     Edit CLOs 
    Go To Course Page
    Click First View CLO Button
    Click Edit CLOs Button
    Wait Until Page Contains Element    ${CLO_TITLE} 
Verify User Can Update CLOs Successfully
   [Documentation]      TC_EC_02
   [Tags]             Thu Phuong     Edit CLOs 
    Go To Course Page
    Click First View CLO Button
    Click Edit CLOs Button
     Fill Update CLO With Valid Data
    Click Update Clo Button
    Verify successfully Message And Update CLO 
Verify Update CLOs With Empty Course Fields 
   [Documentation]      TC_EC_03
   [Tags]             Thu Phuong     Edit CLOs
    Go To Course Page
    Click First View CLO Button
    Click Edit CLOs Button
    Fill Update CLO With Empty Course Fields 
    Click Update Clo Button
    Verify Error Update CLO Message    course
    
   
Verify Update CLOs With Empty CLO Code Fields 
   [Documentation]      TC_EC_04
   [Tags]             Thu Phuong     Edit CLOs
    Go To Course Page
    Click First View CLO Button
    Click Edit CLOs Button
    Fill Update CLO With Empty Clo Code Fields 
    Click Update Clo Button
    Verify Error Update CLO Message    clo code

Verify Update CLOs With Empty Description Field
   [Documentation]      TC_EC_05
   [Tags]             Thu Phuong     Edit CLOs
    Go To Course Page
    Click First View CLO Button
    Click Edit CLOs Button
    Fill Update CLO With Empty Description Fields  
    Click Update Clo Button
    Verify Error Update CLO Message    description
Verify Update CLOs With Empty Category Fields 
   [Documentation]      TC_EC_06
   [Tags]             Thu Phuong     Edit CLOs
    Go To Course Page
    Click First View CLO Button
    Click Edit CLOs Button
    Fill Update CLO With Empty Category Fields 
    Click Update Clo Button
    Verify Error Update CLO Message    category 

Verify Update CLOs With Empty Level Fields 
   [Documentation]      TC_EC_07
   [Tags]             Thu Phuong     Edit CLOs
    Go To Course Page
    Click First View CLO Button
    Click Edit CLOs Button
    Fill Update CLO With Empty Level Fields 
    Click Update Clo Button
    Verify Error Update CLO Message    level

Verify Update CLOs With Empty Assessment Method Fields 
   [Documentation]      TC_EC_08
   [Tags]             Thu Phuong     Edit CLOs
    Go To Course Page
    Click First View CLO Button
    Click Edit CLOs Button
    Fill Update CLO With Empty Assessment Method Fields 
    Click Update Clo Button
    Verify Error Update CLO Message    assessment method

Verify Update CLOs With Empty Weight Fields 
   [Documentation]      TC_EC_09
   [Tags]             Thu Phuong     Edit CLOs
    Go To Course Page
    Click First View CLO Button
    Click Edit CLOs Button
    Fill Update CLO With Empty Weight Fields 
    Click Update Clo Button
    Verify Error Update CLO Message    weight
Verify Update CLOs With Invalid Weight Fields 
   [Documentation]      TC_EC_11
   [Tags]             Thu Phuong     Edit CLOs
    Go To Course Page
    Click First View CLO Button
    Click Edit CLOs Button
    Fill Update CLO With Invalid Weight
    Click Update Clo Button
    Error Invalid Message 

Verify Update CLOs With Invalid Negative Weight Fields 
   [Documentation]      TC_EC_10
   [Tags]             Thu Phuong     Edit CLOs
    Go To Course Page
    Click First View CLO Button
    Click Edit CLOs Button
    Fill Update CLO With Invalid Negative Weight
    Click Update Clo Button
    Error Invalid Message CLO
 Verify Update CLOs With Valid Weight With Dot Format  
   [Documentation]      TC_EC_12
   [Tags]             Thu Phuong     Edit CLOs
    Go To Course Page
    Click First View CLO Button
    Click Edit CLOs Button
    Fill Update CLO With Dot Format
    Click Update Clo Button
    Verify successfully Message And Update CLO

 Verify Update CLOs With Exist Value  
   [Documentation]      TC_EC_13
   [Tags]             Thu Phuong     Edit CLOs
    Go To Course Page
    Click First View CLO Button
    Click Edit CLOs Button
    Click Update Clo Button
    Page Should Contain    No changes detected


Verify Open CLO Details Page 
   [Documentation]      TC_EC_14
   [Tags]             Thu Phuong     Edit CLOs
    Go To Course Page
    Click First View CLO Button
    Click Edit CLOs Button
    Click Back To CLO Button

Verify Open Home Page 
   [Documentation]      TC_EC_15
   [Tags]             Thu Phuong     Edit CLOs
    Go To Course Page
    Click First View CLO Button
    Click Edit CLOs Button 
    Click Home Link


