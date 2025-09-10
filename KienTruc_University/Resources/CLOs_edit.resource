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

Click Update Clo Button 
    Wait Until Element Is Visible    ${UPDATE_CLO_BTN}   10s
    Wait Until Element Is Enabled    ${UPDATE_CLO_BTN}     10s 
    Scroll Element Into View    ${UPDATE_CLO_BTN}
    Click Element    ${UPDATE_CLO_BTN}
    Wait Until Page Contains Element    ${CLO_TITLE} 
Verify successfully Message And Update CLO 
    Wait Until Page Contains Element    ${UPDATE_CLO_SUCCESS_MES}    10s 
    Wait Until Element Is Visible    ${UPDATE_CLO_SUCCESS_MES}      10s 

Verify Error Update CLO Message
    [Arguments]    ${field_key}
    ${locator}=    Set Variable    ${ERROR_CREATE_CLO_MESSAGES}[${field_key}]
    Wait Until Element Contains    ${locator}    This field is required    10s
    Element Should Contain    ${locator}    This field is required
    Log    Error message displayed for ${field_key} : This field is required
Error Invalid Message
    Wait Until Element Is Visible    ${ERROR_INVALID_MESS}    10s
Error Invalid Message CLO 
    Page Should Contain    weight must be positive
Click Back To CLO Button 
    Wait Until Element Is Visible    ${BACK_TO_CLOS}     10s   
    Scroll Element Into View    ${BACK_TO_CLOS} 
    Wait Until Element Is Enabled    ${BACK_TO_CLOS}      10s
    Click Element    ${BACK_TO_CLOS}
    Wait Until Page Contains Element    ${CLO_TITLE}
Click Home Link 
    Wait Until Element Is Visible    ${HOME_URL}     10s   
    Scroll Element Into View    ${HOME_URL}
  
    Click Element    ${HOME_URL}
    Wait Until Page Contains Element    ${HOME_URL}

 Fill Update CLO With Valid Data 
    Wait Until Element Is Visible    ${CLO_CODE}    10s
    Clear Element Text               ${CLO_CODE}
    Input Text                       ${CLO_CODE}    CLO_AUTO_02
    Clear Element Text               ${DESCRIPTION_CLO}
    Input Text                       ${DESCRIPTION_CLO}    Đây là CLO Kiểm thử 
    Select From List By Value        ${COURSE_DROP}           42
    Select From List By Value        ${CATEGORY_CLO_DROP}     knowledge
    Select From List By Value        ${LEVEL_CLO_DROP}        apply
    Clear Element Text               ${WEIGHT_CLO}
    Input Text                       ${WEIGHT_CLO}           0.03
    Select From List By Value        ${ASSESSMENT_METHOD_DROP}    exam 

Fill Update CLO With Empty Course Fields
    Wait Until Element Is Visible    ${CLO_CODE}    10s
    Clear Element Text               ${CLO_CODE}
    Input Text                       ${CLO_CODE}    CLO_AUTO_02
    Clear Element Text               ${DESCRIPTION_CLO}
    Input Text                       ${DESCRIPTION_CLO}    Đây là CLO Kiểm thử 
    Select From List By Index  ${COURSE_DROP}           0
    Select From List By Value        ${CATEGORY_CLO_DROP}     knowledge
    Select From List By Value        ${LEVEL_CLO_DROP}        apply
    Clear Element Text               ${WEIGHT_CLO}
    Input Text                       ${WEIGHT_CLO}           0.03
    Select From List By Value        ${ASSESSMENT_METHOD_DROP}    exam

Fill Update CLO With Empty Clo Code Fields
   Wait Until Element Is Visible    ${CLO_CODE}    10s
    Clear Element Text               ${CLO_CODE}
    Clear Element Text               ${DESCRIPTION_CLO}
    Input Text                       ${DESCRIPTION_CLO}    Đây là CLO Kiểm thử 
    Select From List By Value        ${COURSE_DROP}           42
    Select From List By Value        ${CATEGORY_CLO_DROP}     knowledge
    Select From List By Value        ${LEVEL_CLO_DROP}        apply
    Clear Element Text               ${WEIGHT_CLO}
    Input Text                       ${WEIGHT_CLO}           0.03
    Select From List By Value        ${ASSESSMENT_METHOD_DROP}    exam
Fill Update CLO With Empty Description Fields
   Wait Until Element Is Visible    ${CLO_CODE}    10s
    Clear Element Text               ${CLO_CODE}
    Input Text                       ${CLO_CODE}    CLO_AUTO_02
    Clear Element Text               ${DESCRIPTION_CLO}
    Select From List By Value        ${COURSE_DROP}           42
    Select From List By Value        ${CATEGORY_CLO_DROP}     knowledge
    Select From List By Value        ${LEVEL_CLO_DROP}        apply
    Clear Element Text               ${WEIGHT_CLO}
    Input Text                       ${WEIGHT_CLO}           0.03
    Select From List By Value        ${ASSESSMENT_METHOD_DROP}    exam
