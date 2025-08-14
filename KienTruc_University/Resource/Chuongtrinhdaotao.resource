*** Settings ***
Library    SeleniumLibrary
Library    String
Library    Collections
Library    XML
Variables    ../locator.py
Resource    ../Resource/DangNhap.resource

*** Variables ***
${EXPECTED_TITLE}    Quản lý chương trình
${EXPECTED_SEARCH_NOT}    No programs found.
${EXPECTED_VAL}    Danh sách Học phần
${EXPECTED_SUCCESS}    Course created successfully!
${EXPECTED_ERROR}    This field is required.
${MESSAGE_UNIQUE}    Course code is unique
${CLOS}    CLOs
${EXPECTED_MESSAGE_CLO}    CLO created successfully!
${TITLE_CLO_DETAIL}    CLO Details
*** Keywords ***
Handle Advertise
    ${check}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${BOX_ADVERTISE}    5s
    IF    "${check}" == "True"
        Click Element    //a[@id="djHideToolBarButton"]
    END
    

Open Program List
    Wait Until Element Is Visible    ${URL_CTDT}    30s
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${URL_CTDT}
Verify Page Title
    Wait Until Element Is Visible    ${TITLE_PAGE}    30s
    ${actual_title}=    Get Text    ${TITLE_PAGE}
    Should Be Equal    ${actual_title}    ${EXPECTED_TITLE}
####

Open Program Page
    Wait Until Element Is Visible    ${URL_CTDT}    30s
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${URL_CTDT}
Enter Search Keyword
    [Arguments]    ${keyword}
    Handle Advertise
    Wait Until Element Is Visible    ${INPUT_SEARCH}    30s
    Input Text    ${INPUT_SEARCH}    ${keyword}
Click Search Button
    Handle Advertise
    Wait Until Element Is Visible    ${BTN_SEARCH}    30s
    Wait Until Keyword Succeeds    30s    1s    Click Button    ${BTN_SEARCH}

Verify Search Results Contain Keyword
    [Arguments]    ${keyword}
    Wait Until Element Is Visible    ${EXPECTED_SEARCH}    30s
    ${elements}=    Get WebElements    ${EXPECTED_SEARCH}
    @{list}=    Create List
    FOR    ${el}    IN    @{elements}
        ${text}=    Get Text    ${el}
        Append To List    ${list}    ${text}
    END
    ${found}=    Set Variable    False
    ${lower_keyword}=    Convert To Lowercase    ${keyword}
    FOR    ${text}    IN    @{list}
        ${lower_text}=    Convert To Lowercase    ${text}
        IF    '${lower_keyword}' in '${lower_text}'
            ${found}=    Set Variable    True
            Exit For Loop
        END
    END
    Should Be True    ${found}

Verify No Search Results
    Wait Until Element Is Visible    ${ACTUAL_SEARCH_NOT}    30s
    ${actual}=    Get Text    ${ACTUAL_SEARCH_NOT}
    Should Be Equal    ${actual}    ${EXPECTED_SEARCH_NOT}


Verify Empty Field Message
    Run Keyword And Return    Page Should Contain    Vui lòng nhập từ khóa cần tìm kiếm

