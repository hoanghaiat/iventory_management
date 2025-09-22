*** Settings ***
Library    SeleniumLibrary    run_on_failure=No Operation
Library      CustomLibrary
Variables     ../Variables/locator.py
Resource      ../Resources/clos_university.resource 
Resource    ../Resources/common.resource

Suite Setup    Open Browser To Login Page
Test Setup       Go To Course Page And Click View Clo Button
Test Teardown    Close All Browsers
Suite Teardown    Close All Browsers

*** Test Cases *** 
Verify Open Create Page Successfully 
   [Documentation]      TC_AC_12 
   [Tags]             Thu Phuong     Add CLOs  
    Click Add Clos Button
    Wait Until Page Contains Element    ${CLO_CREATE_TITLE} 
Verify Open Home Page Successfully
    [Documentation]      TC_AC_13
    [Tags]               Thu Phuong     Add CLOs  
    Click Add Clos Button
    Click Home Link 
Verify Open Back Clos Page Successfully 
    [Documentation]      TC_AC_11
    [Tags]               Thu Phuong     Add CLOs  
    Click Add Clos Button
    Click Back To CLOs 
Verify User Can Create LOs Successfully
    [Documentation]      TC_AC_00
    [Tags]               Thu Phuong     Add CLOs  
    Click Add Clos Button
    Wait Until Element Is Visible    ${CLO_CREATE_TITLE}
Verify User Can Create CLO Successfully
    [Documentation]    TC_AC_01
    [Tags]         Thu Phuong     Add CLOs  
    Click Add Clos Button
    Fill CLOs With Valid Data     DSA201 - Cấu trúc dữ liệu và giải thuật    CLO01    Đây là CLO test    Knowledge    Understand    0    Exam
    Click Create CLO Button
    Wait Until Element Is Visible    ${SUCCESS_CLO_MESSAGE}    10s
    Page Should Contain Element      ${SUCCESS_CLO_MESSAGE}  
Verify User Cann't Create CLO With Empty Course Fields 
    [Documentation]    TC_AC_14
    [Tags]         Thu Phuong     Add CLOs  
    Click Add Clos Button
    Fill CLOs With Valid Data     ${EMPTY}    CLO01    Đây là CLO test    Knowledge    Understand    0.2    Exam
    Click Create CLO Button
    Verify Error Create CLO Message For Required Fields       course

 Verify User Cann't Create CLO With Empty Clo Code Fields 
    [Documentation]    TC_AC_02
    [Tags]         Thu Phuong     Add CLOs  
    Click Add Clos Button
    Fill CLOs With Valid Data     DSA201 - Cấu trúc dữ liệu và giải thuật    ${EMPTY}    Đây là CLO test    Knowledge    Understand    0.2    Exam
    Click Create CLO Button
    Verify Error Create CLO Message For Required Fields    clo code
Verify User Cann't Create CLO With Empty Description Fields 
    [Documentation]    TC_AC_03
    [Tags]         Thu Phuong     Add CLOs  
    Click Add Clos Button
    Fill CLOs With Valid Data     DSA201 - Cấu trúc dữ liệu và giải thuật    CLO01    ${EMPTY}    Knowledge    Understand    0.1    Exam
    Click Create CLO Button
    Verify Error Create CLO Message For Required Fields    description 
 Verify User Cann't Create CLO With Empty Category Fields 
    [Documentation]    TC_AC_04
    [Tags]         Thu Phuong     Add CLOs  
    Click Add Clos Button
    Fill CLOs With Valid Data     DSA201 - Cấu trúc dữ liệu và giải thuật    CLO01    Đây là CLO test    ${EMPTY}     Understand    0.1    Exam
    Click Create CLO Button
    Verify Error Create CLO Message For Required Fields    category
 Verify User Cann't Create CLO With Empty Level Fields 
    [Documentation]    TC_AC_16
    [Tags]         Thu Phuong     Add CLOs  
    Click Add Clos Button
    Fill CLOs With Valid Data     DSA201 - Cấu trúc dữ liệu và giải thuật    CLO01    Đây là CLO test    Knowledge    ${EMPTY}     0.1    Exam
    Click Create CLO Button
    Verify Error Create CLO Message For Required Fields    level 
 Verify User Cann't Create CLO With Empty Weight Fields 
    [Documentation]    TC_AC_17
    [Tags]         Thu Phuong     Add CLOs  
    Click Add Clos Button
    Fill CLOs With Valid Data     DSA201 - Cấu trúc dữ liệu và giải thuật    CLO01    Đây là CLO test    Knowledge    Understand     ${EMPTY}    Exam
    Click Create CLO Button
    Verify Error Create CLO Message For Required Fields    weight
 Verify User Cann't Create CLO With Empty Assessment Method Fields 
    [Documentation]    TC_AC_18
    [Tags]         Thu Phuong     Add CLOs  
    Click Add Clos Button
    Fill CLOs With Valid Data     DSA201 - Cấu trúc dữ liệu và giải thuật    CLO01    Đây là CLO test    Knowledge    Understand    0.1    ${EMPTY} 
    Click Create CLO Button
    Verify Error Create CLO Message For Required Fields    assessment method
