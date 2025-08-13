*** Settings ***
Library    SeleniumLibrary
Library    CustomLibrary
Variables  ../variables/locator.py

*** Keywords ***
Open Browser And Login
    Open Browser    ${BASE_LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    id=id_username    10s
    Input Text    id=id_username    ${USERNAME}
    Input Text    id=id_password    ${PASSWORD}
    Click Button    xpath=//button[@type='submit']
    Wait Until Element Is Visible    ${MENU_COURSE}    15s

Go To Course Page
    Click Element    xpath=//*[@id="djHideToolBarButton"]
    Wait Until Element Is Visible    ${MENU_COURSE}    10s
    Click Element    ${MENU_COURSE}
    Wait Until Element Is Visible    ${SEARCH_BOX_PROGRAMS}    10s
    Wait Until Element Is Visible    ${COURSES_TABLE_ROWSS}    10s

Get First Course Name
    ${name}=    Get Text    ${FIRST_COURSE_NAME_CELL}
    [Return]    ${name}

Click Program Button In Course
    Click Element    ${PROGRAM_BUTTON}
    Wait Until Element Is Visible    ${PROGRAMS_PAGE_TITLE}
Click First View Courses Button
    Click Element    ${FIRST_COURSE_VIEW_BTN}
    Wait Until Element Is Visible    ${DEATAIL_COURSE_TABLE}    10s

Click First Edit Courses Button 
    Click Element    ${EDIT_COURSE_BTN}
    Wait Until Element Is Visible    ${EDIT_COURSE_TITLE}    10s

Click First View CLO Button
    Click Element    ${VIEW_CLOS_BTN}
    Wait Until Element Is Visible    ${CLO_TITLE}

Click Choose Program Drop
    Wait Until Element Is Visible  ${PROGRAM_DROP}
    Wait Until Element Is Enabled    ${PROGRAM_DROP}
    Click Element    ${PROGRAM_OPT}

Click Choose Type Drop
    Wait Until Element Is Visible  ${TYPE_DROP}
    Wait Until Element Is Enabled    ${TYPE_DROP}
    Click Element    ${TYPE_OPT}
Click Choose Status Drop
    Wait Until Element Is Visible  ${TYPE_DROP}
    Wait Until Element Is Enabled    ${TYPE_DROP}
    Click Element    ${TYPE_OPT}

Click Choose Prerequisite 
   Wait Until Element Is Visible  ${PREREQUISITE_COURSE_DROP}
    Wait Until Element Is Enabled    ${PREREQUISITE_COURSE_DROP}
    Click Element    ${PREREQUISITE_COURSE_OPT}

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
    Click Choose status Drop
    Click Choose Status Drop
    Click Choose Prerequisite
 
Click Update Course Button
    Wait Until Element Is Visible    ${UPDATE_COURSE}    10s 
    Scroll Element Into View    ${UPDATE_COURSE}
    Wait Until Element Is Enabled    ${UPDATE_COURSE}   
    Wait Until Page Does Not Contain Element    xpath=//div[contains(@class,'loading')]    10s
    Click Element    ${UPDATE_COURSE}
    Log    Course update form submitted

Verify Success Message And Course Update 
    Wait Until Element Contains    ${SUCCESS_UPDATE_MESSAGE}    Course updated successfully!    10s
    Element Should Contain    ${SUCCESS_MESSAGE}    updated
    Log   Success message should displayed : Courses update successfully

Verify Error Message For Required Fields
    [Arguments]    ${field_key}
    ${locator}=    Set Variable    ${ERROR_MESSAGES}[${field_key}]
    Wait Until Element Contains    ${locator}    This field is required    10s
    Element Should Contain    ${locator}    This field is required
    Log    Error message displayed for ${field_key} : This field is required