#######
Open Program Lists
    Wait Until Element Is Visible    ${URL_CTDT}    30s
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${URL_CTDT}
Verify Required Field Warning
    Wait Until Element Is Visible    ${NAME_EXPECTED}    30s
    ${NameExpected}=    Get Text    ${NAME_EXPECTED}
    ${DeparmentExpected}=    Get Text    ${DEPARTMENT_EXPECTED}
    ${TimeExpected}=    Get Text    ${TIME_EXPECTED}
    ${StatusExpected}=    Get Text    ${STATUS_EXPECTED}
    ${VersionExpected}=    Get Text    ${VERSION_EXPECTED}
    Handle Advertise
    #Wait Until Element Is Visible    ${ADVERTISE}    30s
    #Click Element    //a[@id="djHideToolBarButton"]
    Wait Until Element Is Visible    ${URL_INFO}    30s
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${URL_INFO}


    ${NameActual}=    Get Text    ${NAME_ACTUAL}
    ${DeparmentActual}=    Get Text    ${DEPARTMENT_ACTUAL}
    ${TimeActual}=    Get Text    ${TIME_ACTUAL}
    ${StatusActual}=    Get Text    ${STATUS_ACTUAL}
    ${VersionActual}=    Get Text    ${VERSION_ACTUAL}

    Should Be Equal    ${NameActual}    ${NameExpected}
    Should Contain     ${DeparmentActual}    ${DeparmentExpected}
    Should Be Equal    ${TimeExpected}    ${TimeExpected}
    Should Be Equal    ${StatusActual}    ${StatusExpected}
    Should Be Equal    ${VersionActual}    ${VersionExpected}
    Scroll Element Into View    ${DSHP_ACTUAL}
    ${Actual_Val}=    Get Text    ${DSHP_ACTUAL}
    Should Be Equal    ${Actual_Val}    ${EXPECTED_VAL}

###############  
Open Create PLO Form
    Open Program Lists
    Verify Required Field Warning
    Wait Until Element Is Visible    ${URL_PLO}    30s
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${URL_PLO}

Fill In Valid PLO Information
    [Arguments]    ${plocode}    ${description}    ${category}    ${level}    ${version}
    Wait Until Element Is Visible    ${INPUT_PLO_CODE}    30s
    Scroll Element Into View    ${INPUT_PLO_CODE}
    Input Text    ${INPUT_PLO_CODE}    ${plocode}

    Wait Until Element Is Visible    ${TEXTAREA_DESCRIPTION}    30s
    Scroll Element Into View    ${TEXTAREA_DESCRIPTION}
    Input Text    ${TEXTAREA_DESCRIPTION}    ${description}

    Wait Until Element Is Visible    ${SELECT_CATEGORY}    30s
    Scroll Element Into View    ${SELECT_CATEGORY}
    Select From List By Label    ${SELECT_CATEGORY}    ${category}

    Wait Until Element Is Visible    ${SELECT_LEVEL}    30s
    Scroll Element Into View    ${SELECT_LEVEL}
    Select From List By Label    ${SELECT_LEVEL}    ${level}

    Wait Until Element Is Visible    ${INPUT_VERSION}
    Scroll Element Into View    ${INPUT_VERSION}
    Input Text    ${INPUT_VERSION}    ${version}

Submit Forms
    Wait Until Element Is Visible    ${BTN_CREATE}    30s
    Scroll Element Into View    ${BTN_CREATE}
    Wait Until Keyword Succeeds    30s    1s    Click Button    ${BTN_CREATE}

Verify Success Message Is Displayed
    [Arguments]    ${plocode}
    ${Actual_Plo}=    Get Text    ${ACTUAL_PLO}
    Should Contain    ${Actual_Plo}    ${plocode}

Exit PLO Form Without Saving
    Wait Until Element Is Visible    ${URL_EXIT_PLO}    30s
    Scroll Element Into View    ${URL_EXIT_PLO}
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${URL_EXIT_PLO}

Verify PLO Not Created
    [Arguments]    ${plocode}
    Wait Until Element Is Visible    ${ACTUAL_PLO}    30s
    Scroll Element Into View    ${ACTUAL_PLO}
    ${Actual_Plo}=    Get Text    ${ACTUAL_PLO}
    Should Not Contain    ${Actual_Plo}    ${plocode}

Verify Duplicate Code Warning Displayed
    Page Should Contain    Plo code is unique.




Go To PLO Page
    Open Program Lists
    Handle Advertise
    Verify Required Field Warning
    Wait Until Element Is Visible    ${URL_PLO}    30s
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${URL_PLO}

Click Create PLO Button
    Wait Until Element Is Visible    ${BTN_CREATE}    30s
    Scroll Element Into View    ${BTN_CREATE}
    Wait Until Keyword Succeeds    30s    1s    Click Button    ${BTN_CREATE}
