*** Settings ***
Library    SeleniumLibrary
Library    CustomLibrary
Library    String
Library    Collections
Variables  ../variables/locator.py


*** Keywords ***
Open Browser And Login
    Open Browser    ${BASE_LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    id=id_username    10s
    Input Text    id=id_username    ${USERNAME}
    Input Text    id=id_password    ${PASSWORD}
    Click Button    ${LOGIN_BTN}
    Wait Until Element Is Visible    ${MENU_COURSE}      

Go To Course Page
    Click Element    ${TAB}
    Wait Until Element Is Visible    ${MENU_COURSE}    10s
    Click Element    ${MENU_COURSE}
    Wait Until Element Is Visible    ${SEARCH_BOX}    10s
    Wait Until Element Is Visible    ${COURSES_TABLE_ROWSS}    10s
Get First Course Name
    ${name}=    Get Text    ${FIRST_COURSE_NAME_CELL}
    [Return]    ${name} 

Click First View CLO Button
   Wait Until Page Contains Element    ${VIEW_CLOC_BTN}         10s 
   Wait Until Element Is Visible    ${VIEW_CLOC_BTN}       10s
   Wait Until Element Is Enabled    ${VIEW_CLOC_BTN}       10s
   Click Element    ${VIEW_CLOC_BTN}
   Wait Until Element Is Visible    ${CLO_TITLE}

Click Edit CLOs Button
    [Documentation]    Click nút Edit của CLO đầu tiên trong danh sách
    ${edit_clo_locator}=    Set Variable    (//a[contains(@href, '/clos/') and contains(@href, '/update/')])[1]
    Wait Until Element Is Visible    ${edit_clo_locator}    10s
    Scroll Element Into View          ${edit_clo_locator}
    Click Element                     ${edit_clo_locator}
Click PLO Mapping Button
    [Documentation]    Click nút PLO Mapping của CLO đầu tiên trong danh sách
    ${plo_mapping_locator}=    Set Variable    (//a[contains(@href, '/plo-mapping/create/') and contains(@class, 'btn-success')])[1]
    Wait Until Element Is Visible    ${plo_mapping_locator}    10s
    Scroll Element Into View         ${plo_mapping_locator}
    Click Element                    ${plo_mapping_locator}

Click View CLOs Button
    [Documentation]    Click nút View của CLO đầu tiên trong danh sách
    ${view_clo_locator}=    Set Variable    (//a[contains(@href, '/clos/') and contains(@class, 'btn-info')])[1]
    Wait Until Element Is Visible    ${view_clo_locator}    10s
    Scroll Element Into View         ${view_clo_locator}
    Click Element                    ${view_clo_locator}
Click CLO ID Link 
    ${first_course}=    Set Variable    (//a[contains(@href,"/en/academics/courses/")])[1]
    Click Element       ${first_course}
    Page Should Contain Element   ${COURSE_TITLE}
Click Back To CLO Button 
    Wait Until Element Is Visible    ${BACK_TO_CLOS}     10s   
    Scroll Element Into View    ${BACK_TO_CLOS} 
    Wait Until Element Is Enabled    ${BACK_TO_CLOS}      10s
    Click Element    ${BACK_TO_CLOS}
    Wait Until Page Contains Element    ${CLO_TITLE} 
Click Add Mapping Button 
    Wait Until Element Is Visible    ${ADD_MAPPING_BTN}      30s
    Scroll Element Into View    ${ADD_MAPPING_BTN}
    Wait Until Element Is Enabled    ${ADD_MAPPING_BTN}      30s 
    Click Element    ${ADD_MAPPING_BTN}
    Wait Until Page Contains Element    ${PLO_TITLE}
Click Create One Link
    Wait Until Element Is Visible     ${CREATE_ONE_LINK}     10s
    Scroll Element Into View    ${CREATE_ONE_LINK}
    Wait Until Element Is Enabled    ${CREATE_ONE_LINK}     10s
    Click Element    ${CREATE_ONE_LINK}
    Wait Until Page Contains Element    ${PLO_TITLE}
Click Home Link 
     Wait Until Element Is Visible     ${HOME_URL}     10s
    Scroll Element Into View    ${HOME_URL}
    Wait Until Element Is Enabled    ${HOME_URL}     10s
    Click Element    ${HOME_URL}
Fill PLO With Valid Data 
    Wait Until Element Is Visible    ${PLO_DROP}   10s
    Select From List By Value    ${PLO_DROP}     8
    Select From List By Value    ${MAPPING_LEVEL_DROP}     medium

Fill PLO With Missing PLO Field
    Wait Until Element Is Visible    ${PLO_DROP}   10s
    Select From List By Index    ${PLO_DROP}    0 
    Select From List By Value    ${MAPPING_LEVEL_DROP}     medium
Fill PLO With Missing Mapping Level Field
    Wait Until Element Is Visible    ${PLO_DROP}   10s
    Select From List By Value    ${PLO_DROP}    8 
    Select From List By Index    ${MAPPING_LEVEL_DROP}     
 Fill PLO With Missing All Fields
    Wait Until Element Is Visible    ${PLO_DROP}   10s
    Select From List By Index    ${PLO_DROP}    0 
    Select From List By Index    ${MAPPING_LEVEL_DROP}     0

Click Create Mapping Level Button 
    Wait Until Element Is Visible    ${CREATE_MAPPING_BTN}    10s 
    Scroll Element Into View    ${CREATE_MAPPING_BTN}
    Wait Until Element Is Enabled    ${CREATE_MAPPING_BTN}    10s 
    Click Element    ${CREATE_MAPPING_BTN}
    Wait Until Page Contains Element    ${CLO_TITLE}
Verify Error Create PLO Message
    [Arguments]    ${field_key}
    ${locator}=    Set Variable    ${ERROR_CREATE_PLO_MESSAGES}[${field_key}]
    Wait Until Element Contains    ${locator}    This field is required    10s
    Element Should Contain    ${locator}    This field is required
    Log    Error message displayed for ${field_key} : This field is required

