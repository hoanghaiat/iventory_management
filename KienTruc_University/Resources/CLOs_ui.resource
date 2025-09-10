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

Verify Warning Message 
    Wait Until Element Is Visible    ${WARNING_MESSAGE_WEIGHT}    10s
    Wait Until Page Contains Element    ${WARNING_MESSAGE_WEIGHT}     10s 
Fill CLOs With Valid Data
    [Arguments]    ${course}  ${clo_code}  ${description}  ${category}   ${level}   ${weight}   ${assessment}

    Wait Until Element Is Visible    ${CLO_CODE}    10s
    Clear Element Text               ${CLO_CODE}
    Input Text                       ${CLO_CODE}    ${clo_code}

    Select Dropdown By Label         ${COURSE_DROP}              ${course}

    Clear Element Text               ${DESCRIPTION_CLO}
    Input Text                       ${DESCRIPTION_CLO}          ${description}

    Select Dropdown By Label         ${CATEGORY_CLO_DROP}        ${category}
    Select Dropdown By Label         ${LEVEL_CLO_DROP}           ${level}

    Clear Element Text               ${WEIGHT_CLO}
    Input Text                       ${WEIGHT_CLO}               ${weight}

    Select Dropdown By Label         ${ASSESSMENT_METHOD_DROP}   ${assessment}

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
Fill CLOs Form With Valid Database 
    Wait Until Element Is Visible    ${CLO_CODE}    10s
    Input Text                       ${CLO_CODE}    CLO01
    Input Text                       ${DESCRIPTION_CLO}    Đây là CLO test
    Select From List By Value        ${COURSE_DROP}    32
    Select From List By Value        ${CATEGORY_CLO_DROP}    skill
    Select From List By Value        ${LEVEL_CLO_DROP}    apply
    Input Text                       ${WEIGHT_CLO}    0.01
    Select From List By Value        ${ASSESSMENT_METHOD_DROP}    exam  

Fill CLOs Form With Empty Course Field 
    Wait Until Element Is Visible    ${CLO_CODE}    10s
    Input Text                       ${CLO_CODE}    CLO01
    Input Text                       ${DESCRIPTION_CLO}    Đây là CLO test
    Select From List By Index        ${COURSE_DROP}    0
    Select From List By Value        ${CATEGORY_CLO_DROP}    skill
    Select From List By Value        ${LEVEL_CLO_DROP}    apply
    Input Text                       ${WEIGHT_CLO}    0.01
    Select From List By Value        ${ASSESSMENT_METHOD_DROP}    exam  

Fill CLOs Form With Empty CLO Code
    Wait Until Element Is Visible    ${CLO_CODE}    10s
    Clear Element Text               ${CLO_CODE}   
    Input Text                       ${DESCRIPTION_CLO}    Đây là CLO test
    Select From List By Value        ${COURSE_DROP}    32
    Select From List By Value        ${CATEGORY_CLO_DROP}    skill
    Select From List By Value        ${LEVEL_CLO_DROP}    apply
    Input Text                       ${WEIGHT_CLO}    0.01
    Select From List By Value        ${ASSESSMENT_METHOD_DROP}    exam 
Fill CLOs Form With Empty Description
    Wait Until Element Is Visible    ${CLO_CODE}    10s
    Input Text                       ${CLO_CODE}       CLO01
    Clear Element Text               ${DESCRIPTION_CLO}    
    Select From List By Value        ${COURSE_DROP}    32
    Select From List By Value        ${CATEGORY_CLO_DROP}    skill
    Select From List By Value        ${LEVEL_CLO_DROP}    apply
    Input Text                       ${WEIGHT_CLO}    0.01
    Select From List By Value        ${ASSESSMENT_METHOD_DROP}    exam 
Fill CLOs Form With Empty Category
    Wait Until Element Is Visible    ${CLO_CODE}    10s
    Input Text                       ${CLO_CODE}   CLO01
    Input Text                       ${DESCRIPTION_CLO}    Đây là CLO test
    Select From List By Value        ${COURSE_DROP}    32
    Select From List By Index        ${CATEGORY_CLO_DROP}   0   
    Select From List By Value        ${LEVEL_CLO_DROP}    apply
    Input Text                       ${WEIGHT_CLO}    0.01
    Select From List By Value        ${ASSESSMENT_METHOD_DROP}    exam 