Open Create Course Form
    Open Program Lists
    Handle Advertise
    Verify Required Field Warning
    Wait Until Element Is Visible    ${URL_CREATE_SECTION_STUDY}    30s
    Scroll Element Into View    ${URL_CREATE_SECTION_STUDY}
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${URL_CREATE_SECTION_STUDY}

Fill In Valid Course Information
    [Arguments]    ${CourseCode}    ${CourseName}    ${Credits}    ${DescriptionCourse}    ${TypeCourse}    ${StatusCourse}
    Wait Until Element Is Visible    ${INPUT_COURSE_CODE}    30s
    Scroll Element Into View    ${INPUT_COURSE_CODE}
    Input Text    ${INPUT_COURSE_CODE}    ${CourseCode}
    Wait Until Element Is Visible    ${INPUT_COURSE_NAME}    30s
    Scroll Element Into View    ${INPUT_COURSE_NAME}
    Input Text    ${INPUT_COURSE_NAME}    ${CourseName}
    Wait Until Element Is Visible    ${INPUT_CREDITS}    30s
    Scroll Element Into View    ${INPUT_CREDITS}
    Input Text    ${INPUT_CREDITS}    ${Credits}
    Wait Until Element Is Visible    ${TEXTAREA_DESCRIPTION_COURSE}    30s
    Scroll Element Into View    ${TEXTAREA_DESCRIPTION_COURSE}
    Input Text    ${TEXTAREA_DESCRIPTION_COURSE}    ${DescriptionCourse}
    Wait Until Element Is Visible    ${SELECT_TYPE_COURSE}    30s
    Scroll Element Into View    ${SELECT_TYPE_COURSE}
    Select From List By Label    ${SELECT_TYPE_COURSE}    ${TypeCourse}
    Wait Until Element Is Visible    ${CHECKBOX_CORE_SUBJECT}    30s
    Scroll Element Into View    ${CHECKBOX_CORE_SUBJECT}
    Select Checkbox    ${CHECKBOX_CORE_SUBJECT}
    Wait Until Element Is Visible    ${SELECT_STATUS_COURSE}    30s
    Scroll Element Into View    ${SELECT_STATUS_COURSE}
    Select From List By Label    ${SELECT_STATUS_COURSE}    ${StatusCourse}

Submit Course Form
    Wait Until Element Is Visible    ${BTN_CREATE_COURSE}    30s
    Scroll Element Into View    ${BTN_CREATE_COURSE}
    Wait Until Keyword Succeeds    30s    1s    Click Button    ${BTN_CREATE_COURSE}

Verify Course Creation Success
    [Arguments]    ${CourseCode}    ${CourseName}    ${Credits}    ${TypeCourse}    ${StatusCourse}
    Wait Until Element Is Visible    ${MESSAGE_ACTUAL_COURSE}    30s
    ${Actual_Course_Message}=    Get Text    ${MESSAGE_ACTUAL_COURSE}
    Should Be Equal    ${Actual_Course_Message}    ${EXPECTED_SUCCESS}

    Wait Until Element Is Visible    ${ACTUAL_COURSE_CODE}    30s
    ${Actual_Course_Code}=    Get Text    ${ACTUAL_COURSE_CODE}
    Should Be Equal    ${Actual_Course_Code}    ${CourseCode}

    Wait Until Element Is Visible    ${ACTUAL_COURSE_NAME}    30s
    ${Actual_Course_Name}=    Get Text    ${ACTUAL_COURSE_NAME}
    Should Be Equal    ${Actual_Course_Name}    ${CourseName}

    Wait Until Element Is Visible    ${ACTUAL_COURSE_CREDITS}    30s
    ${Actual_Course_Credits}=    Get Text    ${ACTUAL_COURSE_CREDITS}
    Should Be Equal    ${Actual_Course_Credits}    ${Credits}

    Wait Until Element Is Visible    ${ACTUAL_COURSE_TYPE}    30s
    ${Actual_Course_Type}=    Get Text    ${ACTUAL_COURSE_TYPE}
    Should Be Equal    ${Actual_Course_Type}    ${TypeCourse}

    Wait Until Element Is Visible    ${ACTUAL_COURSE_STATUS}    30s
    ${Actual_Course_Status}=    Get Text    ${ACTUAL_COURSE_STATUS}
    Should Be Equal    ${Actual_Course_Status}    ${StatusCourse}


