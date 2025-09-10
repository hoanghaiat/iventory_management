*** Settings ***

Library    SeleniumLibrary
Library    CustomLibrary
Library    XML
Variables  ../Variables/locator.py

*** Keywords ***
Open Browser And Login
    Open Browser    ${BASE_LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    id=id_username    10s
    Input Text    id=id_username    ${USERNAME}
    Input Text    id=id_password    ${PASSWORD}
    Click Button    ${LOGIN_BTN}
    Wait Until Element Is Visible    ${MENU_COURSE}    15s

Go To Course Page
    Click Element    ${TAB}
    Wait Until Element Is Visible    ${MENU_COURSE}    10s
    Click Element    ${MENU_COURSE}
    Wait Until Element Is Visible    ${SEARCH_BOX}    10s
    Wait Until Element Is Visible    ${COURSES_TABLE_ROWSS}    10s

Get First Course Name
    ${name}=    Get Text    ${FIRST_COURSE_NAME_CELL}
    [Return]    ${name}


Click First Edit Courses Button 
   Wait Until Page Contains Element    ${EDIT_COURSE}         10s 
   Wait Until Element Is Visible    ${EDIT_COURSE}       10s
   Wait Until Element Is Enabled    ${EDIT_COURSE}       10s
   Scroll Element Into View    ${EDIT_COURSE}        
   Click Element     ${EDIT_COURSE}
    Wait Until Element Is Visible    ${EDIT_COURSE_TITLE}    10s   

Click Choose Program Drop 
    Wait Until Element Is Visible  ${PROGRAM_DROP}
    Wait Until Element Is Enabled    ${PROGRAM_DROP}
    Click Element    ${PROGRAM_OPT} 

Click Choose Type Drop
    Wait Until Element Is Visible  ${TYPE_DROP}
    Wait Until Element Is Enabled    ${TYPE_DROP}
    Click Element    ${TYPE_OPT}
Click Choose Status Drop
    Wait Until Element Is Visible  ${STATUS_DROP}
    Wait Until Element Is Enabled    ${STATUS_DROP}
    Click Element    ${STATUS_DROP}

Click Choose Prerequisite 
   Wait Until Element Is Visible  ${PREREQUISITE_COURSE_DROP}
    Wait Until Element Is Enabled    ${PREREQUISITE_COURSE_DROP}
    Click Element    ${PREREQUISITE_COURSE_OPT}
 
Click Update Course Button
    Wait Until Element Is Visible    ${UPDATE_COURSE_BTN}        20s
    Scroll Element Into View    ${UPDATE_COURSE_BTN}           
    Wait Until Element Is Enabled    ${UPDATE_COURSE_BTN}         30s
    Wait Until Page Does Not Contain Element    ${LOADING}    20s
    Wait Until Page Does Not Contain Element    xpath=//div[contains(@class,'toast')]      
    Click Element    ${UPDATE_COURSE_BTN}

Verify Success Message And Course Update 
    # Wait Until Location Contains       ${URL_DETAIL_COURSE}     20S 
    Wait Until Page Contains Element    ${SUCCESS_UPDATE_MESSAGE}    20s
    
Verify Error Update Message For Required Fields
    [Arguments]    ${field_key}
    ${locator}=    Set Variable    ${ERROR_UPDATE_MESSAGES}[${field_key}]
    Wait Until Element Contains    ${locator}    This field is required    10s
    Element Should Contain    ${locator}    This field is required
    Log    Error message displayed for ${field_key} : This field is required

Fill Course With Valid Data
    [Arguments]     ${program}   ${course_code}   ${course_name}    ${credit}   ${description}   ${type}   ${status}   ${prerequisite}
    
    Wait Until Element Is Visible    ${COURSE_CODE_FIELD}      5s 
    Clear Element Text    ${COURSE_CODE_FIELD}
    Input Text    ${COURSE_CODE_FIELD}   ${course_code}

    Click Choose Program Drop

    Clear Element Text    ${COURSE_NAME_FILED}
    Input Text           ${COURSE_NAME_FILED}   ${course_name}

    Clear Element Text     ${CREDIT_FIELD}
    Input Text    ${CREDIT_FIELD}    ${credit}

    Clear Element Text       ${DESCRIPTION_FIELD}
    Input Text    ${DESCRIPTION_FIELD}        ${description}

    Click Choose Type Drop 
    Click Choose Status Drop
    Click Choose Prerequisite 

Fill Course With Empty Program Field
    [Arguments]     ${course_code}   ${course_name}    ${credit}   ${description}   ${type}   ${status}   ${prerequisite}
    
    Wait Until Element Is Visible    ${COURSE_CODE_FIELD}    5s
    Clear Element Text    ${COURSE_CODE_FIELD}
    Input Text    ${COURSE_CODE_FIELD}   ${course_code}

    # Chọn option trống cho Program
    Wait Until Element Is Visible    ${PROGRAM_DROP}
    Select From List By Index    ${PROGRAM_DROP}    0  

    Clear Element Text    ${COURSE_NAME_FILED}
    Input Text    ${COURSE_NAME_FILED}   ${course_name}

    Clear Element Text    ${CREDIT_FIELD}
    Input Text    ${CREDIT_FIELD}    ${credit}

    Clear Element Text    ${DESCRIPTION_FIELD}
    Input Text    ${DESCRIPTION_FIELD}    ${description}

    Click Choose Type Drop
    Click Choose Status Drop
    Click Choose Prerequisite

Fill Course With Empty Course Code 
    [Arguments]     ${program}     ${course_name}    ${credit}   ${description}   ${type}   ${status}   ${prerequisite}
    
    Wait Until Element Is Visible    ${COURSE_CODE_FIELD}      5s 
    Clear Element Text    ${COURSE_CODE_FIELD}

    Click Choose Program Drop

    Clear Element Text    ${COURSE_NAME_FILED}
    Input Text           ${COURSE_NAME_FILED}   ${course_name}

    Clear Element Text     ${CREDIT_FIELD}
    Input Text    ${CREDIT_FIELD}    ${credit}

    Clear Element Text       ${DESCRIPTION_FIELD}
    Input Text    ${DESCRIPTION_FIELD}        ${description}

    Click Choose Type Drop
    Click Choose status Drop
    Click Choose Status Drop
    Click Choose Prerequisite

Fill Course With Empty Course Name 
    [Arguments]     ${program}   ${course_code}    ${credit}   ${description}   ${type}   ${status}   ${prerequisite}
    
    Wait Until Element Is Visible    ${COURSE_CODE_FIELD}      5s 
    Clear Element Text    ${COURSE_CODE_FIELD}
    Input Text    ${COURSE_CODE_FIELD}   ${course_code}

    Click Choose Program Drop

    Clear Element Text    ${COURSE_NAME_FILED}

    Clear Element Text     ${CREDIT_FIELD}
    Input Text    ${CREDIT_FIELD}    ${credit}

    Clear Element Text       ${DESCRIPTION_FIELD}
    Input Text    ${DESCRIPTION_FIELD}        ${description}

    Click Choose Type Drop
    Click Choose status Drop
    Click Choose Status Drop
    Click Choose Prerequisite

Fill Course With Empty Credit 
    [Arguments]     ${program}   ${course_code}   ${course_name}     ${description}   ${type}   ${status}   ${prerequisite}
    
    Wait Until Element Is Visible    ${COURSE_CODE_FIELD}      5s 
    Clear Element Text    ${COURSE_CODE_FIELD}
    Input Text    ${COURSE_CODE_FIELD}   ${course_code}

    Click Choose Program Drop

    Clear Element Text    ${COURSE_NAME_FILED}
    Input Text           ${COURSE_NAME_FILED}   ${course_name}

    Clear Element Text     ${CREDIT_FIELD}

    Clear Element Text       ${DESCRIPTION_FIELD}
    Input Text    ${DESCRIPTION_FIELD}        ${description}

    Click Choose Type Drop
    Click Choose status Drop
    Click Choose Status Drop
    Click Choose Prerequisite

Fill Course With Empty Description
    [Arguments]     ${program}   ${course_code}   ${course_name}    ${credit}   ${type}   ${status}   ${prerequisite}
    
    Wait Until Element Is Visible    ${COURSE_CODE_FIELD}      5s 
    Clear Element Text    ${COURSE_CODE_FIELD}
    Input Text    ${COURSE_CODE_FIELD}   ${course_code}

    Click Choose Program Drop

    Clear Element Text    ${COURSE_NAME_FILED}
    Input Text           ${COURSE_NAME_FILED}   ${course_name}

    Clear Element Text     ${CREDIT_FIELD}
    Input Text    ${CREDIT_FIELD}    ${credit}

    Clear Element Text       ${DESCRIPTION_FIELD}

    Click Choose Type Drop
    Click Choose status Drop
    Click Choose Status Drop
    Click Choose Prerequisite