Fill CLOs Form With Empty Level 
    Wait Until Element Is Visible    ${CLO_CODE}    10s
    Input Text                       ${CLO_CODE}    CLO01
    Input Text                       ${DESCRIPTION_CLO}    Đây là CLO test
    Select From List By Value        ${COURSE_DROP}    32
    Select From List By Value        ${CATEGORY_CLO_DROP}    skill
    Select From List By Index        ${LEVEL_CLO_DROP}   0
    Input Text                       ${WEIGHT_CLO}    0.01
    Select From List By Value        ${ASSESSMENT_METHOD_DROP}    exam  
Fill CLOs Form With Empty Weight 
    Wait Until Element Is Visible    ${CLO_CODE}    10s
    Input Text                       ${CLO_CODE}    CLO01
    Input Text                       ${DESCRIPTION_CLO}    Đây là CLO test
    Select From List By Value        ${COURSE_DROP}    32
    Select From List By Value        ${CATEGORY_CLO_DROP}    skill
    Select From List By Value        ${LEVEL_CLO_DROP}    apply
    Clear Element Text               ${WEIGHT_CLO}    
    Select From List By Value        ${ASSESSMENT_METHOD_DROP}    exam  
Fill CLOs Form With Empty Assessment Method
    Wait Until Element Is Visible    ${CLO_CODE}    10s
    Input Text                       ${CLO_CODE}    CLO01
    Input Text                       ${DESCRIPTION_CLO}    Đây là CLO test
    Select From List By Value        ${COURSE_DROP}    32
    Select From List By Value        ${CATEGORY_CLO_DROP}    skill
    Select From List By Value        ${LEVEL_CLO_DROP}    apply
    Input Text                       ${WEIGHT_CLO}    0.01
    Select From List By Index        ${ASSESSMENT_METHOD_DROP}    0
Fill CLOs Form With 5 Digits In Weight Fields
    Wait Until Element Is Visible    ${CLO_CODE}    10s
    Input Text                       ${CLO_CODE}    CLO01
    Input Text                       ${DESCRIPTION_CLO}    Đây là CLO test
    Select From List By Value        ${COURSE_DROP}    32
    Select From List By Value        ${CATEGORY_CLO_DROP}    skill
    Select From List By Value        ${LEVEL_CLO_DROP}    apply
    Input Text                       ${WEIGHT_CLO}    555555
    Select From List By Index        ${ASSESSMENT_METHOD_DROP}    0  
Fill CLOs Form With Empty All Field
    Wait Until Element Is Visible    ${CLO_CODE}    10s
    Clear Element Text                      ${CLO_CODE}    
    Clear Element Text                      ${DESCRIPTION_CLO}    
    Select From List By Index        ${COURSE_DROP}    0
    Select From List By Index        ${CATEGORY_CLO_DROP}    0
    Select From List By Index        ${LEVEL_CLO_DROP}    0
    Clear Element Text                      ${WEIGHT_CLO}    
    Select From List By Index        ${ASSESSMENT_METHOD_DROP}    0

Fill CLOs Form With Special Character
     Wait Until Element Is Visible    ${CLO_CODE}    10s
    Input Text               ${CLO_CODE}    CL!@#
    Input Text                       ${DESCRIPTION_CLO}    Đây là CLO test
    Select From List By Value        ${COURSE_DROP}    32
    Select From List By Value        ${CATEGORY_CLO_DROP}    skill
    Select From List By Value        ${LEVEL_CLO_DROP}    apply
    Input Text                       ${WEIGHT_CLO}    0.01
    Select From List By Value        ${ASSESSMENT_METHOD_DROP}    exam 
Error Message With Special Character 
    Page Should Contain    "CLO code cannot contain special characters"

Fill CLOs Form With CLO Code Already Exists
     Wait Until Element Is Visible    ${CLO_CODE}    10s
    Input Text               ${CLO_CODE}    CLO01
    Input Text                       ${DESCRIPTION_CLO}    Đây là CLO test
    Select From List By Value        ${COURSE_DROP}    32
    Select From List By Value        ${CATEGORY_CLO_DROP}    skill
    Select From List By Value        ${LEVEL_CLO_DROP}    apply
    Input Text                       ${WEIGHT_CLO}    0.01
    Select From List By Value        ${ASSESSMENT_METHOD_DROP}    exam 
Error Message With Clo Code Exists
    Page Should Contain    “The CLO code already exisits”  

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