Verify Negative Value In The Weight Field
    [Documentation]    TC_AC_05
    [Tags]         Thu Phuong     Add CLOs  
    Click Add Clos Button
    Fill CLOs With Valid Data     DSA201 - Cấu trúc dữ liệu và giải thuật    CLO01    Đây là CLO test    Knowledge    Understand    -0.2    Exam
    Click Create CLO Button
    Verify Error Negative Message
Verify Over 5 Digits In The Weight Field
    [Documentation]    TC_AC_06
    [Tags]         Thu Phuong     Add CLOs  
    Click Add Clos Button
    Fill CLOs With Valid Data     DSA201 - Cấu trúc dữ liệu và giải thuật    CLO01    Đây là CLO test    Knowledge    Understand    555555    Exam
    Click Create CLO Button
    Verify Warning Message
Verify All Fields Empty 
    [Documentation]    TC_AC_07
    [Tags]         Thu Phuong     Add CLOs  
    Click Add Clos Button
    Fill CLOs With Valid Data     ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}   ${EMPTY}    ${EMPTY}
    Click Create CLO Button
    Verify Error Create CLO Message For Required Fields    course  

Verify Fill CLO Code With CLO COde Already Exists 
   [Documentation]    TC_AC_08
    [Tags]         Thu Phuong     Add CLOs  
    Click Add Clos Button
    Fill CLOs With Valid Data     DSA201 - Cấu trúc dữ liệu và giải thuật    CLO01    Đây là CLO test    Knowledge    Understand    0    Exam
    Click Create CLO Button
    Error Message With Special Character 

Verify Fill CLO Code With Special Character 
   [Documentation]    TC_AC_09
    [Tags]         Thu Phuong     Add CLOs  
    Click Add Clos Button
    Fill CLOs With Valid Data     DSA201 - Cấu trúc dữ liệu và giải thuật    CLO@#$    Đây là CLO test    Knowledge    Understand    0    Exam
    Click Create CLO Button
    Error Message With Special Character     

# SEARCH 
Search By Exact CLO Code 
   [Documentation]      TC_SC_01
   [Tags]             Thu Phuong     SEARCH CLOs  
    Perform And Click Search Button In CLO    CL001
    Verify Search Result Exists In CLO    CL001 
Search With Non_existing Value 
   [Documentation]      TC_SC_02
   [Tags]             Thu Phuong     SEARCH CLOs  
    Perform And Click Search Button In CLO    aaaaaaaab
    Verify Search No CLO Result
Search By Full Description 
   [Documentation]      TC_SC_03 
   [Tags]             Thu Phuong     SEARCH CLOs  
    Perform And Click Search Button In CLO    Course goal for Block chain
    Verify Search Result Exists In CLO    Course goal for Block chain
 Search By Particial CLO 
   [Documentation]      TC_SC_04 
   [Tags]             Thu Phuong     SEARCH CLOs  
    Perform And Click Search Button In CLO    CLO
    Verify Search Result Exists In CLO    CLO 
Search With Empty Input Search CLO Box 
    [Documentation]     TC_SC_05
    [Tags]           Thu Phuong   SEARCH CLOs  
    Click Element    ${SEARCH_BOX} 
    Wait Until Element Is Visible    ${RESULT_TABLE}
 Search By Keyword In Description 
   [Documentation]      TC_SC_06
   [Tags]             Thu Phuong     SEARCH CLOs  
    Perform And Click Search Button In CLO    block
    Verify Search Result Exists In CLO    block 
 Search By Special Keywords CLO 
   [Documentation]      TC_SC_07 
   [Tags]             Thu Phuong     SEARCH CLOs  
    Perform And Click Search Button In CLO    @####
    Verify Search No CLO Result 
Search Case Sensitivity Test 
    [Documentation]      TC_SC_08 
    [Tags]          Thu Phuong        SEARCH CLOs
    Perform And Click Search Button In CLO    cl001
    Verify Search Result Exists In CLO    cl001