Open PLO Page
    Open Program Lists
    Handle Advertise
    Verify Required Field Warning
    Wait Until Element Is Visible    ${URL_CREATE_SECTION_STUDY}    30s
    Scroll Element Into View    ${URL_CREATE_SECTION_STUDY}
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${URL_CREATE_SECTION_STUDY}
Click Create Button    
    Wait Until Element Is Visible    ${BTN_CREATE_COURSE}    30s
    Scroll Element Into View    ${BTN_CREATE_COURSE}
    Wait Until Keyword Succeeds    30s    1s    Click Button    ${BTN_CREATE_COURSE}
Verify Course Creation Error    
    Wait Until Element Is Visible    //p[@id="error_1_id_course_code"]/strong    30s
    Scroll Element Into View    //p[@id="error_1_id_course_code"]/strong
    ${Message_Course_Error}=    Get Text    //p[@id="error_1_id_course_code"]/strong
    Should Be Equal    ${Message_Course_Error}    ${EXPECTED_ERROR}

Open Course Creation Page
    Open Program Lists
    Handle Advertise
    Verify Required Field Warning
    Wait Until Element Is Visible    ${URL_CREATE_SECTION_STUDY}    30s
    Scroll Element Into View    ${URL_CREATE_SECTION_STUDY}
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${URL_CREATE_SECTION_STUDY}

Fill Course Information
    [Arguments]    ${CourseCode}    ${CourseName}    ${Credits}    ${DescriptionCourse}    ${TypeCourse}    ${StatusCourse}
    Wait Until Element Is Visible    ${INPUT_COURSE_CODE}    30s
    Scroll Element Into View    ${INPUT_COURSE_CODE}
    Input Text    ${INPUT_COURSE_CODE}    ${CourseCode}

    Wait Until Element Is Visible    ${INPUT_COURSE_NAME}    30s
    Scroll Element Into View    ${INPUT_COURSE_NAME}
    Input Text    ${INPUT_COURSE_NAME}    ${CourseName}

    Wait Until Element Is Visible    ${INPUT_CREDITS}    30s
    Scroll Element Into View    ${INPUT_CREDITS}
    Input Text    ${INPUT_CREDITS}    ${Credits}

    Wait Until Element Is Visible    ${TEXTAREA_DESCRIPTION_COURSE}    30s
    Scroll Element Into View    ${TEXTAREA_DESCRIPTION_COURSE}
    Input Text    ${TEXTAREA_DESCRIPTION_COURSE}    ${DescriptionCourse}

    Wait Until Element Is Visible    ${SELECT_TYPE_COURSE}    30s
    Scroll Element Into View    ${SELECT_TYPE_COURSE}
    Select From List By Label    ${SELECT_TYPE_COURSE}    ${TypeCourse}

    Wait Until Element Is Visible    ${CHECKBOX_CORE_SUBJECT}    30s
    Scroll Element Into View    ${CHECKBOX_CORE_SUBJECT}
    Select Checkbox    ${CHECKBOX_CORE_SUBJECT}

    Wait Until Element Is Visible    ${SELECT_STATUS_COURSE}    30s
    Scroll Element Into View    ${SELECT_STATUS_COURSE}
    Select From List By Label    ${SELECT_STATUS_COURSE}    ${StatusCourse}

