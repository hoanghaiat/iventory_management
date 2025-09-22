*** Settings ***
Library    SeleniumLibrary     
Library    CustomLibrary
Library    String
Library    Collections
Variables  ../variables/locator.py

*** Variables ***
${course}    DSA201 - Cấu trúc dữ liệu và giải thuật           
${description}    Đây là CLO test   
${category}    Knowledge
${level}    Understand  
${weight}    0.1  
${assessment}    Exam

*** Keywords ***  
Go To Course Page And Click View Clo Button
    Click Element    ${TAB}
    Wait Until Element Is Visible    ${MENU_COURSE}    10s
    Click Element    ${MENU_COURSE}
    Wait Until Element Is Visible    ${SEARCH_BOX}    10s
    Wait Until Element Is Visible    ${COURSES_TABLE_ROWSS}    10s
   Wait Until Page Contains Element    ${VIEW_CLOC_BTN}         10s 
   Wait Until Element Is Visible    ${VIEW_CLOC_BTN}       10s
   Wait Until Element Is Enabled    ${VIEW_CLOC_BTN}       10s
   Click Element    ${VIEW_CLOC_BTN}
   Wait Until Element Is Visible    ${CLO_TITLE}
Click Add Clos Button 
    ${href}=    Get Element Attribute    ${VIEW_CLOC_BTN}    href
    ${course_id}=    Fetch From Right    ${href}    /courses/
    ${course_id}=    Fetch From Left    ${course_id}    /clos/
    ${add_clo_locator}=    Set Variable    //a[@href="/en/academics/courses/${course_id}/clos/create/"]
    Wait Until Element Is Visible    ${add_clo_locator}    10s
    Scroll Element Into View    ${add_clo_locator}
    Wait Until Element Is Enabled    ${add_clo_locator}    10s
    Click Element    ${add_clo_locator}
    Wait Until Element Is Visible    ${CLO_CREATE_TITLE}
Click Home Link 
    Wait Until Element Is Visible    ${HOME_URL}     10s
    Scroll Element Into View    ${HOME_URL}
    Wait Until Element Is Enabled    ${HOME_URL}     10s
    Click Element    ${HOME_URL} 
    Location Should Contain    ${BASE_URL_ROOT}
Click Back To CLOs 
    Wait Until Element Is Visible    ${BACK_TO_CLOS_BTN}     10s
    Scroll Element Into View    ${BACK_TO_CLOS_BTN}
    Wait Until Element Is Enabled    ${BACK_TO_CLOS_BTN}     10s
    Click Element    ${BACK_TO_CLOS_BTN} 
    Wait Until Element Is Visible    ${ADD_CLO_BTN}

Select Dropdown By Label
    [Arguments]    ${dropdown_locator}    ${label}
    Wait Until Element Is Visible    ${dropdown_locator}    10s
    Wait Until Element Is Enabled    ${dropdown_locator}    10s
    Select From List By Label        ${dropdown_locator}    ${label}
    ${selected}=    Get Selected List Labels    ${dropdown_locator}
    List Should Contain Value        ${selected}    ${label} 

Verify Success Message and Create Clo 
    Wait Until Page Contains Element    ${SUCCESS_CLO_MESSAGE}
Verify Error Create CLO Message For Required Fields
    [Arguments]    ${field_key}
    ${locator}=    Set Variable    ${ERROR_CREATE_CLO_MESSAGES}[${field_key}]
    Wait Until Element Contains    ${locator}    This field is required    10s
    Element Should Contain    ${locator}    This field is required
    Log    Error message displayed for ${field_key} : This field is required

Verify Error Negative Message
    Page Should Contain     “Weight must be a positive number” or “Weight cannot be negative” 
Error Message With Special Character 
    Page Should Contain    CLO code mustn't duplicate! 

Verify Warning Message 
    Wait Until Element Is Visible    ${WARNING_MESSAGE_WEIGHT}    10s
    Wait Until Page Contains Element    ${WARNING_MESSAGE_WEIGHT}     10s 
Fill CLOs With Valid Data
    [Arguments]    ${course}  ${clo_code}  ${description}  ${category}   ${level}   ${weight}   ${assessment}

    Wait Until Element Is Visible    ${COURSE_DROP}    10s
    Run Keyword If    '${course}' != '${EMPTY}'    Select From List By Label    ${COURSE_DROP}    ${course}
    ...    ELSE    Select From List By Index    ${COURSE_DROP}    0

    Clear Element Text    ${CLO_CODE_FIELD}
    Run Keyword If    '${clo_code}' != '${EMPTY}'    Input Text    ${CLO_CODE_FIELD}    ${clo_code}

    Clear Element Text    ${DESCRIPTION_CLO}
    Run Keyword If    '${description}' != '${EMPTY}'    Input Text    ${DESCRIPTION_CLO}    ${description}

    Run Keyword If    '${category}' != '${EMPTY}'    Select Dropdown By Label    ${CATEGORY_CLO_DROP}    ${category}
    Run Keyword If    '${level}' != '${EMPTY}'    Select Dropdown By Label    ${LEVEL_CLO_DROP}    ${level}

    Clear Element text    ${WEIGHT_CLO}
    Run Keyword If    '${weight}' != '${EMPTY}'    Input text    ${WEIGHT_CLO}    ${weight}

    Run Keyword If    '${assessment}' != '${EMPTY}'    Select Dropdown By Label    ${ASSESSMENT_METHOD_DROP}    ${assessment}

