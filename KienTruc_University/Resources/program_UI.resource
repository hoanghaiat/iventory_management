*** Settings ***
Library    SeleniumLibrary
Variables  ../variables/locator.py

*** Keywords ***
Open Browser And Login
    Open Browser    ${BASE_LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    id=id_username    10s
    Input Text    id=id_username    ${USERNAME}
    Input Text    id=id_password    ${PASSWORD}
    Click Button    xpath=//button[@type='submit']
    Wait Until Element Is Visible    ${MENU_PROGRAMS}    15s

Go To Programs Page
    Click Element    xpath=//*[@id="djHideToolBarButton"]
    Wait Until Element Is Visible    ${MENU_PROGRAMS}    10s
    Click Element    ${MENU_PROGRAMS}
    Wait Until Element Is Visible    ${SEARCH_BOX_PROGRAMS}    10s
    Wait Until Element Is Visible    ${PROGRAMS_TABLE_ROWS}    10s

Get First Program Name
    ${name}=    Get Text    ${FIRST_PROGRAM_NAME_CELL}
    [Return]    ${name}

Click First Program Courses Button
    Click Element    ${FIRST_PROGRAM_COURSES_BTN}
    Wait Until Element Is Visible    ${COURSES_TABLE_ROWS}    10s

Click First View Program Courses Button 
    Click Element    ${FIRST_PROGRAM_VIEW_BTN}
    Wait Until Element Is Visible    ${DETAIL_PROGRAM_TITLE}    10s

Click See All Button Courses
    Wait Until Page Contains Element    ${SEE_ALL_BTN}    10s
    Scroll Element Into View    ${SEE_ALL_BTN}
    Sleep    5s
    Wait Until Element Is Visible    ${SEE_ALL_BTN}    10s
    Wait Until Element Is Enabled    ${SEE_ALL_BTN}    10s
     Wait Until Page Does Not Contain Element    xpath=//div[contains(@class,'loading')]    10s
    Click Element    ${SEE_ALL_BTN}
    Wait Until Element Is Visible    ${COURSES_TABLE_ROWS}    10s
    Page Should Contain    All Courses

Click View Course Button In Detail Program 
    
    Wait Until Page Contains Element    ${VIEW_COURSE_BTN}    10s
    Scroll Element Into View    ${VIEW_COURSE_BTN}
    Sleep    5s
    Wait Until Element Is Visible    ${VIEW_COURSE_BTN}    10s
    Wait Until Element Is Enabled    ${VIEW_COURSE_BTN}    10s
    Wait Until Page Does Not Contain Element    xpath=//div[contains(@class,'loading')]    10s
    Click Element    ${VIEW_COURSE_BTN}
    Wait Until Element Is Visible    ${COURSES_TABLE}    10s
    Page Should Contain    as1 - abc 

Click All Course Button in Course Page 
   Wait Until Page Contains Element    ${ALL_COURSES_BTN}    10s 
   Wait Until Element Is Visible    ${ALL_COURSES_BTN}       10s
   Wait Until Element Is Enabled    ${ALL_COURSES_BTN}       10s
   Click Element    ${ALL_COURSES_BTN}
   Location Should Contain    ${URL_ALL_COURSE}

Click Add Course Button In Courses Page 
    Wait Until Page Contains Element    ${ADD_COURSES_BTN}    10s
    Wait Until Element Is Visible    ${ADD_COURSES_BTN}
    Wait Until Element Is Enabled    ${ADD_COURSES_BTN}      10s 
    Click Element    ${ADD_COURSES_BTN}
    Wait Until Element Is Visible    ${CREATE_COURSE_FORM}
    Page Should Contain    Create New Course
Click Back To Program Button In Courses Page 
   Wait Until Page Contains Element    ${BACK_TO_PROGRAM}    10s 
   Wait Until Element Is Visible    ${BACK_TO_PROGRAM}       10s
   Wait Until Element Is Enabled    ${BACK_TO_PROGRAM}       10s
   Click Element    ${BACK_TO_PROGRAM}
   Wait Until Element Is Visible    ${DETAIL_PROGRAM_TITLE} 
CLick Trang Chu Link In Course Page 
   Wait Until Page Contains Element    ${HOME_URL}         10s 
   Wait Until Element Is Visible    ${HOME_URL}       10s
   Wait Until Element Is Enabled    ${HOME_URL}       10s
   Click Element    ${HOME_URL}
   Location Should Contain    ${BASE_URL_ROOT}

Click Eyes Button In Course Page 
   Wait Until Page Contains Element    ${EYE_BTN}         10s 
   Wait Until Element Is Visible    ${EYE_BTN}       10s
   Wait Until Element Is Enabled    ${EYE_BTN}       10s
   Click Element    ${EYE_BTN}
   Wait Until Element Is Visible    ${DETAIL_COURSE_TITLE}

Click Edit Button In Course Page 
   Wait Until Page Contains Element    ${EDIT_BTN}         10s 
   Wait Until Element Is Visible    ${EDIT_BTN}       10s
   Wait Until Element Is Enabled    ${EDIT_BTN}       10s
   Click Element    ${EDIT_BTN}
   Wait Until Element Is Visible    ${EDIT_COURSE_TITLE}
Click View CLOs Button In Course Page 
   Wait Until Page Contains Element    ${VIEW_CLOS_BTN}         10s 
   Wait Until Element Is Visible    ${VIEW_CLOS_BTN}       10s
   Wait Until Element Is Enabled    ${VIEW_CLOS_BTN}       10s
   Click Element    ${VIEW_CLOS_BTN}
   Wait Until Element Is Visible    ${CLO_TITLE}