Submit Course Creation
    Wait Until Element Is Visible    ${BTN_CREATE_COURSE}    30s
    Scroll Element Into View    ${BTN_CREATE_COURSE}
    Wait Until Keyword Succeeds    30s    1s    Click Button    ${BTN_CREATE_COURSE}
    
    Run Keyword And Return    Page Should Contain    Course code is unique

View All Button Selection
    Wait Until Element Is Visible    ${URL_ALL_SECTION_STUDY}    30s
    Scroll Element Into View    ${URL_ALL_SECTION_STUDY}
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${URL_ALL_SECTION_STUDY}

    Wait Until Element Is Visible    ${ACTUAL_ALL_SECTION_STUDY}    30s
    ${actual_title}=    Get Text    ${ACTUAL_ALL_SECTION_STUDY}
    
    Should Contain    ${actual_title}    Courses for Công nghệ thông tin

Click The Button To View Course Details
    Wait Until Element Is Visible    //a[@href="/en/academics/courses/45/"]    30s
    Scroll Element Into View    //a[@href="/en/academics/courses/45/"]
    Wait Until Keyword Succeeds    30s    1s    Click Element    //a[@href="/en/academics/courses/45/"]

    Wait Until Element Is Visible    //h6[contains(text(),"Thông tin học phần")]    30s
    ${title_course_details}=    Get Text    //h6[contains(text(),"Thông tin học phần")]
    Should Contain    ${title_course_details}    Thông tin học phần

Click The Button To Edit Course
    Wait Until Element Is Visible    //a[@href="/en/academics/courses/45/update/"]    30s
    Scroll Element Into View    //a[@href="/en/academics/courses/45/update/"]
    Wait Until Keyword Succeeds    30s    1s    Click Element    //a[@href="/en/academics/courses/45/update/"]

    Wait Until Element Is Visible    //h1[@class="content-title"]    30s
    ${title_course_edit}=    Get Text    //h1[@class="content-title"]
    Should Contain    ${title_course_edit}    Edit Course

Click The Button Back To Course
    Wait Until Element Is Visible    ${URL_BACK_TO_COURSE}    30s
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${URL_BACK_TO_COURSE}

    Wait Until Element Is Visible    ${ACTUAL_COURSE_DETAILS}    30s
    Scroll Element Into View    ${ACTUAL_COURSE_DETAILS}
    ${back_to_page}=    Get Text    ${ACTUAL_COURSE_DETAILS}
    Should Contain    ${back_to_page}    Thông tin học phần

Click The Button Create Class
    Wait Until Element Is Visible    ${URL_CREATE_CLASS}    30s
    Scroll Element Into View    ${URL_CREATE_CLASS}
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${URL_CREATE_CLASS}

    Wait Until Element Is Visible    ${ACTUAL_CREAT_CLASS}    30s
    ${title_create_class}=    Get Text    ${ACTUAL_CREAT_CLASS}
    Should Contain    ${title_create_class}    Create New Class

