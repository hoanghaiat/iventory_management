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
   Wait Until Page Contains Element    ${EDIT_COURSE}         10s 
   Wait Until Element Is Visible    ${EDIT_COURSE}       10s
   Wait Until Element Is Enabled    ${EDIT_COURSE}       10s
   Click Element    ${EDIT_COURSE}
    Wait Until Element Is Visible    ${EDIT_COURSE_TITLE}    10s

Click First View CLO Button
   Wait Until Page Contains Element    ${VIEW_CLOC_BTN}         10s 
   Wait Until Element Is Visible    ${VIEW_CLOC_BTN}       10s
   Wait Until Element Is Enabled    ${VIEW_CLOC_BTN}       10s
   Click Element    ${VIEW_CLOC_BTN}
   Wait Until Element Is Visible    ${CLO_TITLE}