Fill Update CLO With Empty Category Fields
   Wait Until Element Is Visible    ${CLO_CODE}    10s
    Clear Element Text               ${CLO_CODE}
    Input Text                       ${CLO_CODE}    CLO_AUTO_02
    Clear Element Text               ${DESCRIPTION_CLO}
    Input Text                       ${DESCRIPTION_CLO}    Đây là CLO Kiểm thử 
    Select From List By Value        ${COURSE_DROP}           42
    Select From List By Index        ${CATEGORY_CLO_DROP}     0
    Select From List By Value        ${LEVEL_CLO_DROP}        apply
    Clear Element Text               ${WEIGHT_CLO}
    Input Text                       ${WEIGHT_CLO}           0.03
    Select From List By Value        ${ASSESSMENT_METHOD_DROP}    exam
Fill Update CLO With Empty Level Fields
   Wait Until Element Is Visible    ${CLO_CODE}    10s
    Clear Element Text               ${CLO_CODE}
    Input Text                       ${CLO_CODE}    CLO_AUTO_02
    Clear Element Text               ${DESCRIPTION_CLO}
    Input Text                       ${DESCRIPTION_CLO}    Đây là CLO Kiểm thử 
    Select From List By Value        ${COURSE_DROP}           42
    Select From List By Value        ${CATEGORY_CLO_DROP}     knowledge
    Select From List By Index        ${LEVEL_CLO_DROP}        0
    Clear Element Text               ${WEIGHT_CLO}
    Input Text                       ${WEIGHT_CLO}           0.03
    Select From List By Value        ${ASSESSMENT_METHOD_DROP}    exam
Fill Update CLO With Empty Weight Fields
   Wait Until Element Is Visible    ${CLO_CODE}    10s
    Clear Element Text               ${CLO_CODE}
    Input Text                       ${CLO_CODE}    CLO_AUTO_02
    Clear Element Text               ${DESCRIPTION_CLO}
    Input Text                       ${DESCRIPTION_CLO}    Đây là CLO Kiểm thử 
    Select From List By Value        ${COURSE_DROP}           42
    Select From List By Value        ${CATEGORY_CLO_DROP}     knowledge
    Select From List By Value        ${LEVEL_CLO_DROP}        apply
    Clear Element Text               ${WEIGHT_CLO}
    Select From List By Value        ${ASSESSMENT_METHOD_DROP}    exam
Fill Update CLO With Empty Assessment Method Fields
   Wait Until Element Is Visible    ${CLO_CODE}    10s
    Clear Element Text               ${CLO_CODE}
    Input Text                       ${CLO_CODE}    CLO_AUTO_02
    Clear Element Text               ${DESCRIPTION_CLO}
    Input Text                       ${DESCRIPTION_CLO}    Đây là CLO Kiểm thử 
    Select From List By Value        ${COURSE_DROP}           42
    Select From List By Value        ${CATEGORY_CLO_DROP}     knowledge
    Select From List By Value        ${LEVEL_CLO_DROP}        apply
    Clear Element Text               ${WEIGHT_CLO}
    Input Text                       ${WEIGHT_CLO}           0.03
    Select From List By Index        ${ASSESSMENT_METHOD_DROP}    0

 Fill Update CLO With Invalid Weight
    Wait Until Element Is Visible    ${CLO_CODE}    10s
    Clear Element Text               ${CLO_CODE}
    Input Text                       ${CLO_CODE}    CLO_AUTO_02
    Clear Element Text               ${DESCRIPTION_CLO}
    Input Text                       ${DESCRIPTION_CLO}    Đây là CLO Kiểm thử 
    Select From List By Value        ${COURSE_DROP}           42
    Select From List By Value        ${CATEGORY_CLO_DROP}     knowledge
    Select From List By Value        ${LEVEL_CLO_DROP}        apply
    Clear Element Text               ${WEIGHT_CLO}
    Input Text                       ${WEIGHT_CLO}           150
    Select From List By Value        ${ASSESSMENT_METHOD_DROP}    exam

 Fill Update CLO With Invalid Negative Weight 
    Wait Until Element Is Visible    ${CLO_CODE}    10s
    Clear Element Text               ${CLO_CODE}
    Input Text                       ${CLO_CODE}    CLO_AUTO_02
    Clear Element Text               ${DESCRIPTION_CLO}
    Input Text                       ${DESCRIPTION_CLO}    Đây là CLO Kiểm thử 
    Select From List By Value        ${COURSE_DROP}           42
    Select From List By Value        ${CATEGORY_CLO_DROP}     knowledge
    Select From List By Value        ${LEVEL_CLO_DROP}        apply
    Clear Element Text               ${WEIGHT_CLO}
    Input Text                       ${WEIGHT_CLO}           -0.2
    Select From List By Value        ${ASSESSMENT_METHOD_DROP}    exam

 Fill Update CLO With Dot Format  
    Wait Until Element Is Visible    ${CLO_CODE}    10s
    Clear Element Text               ${CLO_CODE}
    Input Text                       ${CLO_CODE}    CLO_AUTO_02
    Clear Element Text               ${DESCRIPTION_CLO}
    Input Text                       ${DESCRIPTION_CLO}    Đây là CLO Kiểm thử 
    Select From List By Value        ${COURSE_DROP}           42
    Select From List By Value        ${CATEGORY_CLO_DROP}     knowledge
    Select From List By Value        ${LEVEL_CLO_DROP}        apply
    Clear Element Text               ${WEIGHT_CLO}
    Input Text                       ${WEIGHT_CLO}           0,03
    Select From List By Value        ${ASSESSMENT_METHOD_DROP}    exam