Verify Open Edit CLo Page Successfully 
   [Documentation]      TC_EC_01 
   [Tags]             Thu Phuong     Edit CLOs 
    Click Edit CLOs Button
    Wait Until Page Contains Element    ${CLO_TITLE} 
Verify User Can Update CLOs Successfully
   [Documentation]      TC_EC_02
   [Tags]             Thu Phuong     Edit CLOs 
    Click Edit CLOs Button
    Fill Update CLO With Valid Data    DSA201 - Cấu trúc dữ liệu và giải thuật    CLO01_AUTO    Đây là CLO test    knowledge    understand    0.01    exam
    Click Update Clo Button
    Verify successfully Message And Update CLO 
Verify Update CLOs With Empty Course Fields 
   [Documentation]      TC_EC_03
   [Tags]             Thu Phuong     Edit CLOs
    Click Edit CLOs Button
    Fill Update CLO With Valid Data    ${EMPTY}    CLO01_AUTO    Đây là CLO test    knowledge    understand    0.1    exam
    Click Update Clo Button
    Verify Error Update CLO Message    course
    
   
Verify Update CLOs With Empty CLO Code Fields 
   [Documentation]      TC_EC_04
   [Tags]             Thu Phuong     Edit CLOs
    Click Edit CLOs Button
    Fill Update CLO With Valid Data    DSA201 - Cấu trúc dữ liệu và giải thuật     ${EMPTY}     Đây là CLO test    knowledge    understand    0.01    exam
    Click Update Clo Button
    Verify Error Update CLO Message    clo code

Verify Update CLOs With Empty Description Field
   [Documentation]      TC_EC_05
   [Tags]             Thu Phuong     Edit CLOs
    Click Edit CLOs Button
    Fill Update CLO With Valid Data    DSA201 - Cấu trúc dữ liệu và giải thuật    CLO01_AUTO     ${EMPTY}     knowledge    understand    0.01    exam
    Click Update Clo Button
    Verify Error Update CLO Message    description
Verify Update CLOs With Empty Category Fields 
   [Documentation]      TC_EC_06
   [Tags]             Thu Phuong     Edit CLOs
    Click Edit CLOs Button
    Fill Update CLO With Valid Data    DSA201 - Cấu trúc dữ liệu và giải thuật    CLO01_AUTO    Đây là CLO test     ${EMPTY}     understand    0.01    exam
    Click Update Clo Button
    Verify Error Update CLO Message    category 

Verify Update CLOs With Empty Level Fields 
   [Documentation]      TC_EC_07
   [Tags]             Thu Phuong     Edit CLOs
    Click Edit CLOs Button
    Fill Update CLO With Valid Data    DSA201 - Cấu trúc dữ liệu và giải thuật    CLO01_AUTO    Đây là CLO test    knowledge     ${EMPTY}     0.01    exam
    Click Update Clo Button
    Verify Error Update CLO Message    level

Verify Update CLOs With Empty Assessment Method Fields 
   [Documentation]      TC_EC_08
   [Tags]             Thu Phuong     Edit CLOs
    Click Edit CLOs Button
    Fill Update CLO With Valid Data    DSA201 - Cấu trúc dữ liệu và giải thuật    CLO01_AUTO    Đây là CLO test    knowledge    understand     ${EMPTY}     exam
    Click Update Clo Button
    Verify Error Update CLO Message    assessment method

Verify Update CLOs With Empty Weight Fields 
   [Documentation]      TC_EC_09
   [Tags]             Thu Phuong     Edit CLOs
    Click Edit CLOs Button
    Fill Update CLO With Valid Data    DSA201 - Cấu trúc dữ liệu và giải thuật    CLO01_AUTO    Đây là CLO test    knowledge    understand    0.01     ${EMPTY} 
    Click Update Clo Button
    Verify Error Update CLO Message    weight
Verify Update CLOs With Invalid Weight Fields 
   [Documentation]      TC_EC_11
   [Tags]             Thu Phuong     Edit CLOs
    Click Edit CLOs Button
    Fill Update CLO With Valid Data    DSA201 - Cấu trúc dữ liệu và giải thuật    CLO01_AUTO    Đây là CLO test    knowledge    understand    150     exam
    Click Update Clo Button
    Error Invalid Message 