Open CLO List Of First Course
    [Documentation]    Vào danh sách CLOs của khóa học đầu tiên
    Wait Until Element Is Visible    ${VIEW_CLOC_BTN}    10s
    Scroll Element Into View         ${VIEW_CLOC_BTN}
    Click Element                    ${VIEW_CLOC_BTN}

Open Create CLO Page
    [Documentation]    Mở trang Create CLO
    Wait Until Element Is Visible    ${ADD_CLO_BTN}    10s
    Scroll Element Into View         ${ADD_CLO_BTN}
    Click Element                    ${ADD_CLO_BTN}
    Wait Until Element Is Visible    ${CLO_CREATE_TITLE}    10s

Click Create CLO Button
    [Documentation]    Nhấn nút Create CLO
    Wait Until Element Is Enabled    ${CREATE_CLO_BTN}    10s
    Scroll Element Into View         ${CREATE_CLO_BTN}
    Click Element                    ${CREATE_CLO_BTN}

Verify Success Message And Created
    [Documentation]    Xác nhận tạo CLO thành công
    Wait Until Element Is Visible    ${SUCCESS_CLO_MESSAGE}    10s
    Element Should Contain           ${SUCCESS_CLO_MESSAGE}    CLO was created successfully

Perform And Click Search Button In CLO
    [Arguments]   ${keyword}
    Clear Element Text    ${_SEARCH_BOX_IN_COURSE} 
    Input Text    ${_SEARCH_BOX_IN_COURSE}    ${keyword}
    Click Element    ${_SEARCH_BOX_COURSES} 
Verify Search Result Exists In CLO 
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

Verify Search No CLO Result 
    Wait Until Page Contains Element    ${NO_RESULT_TEXT_COURSES}    10s
    Element Should Contain    ${NO_RESULT_TEXT_COURSES}    No CLOs found. 
Click Add One Link in Course 
    Wait Until Element Is Visible     ${ADD_ONE_LINK}    10s 
    Wait Until Element Is Enabled    ${ADD_ONE_LINK}        10s 
    Click Element    ${ADD_ONE_LINK} 


Click Edit CLOs Button
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${edit_clo_btn}

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
     [Arguments]    ${course}  ${clo_code}  ${description}  ${category}   ${level}   ${weight}   ${assessment}

    Wait Until Element Is Visible    ${COURSE_DROP}    10s
    Run Keyword If    '${course}' != '${EMPTY}'    Select From List By Label    ${COURSE_DROP}    ${course}
    ...    ELSE    Select From List By Index    ${COURSE_DROP}    0

    Clear Element Text    ${CLO_CODE_FIELD}
    Run Keyword If    '${clo_code}' != '${EMPTY}'    Input Text    ${CLO_CODE_FIELD}    ${clo_code}

    Clear Element Text    ${DESCRIPTION_CLO}
    Run Keyword If    '${description}' != '${EMPTY}'    Input Text    ${DESCRIPTION_CLO}    ${description}

    Run Keyword If    '${category}' != '${EMPTY}'    Select From List By Value    ${CATEGORY_CLO_DROP}    ${category}
    Run Keyword If    '${level}' != '${EMPTY}'    Select From List By Value    ${LEVEL_CLO_DROP}    ${level}

    Clear Element text    ${WEIGHT_CLO}
    Run Keyword If    '${weight}' != '${EMPTY}'    Input text    ${WEIGHT_CLO}    ${weight}

    Run Keyword If    '${assessment}' != '${EMPTY}'    Select From List By Value    ${ASSESSMENT_METHOD_DROP}    ${assessment}


Click Edit CLOs Button
    ${edit_clo_locator}=    Set Variable    (//a[contains(@href, '/clos/') and contains(@href, '/update/')])[1]
    Wait Until Element Is Visible    ${edit_clo_locator}    10s
    Scroll Element Into View          ${edit_clo_locator}
    Click Element                     ${edit_clo_locator}
Click PLO Mapping Button
    ${plo_mapping_locator}=    Set Variable    (//a[contains(@href, '/plo-mapping/create/') and contains(@class, 'btn-success')])[1]
    Wait Until Element Is Visible    ${plo_mapping_locator}    10s
    Scroll Element Into View         ${plo_mapping_locator}
    Click Element                    ${plo_mapping_locator}

Click View CLOs Button
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

Verify Error Create PLO Message
    [Arguments]    ${field_key}
    ${locator}=    Set Variable    ${ERROR_CREATE_PLO_MESSAGES}[${field_key}]
    Wait Until Element Contains    ${locator}    This field is required    10s
    Element Should Contain    ${locator}    This field is required
    Log    Error message displayed for ${field_key} : This field is required

