*** Settings ***
Library    SeleniumLibrary
Library    CustomLibrary 
Library    String
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
    Wait Until Element Is Visible    ${SEARCH_BOX}    10s
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

Perform And Click Search Button In Course 
    [Arguments]   ${keyword}
    Clear Element Text    ${_SEARCH_BOX_IN_COURSE} 
    Input Text    ${_SEARCH_BOX_IN_COURSE}    ${keyword}
    Click Element    ${_SEARCH_BOX_COURSES} 
Verify Search Result Exists In Course
    [Arguments]    ${keyword}
    Wait Until Page Contains Element    ${RESULT_TABLE}    10s
    ${titles}=    Get WebElements    ${RESULT_TITLE}
    FOR    ${title}    IN    @{titles}
        ${text}=    Get Text    ${title}
        Log    Found title: ${text}
        ${lower_title}=    Convert To Lower Case    ${text}
        Run Keyword If    '${keyword.lower()}' in '${lower_title}'    Pass Execution    Found keyword in title
    END
    Fail    Không tìm thấy kết quả chứa từ khóa: ${keyword} 
 Verify Search Results Contain Keyword
    [Arguments]    ${keyword}
    ${results}=    Get WebElements    ${RESULT_TITLE}
    Run Keyword If    '${results}' == '[]'    Fail    No search results found for keyword: ${keyword}
    FOR    ${item}    IN    @{results}
        ${text}=    Get Text    ${item}
        Should Contain    ${text}    ${keyword}    ignore_case=True
    END 
Verify Search No Course Result 
    Wait Until Page Contains Element    ${NO_RESULT_TEXT_COURSES}    10s
    Element Should Contain    ${NO_RESULT_TEXT_COURSES}    No courses found. 
Click Add One Link in Course 
    Wait Until Element Is Visible     ${ADD_ONE_LINK}    10s 
    Wait Until Element Is Enabled    ${ADD_ONE_LINK}        10s 
    Click Element    ${ADD_ONE_LINK} 