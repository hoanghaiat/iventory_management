*** Settings ***
Library    SeleniumLibrary     
Library    CustomLibrary 
Library    String
Library    Collections
Variables  ../variables/locator.py

*** Variables ***
${detail_program}        xpath=(//p[contains(@class,"text-muted mb-2")])[1]
${detail_fullcourse}     xpath=(//h5[contains(@class,"text-primary")])[1]
${detail_type}           xpath=(//div[@class="mb-3"]/div/span[contains(@class,"badge")])[1]
${detail_status}         xpath=(//div[@class="mb-3"]/div/span[contains(@class,"badge")])[2]
${detail_description}    xpath=(//div[h6[text()="Mô tả"]]/p)[2]
${detail_credit}         xpath=(//h6[text()="Số tín chỉ"]/following-sibling::p)[1]
${detail_prerequisite}   xpath=//ul[@class="list-group"]/li/a

&{input_locator}
...    program=${PROGRAM_DROP}
...    coursecode=${COURSE_CODE_FIELD}
...    coursename=${COURSE_NAME_FILED}
...    credit=${CREDIT_FIELD}
...    description=${DESCRIPTION_FIELD}
...    type=${TYPE_DROP}
...    status=${STATUS_DROP}
...    prerequisite=${PREREQUISITE_COURSE_DROP}

&{detail_locator}   
...    program=${detail_program}
...    fullname=${detail_fullcourse}
...    credit=${detail_credit}
...    description=${detail_description}
...    type=${detail_type}
...    status=${detail_status}
...    prerequisite=${detail_prerequisite}

*** Keywords ***

Go To Course Page
    Click Element    ${TAB}
    Wait Until Element Is Visible    ${MENU_COURSE}    10s 
    Click Element    ${MENU_COURSE} 
    Wait Until Element Is Visible    ${SEARCH_BOX}    10s
    Wait Until Element Is Visible    ${COURSES_TABLE_ROWSS}    10s

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

Click First Edit Courses Buttonn
    Wait Until Page Contains Element    ${EDIT_COURSE}    10s 
    Wait Until Element Is Visible       ${EDIT_COURSE}    10s
    Wait Until Element Is Enabled       ${EDIT_COURSE}    10s
    Scroll Element Into View            ${EDIT_COURSE}        
    Click Element                       ${EDIT_COURSE}
    Wait Until Element Is Visible       ${EDIT_COURSE_TITLE}    10s   

Click Update Course Button
    Wait Until Element Is Visible       ${UPDATE_COURSE_BTN}    20s
    Scroll Element Into View            ${UPDATE_COURSE_BTN}           
    Wait Until Element Is Enabled       ${UPDATE_COURSE_BTN}    30s
    Wait Until Page Does Not Contain Element    ${LOADING}    20s
    Wait Until Page Does Not Contain Element    xpath=//div[contains(@class,'toast')]      
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${UPDATE_COURSE_BTN}
    Wait Until Page Contains Element    ${detail_fullcourse}    20s

Verify Success Message And Course Update 
    Wait Until Element Is Visible    ${SUCCESS_UPDATE_MESSAGE}    20s

Verify Error Update Message For Required Fields
    [Arguments]    ${field_key}
    ${locator}=    Set Variable    ${ERROR_UPDATE_MESSAGES}[${field_key}]
    Wait Until Element Contains    ${locator}    This field is required    10s
    Element Should Contain         ${locator}    This field is required
    Log    Error message displayed for ${field_key} : This field is required

Normalize String
    [Arguments]    ${text}
    ${text}=    Replace String Using Regexp    ${text}    [\p{Zs}\s]+    ${SPACE}
    ${text}=    Strip String    ${text}
    [Return]    ${text}
Fill Course Form
    [Arguments]    ${program}   ${course_code}   ${course_name}   ${credit}   ${description}   ${type}   ${status}   ${prerequisite}

    ${course}=     Create Dictionary  
    ...    program=${program}
    ...    coursecode=${course_code}
    ...    coursename=${course_name}
    ...    credit=${credit}
    ...    description=${description}
    ...    type=${type}
    ...    status=${status}
    ...    prerequisite=${prerequisite}
    [Return]    ${course}

    Wait Until Element Is Visible    ${PROGRAM_DROP}    5s
    Run Keyword If    '${program}' != '${EMPTY}'    Select From List By Label    ${PROGRAM_DROP}    ${program}
    ...    ELSE    Select From List By Index    ${PROGRAM_DROP}    0

    Wait Until Element Is Visible    ${COURSE_CODE_FIELD}    5s
    Clear Element Text    ${COURSE_CODE_FIELD}
    Run Keyword If    '${course_code}' != '${EMPTY}'    Input Text    ${COURSE_CODE_FIELD}    ${course_code}

    Clear Element Text    ${COURSE_NAME_FILED}
    Run Keyword If    '${course_name}' != '${EMPTY}'    Input Text    ${COURSE_NAME_FILED}    ${course_name}

    Clear Element Text    ${CREDIT_FIELD}
    Run Keyword If    '${credit}' != '${EMPTY}'    Input Text    ${CREDIT_FIELD}    ${credit}

    Clear Element Text    ${DESCRIPTION_FIELD}
    Run Keyword If    '${description}' != '${EMPTY}'    Input Text    ${DESCRIPTION_FIELD}    ${description} 

    Run Keyword If    '${type}' != '${EMPTY}'    Select From List By Label    ${TYPE_DROP}    ${type} 
    Run Keyword If    '${status}' != '${EMPTY}'    Select From List By Label    ${STATUS_DROP}    ${status}
    Run Keyword If    '${prerequisite}' != '${EMPTY}'    Select From List By Label    ${PREREQUISITE_COURSE_DROP}    ${prerequisite}


Verify Course Data In UI
    [Arguments]    ${course}
    ${coursecode}=    Get From Dictionary    ${course}    coursecode
    ${coursename}=    Get From Dictionary    ${course}    coursename
    ${fullname}=    Set Variable    ${coursecode} - ${coursename}

    Set To Dictionary    ${course}    fullname=${fullname}

    Remove From Dictionary    ${course}    coursecode    coursename

    FOR    ${field}    ${expected}    IN    &{course}
        ${locator}=    Get From Dictionary    ${DETAIL_LOCATOR}    ${field}
        ${actual}=     Get Text    ${locator}
        ${actual}=     Replace String Using Regexp    ${actual}    \s+    ${SPACE}
        ${actual}=     Strip String    ${actual}
        ${expected}=   Replace String Using Regexp    ${expected}    \s+    ${SPACE}
        ${expected}=   Strip String    ${expected}
        Should Be Equal As Strings    ${actual}    ${expected}    msg=Mismatch in field '${field}'
    END


Click View Course Button
    ${view_course_locator}=    Set Variable    (//a[contains(@href, '/courses/') and contains(@class, 'btn-info')])[1]
    Wait Until Element Is Visible    ${view_course_locator}    10s
    Scroll Element Into View         ${view_course_locator}
    Click Element                    ${view_course_locator} 

Click Edit Course Button 
    Wait Until Element Is Visible    ${EDIT_COURSE_VN}   10s
    Scroll Element Into View    ${EDIT_COURSE_VN}
    Wait Until Element Is Enabled    ${EDIT_COURSE_VN}     10s 
    Click Element    ${EDIT_COURSE_VN}

Click View CLOs Button
    ${view_clos_locator}=    Set Variable    (//a[contains(@href, '/courses/') and contains(@href, '/clos/') and contains(@class, 'btn-success')])[1]
    Wait Until Element Is Visible    ${view_clos_locator}    10s
    Scroll Element Into View         ${view_clos_locator}
    Click Element                    ${view_clos_locator}

Click Edit CLOs Button
    ${edit_clo_locator}=    Set Variable    (//a[contains(@href, '/clos/') and contains(@href, '/update/')])[1]
    Wait Until Element Is Visible    ${edit_clo_locator}    10s
    Scroll Element Into View          ${edit_clo_locator}
    Click Element                     ${edit_clo_locator} 

Click Create Class Button
    ${create_class_locator}=    Set Variable    (//a[contains(@href, '/classes/create/') and contains(@class, 'btn-info')])[1]
    Wait Until Element Is Visible    ${create_class_locator}    10s
    Scroll Element Into View         ${create_class_locator}
    Click Element                    ${create_class_locator}

Click Back To Courses Button
    ${back_courses_locator}=    Set Variable    (//a[contains(@href, '/programs/') and contains(@href, '/courses/') and contains(@class, 'btn-secondary')])[1]
    Wait Until Element Is Visible    ${back_courses_locator}    10s
    Scroll Element Into View         ${back_courses_locator}
    Click Element                    ${back_courses_locator}

Click Add CLO Button
    ${add_clo_locator}=    Set Variable    (//a[contains(@href, '/courses/') and contains(@href, '/clos/create')])[1]
    Wait Until Element Is Visible    ${add_clo_locator}    10s
    Scroll Element Into View         ${add_clo_locator}
    Click Element                    ${add_clo_locator}

Click Add Content Button
    ${add_content_locator}=    Set Variable    (//a[contains(@href, '/courses/') and contains(@href, '/contents/create')])[1]
    Wait Until Element Is Visible    ${add_content_locator}    10s
    Scroll Element Into View         ${add_content_locator}
    Click Element                    ${add_content_locator}

Click Add Assessment Button
    ${add_assessment_locator}=    Set Variable    (//a[contains(@href, '/courses/') and contains(@href, '/assessments/create')])[1]
    Wait Until Element Is Visible    ${add_assessment_locator}    10s
    Scroll Element Into View         ${add_assessment_locator}
    Click Element                    ${add_assessment_locator}

Click Add Class Button
    ${add_class_locator}=    Set Variable    (//a[contains(@href, '/courses/') and contains(@href, '/classes/create')])[1]
    Wait Until Element Is Visible    ${add_class_locator}    10s
    Scroll Element Into View         ${add_class_locator}
    Click Element                    ${add_class_locator}

Click Setting Button 
    Wait Until Element Is Visible    ${SETTING_BTN}    10s 
    Scroll Element Into View    ${SETTING_BTN}
    Wait Until Element Is Enabled    ${SETTING_BTN}     10s 
    Click Element    ${SETTING_BTN}  
    Wait Until Page Contains Element    ${CLO_SETTING_TITLE} 
Click First Assessment Category Action
    [Arguments]    ${action}    # update | delete
    ${href}=    Get Element Attribute    (//a[contains(@href, '/assessment-categories/') and contains(@href, '${action}')])[1]    href
    ${id}=    Fetch From Right    ${href}    /assessment-categories/
    ${id}=    Fetch From Left    ${id}    /
    Log    Found ID: ${id}
    Click Element    (//a[contains(@href, '/assessment-categories/${id}/${action}')])[1]