Fill Out The Class Creation Form
    [Arguments]    ${semester}    ${academicyear}    ${status}    ${startdate}    ${enddate}    ${room}    ${maxstudent}    ${schedule}
    Wait Until Element Is Visible    ${INPUT_SEMESTER}    30s
    Scroll Element Into View    ${INPUT_SEMESTER}
    Input Text    ${INPUT_SEMESTER}    ${semester}

    Wait Until Element Is Visible    ${INPUT_ACADEMIC_YEAR}    30s
    Scroll Element Into View    ${INPUT_ACADEMIC_YEAR}
    Input Text    ${INPUT_ACADEMIC_YEAR}    ${academicyear}

    Wait Until Element Is Visible    ${SELECT_STATUS_CLASS}    30s
    Scroll Element Into View    ${SELECT_STATUS_CLASS}
    Select From List By Label    ${SELECT_STATUS_CLASS}    ${status}

    Wait Until Element Is Visible    ${INPUT_START_DATE}    30s
    Scroll Element Into View    ${INPUT_START_DATE}
    Input Text    ${INPUT_START_DATE}    ${startdate}
    

    Wait Until Element Is Visible    ${INPUT_END_DATE}    30s
    Scroll Element Into View    ${INPUT_END_DATE}
    Input Text    ${INPUT_END_DATE}    ${enddate}

    Wait Until Element Is Visible    ${INPUT_ROOM}    30s
    Scroll Element Into View    ${INPUT_ROOM}
    Input Text    ${INPUT_ROOM}    ${room}

    Wait Until Element Is Visible    ${INPUT_MAX_STUDENTS}    30s
    Scroll Element Into View    ${INPUT_MAX_STUDENTS}
    Input Text    ${INPUT_MAX_STUDENTS}    ${maxstudent}
    Wait Until Element Is Visible    ${TEXTATEA_SCHEDULE}    30s
    Scroll Element Into View    ${TEXTATEA_SCHEDULE}
    Input Text    ${TEXTATEA_SCHEDULE}    ${schedule}

    Wait Until Element Is Visible    ${CREAT_CLASS_BTN}    30s
    Scroll Element Into View    ${CREAT_CLASS_BTN}
    Wait Until Keyword Succeeds    30s    1s    Click Button    ${CREAT_CLASS_BTN}
Check The Class Creation Results Success
    Page Should Contain    Course created successfully!
Check The Class Creation Results Failed
    Page Should Contain    Start date and End date faild

Operation To Return To The List Of Courses
    Wait Until Element Is Visible    ${URL_BACK_TO_COURSE_DETAILS}    30s
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${URL_BACK_TO_COURSE_DETAILS}
    Wait Until Element Is Visible    ${ACTUAL_BACK_TO_COURSE_DETAILS}    30s
    ${actualback}=    Get Text    ${ACTUAL_BACK_TO_COURSE_DETAILS}
    Should Contain    ${actualback}    Courses for Công nghệ thông tin


Click The Button View CLOs
    Wait Until Element Is Visible    ${URL_PAGE_CLOS}    30s
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${URL_PAGE_CLOS}
    Wait Until Element Is Visible    ${ACTUAL_TITLE_CLOS}    30s
    ${title_clos}=    Get Text    ${ACTUAL_TITLE_CLOS}
    Should Contain    ${title_clos}    ${CLOS}


Open Operation With Add CLO Button
    Wait Until Element Is Visible    ${URL_ADD_CLO}    30s
    Scroll Element Into View    ${URL_ADD_CLO}
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${URL_ADD_CLO}

Fill Out The CLO Creation Form
    [Arguments]    ${Clocode}    ${Description}    ${Category}    ${Level}    ${Weight}    ${Assessmentmethod}
    Wait Until Element Is Visible    ${INPUT_CLO_CODE}    30s
    Scroll Element Into View    ${INPUT_CLO_CODE}
    Input Text    ${INPUT_CLO_CODE}    ${Clocode}
    
    Wait Until Element Is Visible    ${TEXTAREA_DESCRIPTION_CLO}    30s
    Scroll Element Into View    ${TEXTAREA_DESCRIPTION_CLO}
    Input Text    ${TEXTAREA_DESCRIPTION_CLO}    ${Description}
    
    
    Wait Until Element Is Visible    ${SELECT_CATEGORY_CLO}    30s
    Scroll Element Into View    ${SELECT_CATEGORY_CLO}
    Select From List By Label   ${SELECT_CATEGORY_CLO}    ${Category}
    
    Wait Until Element Is Visible    ${SELECT_LEVEL_CLO}    30s
    Scroll Element Into View    ${SELECT_LEVEL_CLO}
    Select From List By Label    ${SELECT_LEVEL_CLO}    ${Level}
    
    Wait Until Element Is Visible    ${INPUT_WEIGHT_CLO}    30s
    Scroll Element Into View    ${INPUT_WEIGHT_CLO}
    Input Text   ${INPUT_WEIGHT_CLO}    ${Weight}
    
    Wait Until Element Is Visible    ${SELECT_ASSESSMENT_METHOD}    30s
    Scroll Element Into View    ${SELECT_ASSESSMENT_METHOD}
    Select From List By Label    ${SELECT_ASSESSMENT_METHOD}    ${Assessmentmethod}
  
