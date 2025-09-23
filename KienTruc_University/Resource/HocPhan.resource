*** Settings ***
Library    SeleniumLibrary    run_on_failure=Nothing
Library    String
Library    Collections
Library    XML
Variables    ../locator.py


*** Variables ***
${MESSAGE_ACTUAL_COURSES}    Course update successfully!


*** Keywords ***
Handle Advertise
    ${check}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${BOX_ADVERTISE}    5s
    IF    "${check}" == "True"
        Click Element    //a[@id="djHideToolBarButton"]
    END
    
Open Course List 
    Wait Until Element Is Visible    ${URL_HP}    30s
    Scroll Element Into View    ${URL_HP}
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${URL_HP}
    Handle Advertise
Verify Page Title Course
    Wait Until Element Is Visible    //h1[@class="content-title"]    30s
    ${actualpagetitle}=    Get Text    //h1[@class="content-title"]
    Should Be Equal    ${actualpagetitle}    All Courses

Click The Button Programs
    Wait Until Element Is Visible    ${URL_PROGRAMS}    30s
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${URL_PROGRAMS}
    Wait Until Element Is Visible    ${TITLE_PAGE}    30s
    ${actualprogram}=    Get Text    ${TITLE_PAGE}    
    Should Be Equal    ${actualprogram}    Quản lý chương trình

Enter Input Search Course
    [Arguments]    ${key}
    Wait Until Element Is Visible    ${INPUT_SEARCH_COURSES}    30s
    Input Text    ${INPUT_SEARCH_COURSES}    ${key}
  
Click The Button Search Courses
    Wait Until Element Is Visible    ${SEARCH_COURSES_BTN}    30s
    Wait Until Keyword Succeeds    30s    1s    Click Button    ${SEARCH_COURSES_BTN}

Verify Search Results Contain Keyword Courses
    [Arguments]    ${keyword}
    Wait Until Element Is Visible    ${EXPECTED_SEARCH_COURSES}    30s
    ${elements}=    Get WebElements    ${EXPECTED_SEARCH_COURSES}
    @{list}=    Create List
    FOR    ${el}    IN    @{elements}
        ${text}=    Get Text    ${el}
        Append To List    ${list}    ${text}
    END

    ${lower_keyword}=    Convert To Lowercase    ${keyword}
    FOR    ${text}    IN    @{list}
        ${lower_text}=    Convert To Lowercase    ${text}
        Should Contain    ${lower_text}    ${lower_keyword}
    END


Verify That The Search Sesult Does Not Exist
    Wait Until Element Is Visible    ${MESSAGE_SEARCH_NOT_EXITS}    30s
    ${message}=    Get Text    ${MESSAGE_SEARCH_NOT_EXITS}
    Should Be Equal    ${message}    No courses found.

Verify Empty Search Result
    Page Should Contain    Vui lòng nhập từ khóa tìm kiếm

Verify Text Equal
    [Arguments]    ${locator}    ${expected}
    Wait Until Element Is Visible    ${locator}    30s
    ${actual}=    Get Text    ${locator}
    Should Be Equal    ${actual}    ${expected}
Verify Text Contain
    [Arguments]    ${locator}    ${expected}
    Wait Until Element Is Visible    ${locator}    30s
    ${actual}=    Get Text    ${locator}
    Should Contain    ${actual}    ${expected}
Fill Text Field
    [Arguments]    ${locator}    ${value}
    Wait Until Element Is Visible    ${locator}    30s
    Scroll Element Into View    ${locator}
    Input Text    ${locator}    ${value}
Fill Dropdown
    [Arguments]    ${locator}    ${value}
    Wait Until Element Is Visible    ${locator}    30s
    Scroll Element Into View    ${locator}
    Select From List By Label    ${locator}    ${value}
    
Fill Checkbox
    [Arguments]    ${locator}    
    Wait Until Element Is Visible    ${locator}    30s
    Scroll Element Into View    ${locator}
    Select Checkbox    ${locator}    
  