Verify Update CLOs With Invalid Negative Weight Fields 
   [Documentation]      TC_EC_10
   [Tags]             Thu Phuong     Edit CLOs
    Click Edit CLOs Button
    Fill Update CLO With Valid Data    DSA201 - Cấu trúc dữ liệu và giải thuật    CLO01_AUTO    Đây là CLO test    knowledge    understand    -0.01     exam
    Click Update Clo Button
    Error Invalid Message CLO
 Verify Update CLOs With Valid Weight With Dot Format  
   [Documentation]      TC_EC_12
   [Tags]             Thu Phuong     Edit CLOs
    Click Edit CLOs Button
    Fill Update CLO With Valid Data    DSA201 - Cấu trúc dữ liệu và giải thuật    CLO01_AUTO    Đây là CLO test    knowledge    understand    0,01     exam
    Click Update Clo Button
    Verify successfully Message And Update CLO

 Verify Update CLOs With Exist Value  
   [Documentation]      TC_EC_13
   [Tags]             Thu Phuong     Edit CLOs
    Click Edit CLOs Button
    Click Update Clo Button
    Page Should Contain    No changes detected

Verify Open CLO Details Page 
   [Documentation]      TC_EC_14
   [Tags]             Thu Phuong     Edit CLOs
    Click Edit CLOs Button
    Click Back To CLO Button

Verify Open Home Page 
   [Documentation]      TC_EC_15
   [Tags]             Thu Phuong     Edit CLOs
    Click Edit CLOs Button 
    Click Home Link


Verify Open View CLo Page Successfully 
   [Documentation]      TC_DC_01
   [Tags]             Thu Phuong      CLOs Detail
    Click View CLOs Button
    Wait Until Page Contains Element    ${CLO_TITLE} 
Verify Open Subject Or Course Page
   [Documentation]      TC_DC_02
   [Tags]             Thu Phuong      CLOs Detail
    Click View CLOs Button
    Click CLO ID Link 
Verify Open Edit CLO Successfully
    [Documentation]      TC_DC_03
   [Tags]             Thu Phuong      CLOs Detail
    Click View CLOs Button
    Click Edit CLOs Button
    Wait Until Page Contains Element    ${CLO_TITLE} 

Verify Open PLO Page Successfully
    [Documentation]      TC_DC_04
   [Tags]             Thu Phuong      CLOs Detail
    Click View CLOs Button
    Click PLO Mapping Button
    Wait Until Page Contains Element    ${PLO_TITLE}
Verify Open CLOs Page Successfully 
    [Documentation]      TC_DC_06
    [Tags]             Thu Phuong      CLOs Detail
    Click View CLOs Button
    Click Back To CLO Button
Verify Open Map CLO to PLO Page 
    [Documentation]      TC_DC_05
    [Tags]             Thu Phuong      CLOs 
    Click View CLOs Button
    Click Add Mapping Button
Verify Open Map CLO to PLO Page by click Create One Link 
    [Documentation]      TC_DC_07
    [Tags]             Thu Phuong      CLOs 
    Click View CLOs Button
    Click Create One Link
Verify Open Map CLO to PLO Page By Click PLO Button 
    [Documentation]    TC_PLO_01
    [Tags]             Thu Phuong      PLO 
    Click PLO Mapping Button 
    Wait Until Element Is Visible    ${PLO_TITLE} 
Verify Open Dashboard Program PAge Successfully
    [Documentation]    TC_PLO_02
    [Tags]             Thu Phuong      PLO 
    Click PLO Mapping Button 
    Click Home Link
    
Verify Create PLo With Valid Data
    [Documentation]    TC_PLO_03
    [Tags]             Thu Phuong      PLO 
    Click PLO Mapping Button
    Fill PLO With Valid Data
    Click Create Mapping Level Button
    Wait Until Page Contains Element    ${CLO_TITLE}
    
Verify Create PLo With Missing PLO Field
    [Documentation]    TC_PLO_04
    [Tags]             Thu Phuong      PLO 
    Click PLO Mapping Button 
    Fill PLO With Missing PLO Field
    Click Create Mapping Level Button 
    Verify Error Create PLO Message     plo
 Verify Create PLo With Mapping Level Field
    [Documentation]    TC_PLO_05
    [Tags]             Thu Phuong      PLO 
    Click PLO Mapping Button 
    Fill PLO With Missing Mapping Level Field
    Click Create Mapping Level Button
    Verify Error Create PLO Message    mapping
Verify Create PLO WIth Mising All Fields
    [Documentation]    TC_PLO_06
    [Tags]             Thu Phuong      PLO 
    Click PLO Mapping Button 
     Fill PLO With Missing All Fields
    Click Create Mapping Level Button
    Verify Error Create PLO Message    plo
    