Click The Button Create CLO
    Wait Until Element Is Visible    ${CREATE_CLO_BTN}    30s
    Scroll Element Into View    ${CREATE_CLO_BTN}
    Wait Until Keyword Succeeds    30s    1s    Click Button    ${CREATE_CLO_BTN}

Verify New CLO Creation Results
    [Arguments]    ${Clocode}    ${Description}    ${Category}    ${Level}    ${Weight}
    Wait Until Element Is Visible    ${ACTUAL_MESSAGE_CLO}    30s
    ${actual_message_clo}=    Get Text    ${ACTUAL_MESSAGE_CLO}
    Should Be Equal    ${actual_message_clo}    ${EXPECTED_MESSAGE_CLO}
    
    Wait Until Element Is Visible    ${ACTUAL_CLO_CODE}    30s
    Scroll Element Into View    ${ACTUAL_CLO_CODE}
    ${actual_clo_code}=    Get Text    ${ACTUAL_CLO_CODE}
    Should Be Equal    ${actual_clo_code}    ${Clocode}

    Wait Until Element Is Visible    ${ACTUAL_DESCRIPTION_CLO}    30s
    ${actual_description_clo}=    Get Text    ${ACTUAL_DESCRIPTION_CLO}
    Should Be Equal    ${actual_description_clo}    ${Description}

    Wait Until Element Is Visible    ${ACTUAL_CATEGORY_CLO}    30s
    ${actual_category_clo}=    Get Text    ${ACTUAL_CATEGORY_CLO}
    Should Be Equal    ${actual_category_clo}    ${Category}

    Wait Until Element Is Visible    ${ACTUAL_LEVEL_CLO}    30s
    ${actual_level_clo}=    Get Text    ${ACTUAL_LEVEL_CLO}
    Should Be Equal    ${actual_level_clo}    ${Level}

    Wait Until Element Is Visible    ${ACTUAL_WEIGHT_CLO}    30s
    ${actual_weight}=    Get Text    ${ACTUAL_WEIGHT_CLO}
    Should Contain    ${actual_weight}    ${Weight}
    
 Verify Message CLO Creation Results   
     Wait Until Element Is Visible    ${ACTUAL_MESSAGE_CLO_ERROR}    30s
     ${actual_message_clo_error}=    Get Text    ${ACTUAL_MESSAGE_CLO_ERROR}
     Should Be Equal    ${actual_message_clo_error}    This field is required.
       
Verify Error Message Mhen Code is Duplicated
    Page Should Contain    Clo code is unique

Click The Button Back To CLOs
    Wait Until Element Is Visible    ${URL_BACK_TO_CLOS}    30s
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${URL_BACK_TO_CLOS}
    Wait Until Element Is Visible    ${ACTUAL_TITLE_CLOS}    30s
    ${title_clos}=    Get Text    ${ACTUAL_TITLE_CLOS}
    Should Contain    ${title_clos}    ${CLOS}

View Details CLOs
    Wait Until Element Is Visible    ${URL_DETAILS_CLOS}    30s
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${URL_DETAILS_CLOS}
    Wait Until Element Is Visible    ${TITLE_PAGE_DETAIL_CLOS}    30s
    ${page_title}=    Get Text    ${TITLE_PAGE_DETAIL_CLOS}
    Should Be Equal    ${page_title}    ${TITLE_CLO_DETAIL}
View Edit CLOs
    Wait Until Element Is Visible    ${URL_EDIT_CLOS}    30s
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${URL_EDIT_CLOS}
    Wait Until Element Is Visible    ${TITLE_PAGE_EDIT_CLOS}    30s
    ${page_title}=    Get Text    ${TITLE_PAGE_EDIT_CLOS}
    Should Be Equal    ${page_title}    Edit CLO