Click The Button Information Courses
    ${id}    Set Variable    1
    ${urlinfo}    Replace Variables    ${URL_COURSE_INFO}
    ${excode}    Replace Variables    ${EXPECTED_CODE_COURSE}
    ${exname}    Replace Variables    ${EXPECTED_NAME_COURSE}
    ${extype}    Replace Variables    ${EXPECTED_TYPE_COURSE}
    ${exstatus}    Replace Variables    ${EXPECTED_STATUS_COURSE}
    
    Wait Until Element Is Visible    ${excode}    30s
    ${code}=    Get Text    ${excode}
    ${name}=    Get Text    ${exname}
    ${type}=    Get Text    ${extype}
    ${status}=    Get Text    ${exstatus}
    Wait Until Element Is Visible    ${urlinfo}    30s
    Scroll Element Into View    ${urlinfo}
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${urlinfo}
    
    Verify Text Contain   ${ACTUAL_CODE_COURSE}    ${code}
    Verify Text Contain    ${ACTUAL_CODE_COURSE}    ${name}
    Verify Text Contain    ${ACTUAL_TYPE_COURSE}    ${type}
    Verify Text Contain    ${ACTUAL_STATUS_COURSE}    ${status}

Click The Button Edit Courses
    Wait Until Element Is Visible    ${URL_EDIT_COURSES}    30s
    Scroll Element Into View    ${URL_EDIT_COURSES}
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${URL_EDIT_COURSES}
    Page Should Contain    Edit Course

Fill In Edit Course Form
    [Arguments]    ${code}    ${name}    ${credits}    ${description}    ${type}    ${status}

    Fill Text Field    ${INPUT_COURSE_CODE}    ${code}
    Fill Text Field    ${INPUT_COURSE_NAME}    ${name}
    Fill Text Field    ${INPUT_CREDITS}    ${credits}
    Fill Text Field    ${TEXTAREA_DESCRIPTION_COURSE}    ${description}
    Fill Dropdown    ${SELECT_TYPE_COURSE}    ${type}
    Fill Dropdown    ${SELECT_STATUS_COURSE}    ${status}

Click The Button Update Course
    Wait Until Element Is Visible    ${UPDATE_COURSE_BTN}    30s
    Scroll Element Into View    ${UPDATE_COURSE_BTN}
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${UPDATE_COURSE_BTN}

Verify The Result Of The Update
    [Arguments]    ${code}    ${name}    ${credits}    ${description}    ${type}    ${status}
    Wait Until Element Is Visible    ${MESSAGE_ACTUAL_COURSE}
    ${message}=    Get Text    ${MESSAGE_ACTUAL_COURSE}
    
    Verify Text Equal    ${message}    Course updated successfully!
    Verify Text Contain    ${ACTUAL_CODE_COURSE}    ${code}
    Verify Text Contain    ${ACTUAL_CODE_COURSE}    ${name}
    Verify Text Contain    ${ACTUAL_TYPE_COURSE}    ${type}
    Verify Text Contain    ${ACTUAL_STATUS_COURSE}    ${status}
Clear All Information Fields In The Edit Form
    Wait Until Element Is Visible    ${INPUT_COURSE_CODE}    30s
    Scroll Element Into View    ${INPUT_COURSE_CODE}
    Clear Element Text     ${INPUT_COURSE_CODE}
    Wait Until Element Is Visible    ${INPUT_COURSE_NAME}    30s
    Clear Element Text    ${INPUT_COURSE_NAME}  
    Clear Element Text    ${INPUT_CREDITS}    
    Scroll Element Into View    ${TEXTAREA_DESCRIPTION_COURSE}
    Clear Element Text    ${TEXTAREA_DESCRIPTION_COURSE}    

Verify Message When Clearing Fields
    Page Should Contain    This field is required.
    
Get Course Information
    ${id}    Set Variable    1
    ${code}    Replace Variables    ${EXPECTED_CODE_COURSE}
    ${name}    Replace Variables    ${EXPECTED_NAME_COURSE}
    ${type}    Replace Variables    ${EXPECTED_TYPE_COURSE}
    ${status}    Replace Variables    ${EXPECTED_STATUS_COURSE}
    Wait Until Element Is Visible    ${code}    30s
    Scroll Element Into View    ${code}
    ${code_value}=    Get Text    ${code}
    ${name_value}=    Get Text    ${name}
    ${type_value}=    Get Text    ${type}
    ${status_value}=    Get Text    ${status}
    RETURN    ${code_value}    ${name_value}    ${type_value}    ${status_value}
Click The Button CLOs Course
    ${id}    Set Variable    1
    ${urlclos}    Replace Variables    ${URL_CLOS}
    
    Wait Until Element Is Visible    ${urlclos}    30s
    Scroll Element Into View    ${urlclos}
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${urlclos}

Verify Course CLO Information
    [Arguments]    ${code}    ${name}    ${type}    ${status}
    Wait Until Element Is Visible    ${TITLE_PAGE}    30s
    ${info}=    Get Text    ${TITLE_PAGE}
    Should Contain    ${info}    ${code}
    Should Contain    ${info}    ${name}


