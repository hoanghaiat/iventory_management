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
${EXPECTED_MESSAGE_UPDATE_CLO}    CLO updated successfully!
${TITLE_ADD_CLO}    Create New CLO
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
    ${id}    Set Variable    5
    Handle Advertise
    #Wait Until Element Is Visible    ${ADVERTISE}    30s
    #Click Element    //a[@id="djHideToolBarButton"]
    Wait Until Element Is Visible    //a[@href="/en/academics/programs/${id}/"]    30s
    Wait Until Keyword Succeeds    30s    1s    Click Element    //a[@href="/en/academics/programs/${id}/"]


###############  
Open Create PLO Form
    ${id}    Set Variable    5
    Open Program Lists
    Verify Required Field Warning
    Wait Until Element Is Visible    //a[@href="/en/academics/programs/${id}/plos/create/"]    30s
    Scroll Element Into View    //a[@href="/en/academics/programs/${id}/plos/create/"]
    Wait Until Keyword Succeeds    30s    1s    Click Element    //a[@href="/en/academics/programs/${id}/plos/create/"]

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
    ${id}    Set Variable    5
    Wait Until Element Is Visible    //a[@href="/en/academics/programs/${id}/" and @class = "btn btn-secondary"]    30s
    Scroll Element Into View    //a[@href="/en/academics/programs/${id}/" and @class = "btn btn-secondary"]
    Wait Until Keyword Succeeds    30s    1s    Click Element    //a[@href="/en/academics/programs/${id}/" and @class = "btn btn-secondary"]

Verify PLO Not Created
    [Arguments]    ${plocode}
    Wait Until Element Is Visible    ${ACTUAL_PLO}    30s
    Scroll Element Into View    ${ACTUAL_PLO}
    ${Actual_Plo}=    Get Text    ${ACTUAL_PLO}
    Should Not Contain    ${Actual_Plo}    ${plocode}

Verify Duplicate Code Warning Displayed
    Page Should Contain    Plo code is unique.




Go To PLO Page
    ${id}    Set Variable    5
    Open Program Lists
    Handle Advertise
    Verify Required Field Warning
    Wait Until Element Is Visible    //a[@href="/en/academics/programs/${id}/plos/create/"]    30s
    Scroll Element Into View    //a[@href="/en/academics/programs/${id}/plos/create/"]
    Wait Until Keyword Succeeds    30s    1s    Click Element    //a[@href="/en/academics/programs/${id}/plos/create/"]

Click Create PLO Button
    Wait Until Element Is Visible    ${BTN_CREATE}    30s
    Scroll Element Into View    ${BTN_CREATE}
    Wait Until Keyword Succeeds    30s    1s    Click Button    ${BTN_CREATE}
Open Create Course Form
    ${id}    Set Variable    5
    Open Program Lists
    Handle Advertise
    Verify Required Field Warning
    Wait Until Element Is Visible    //a[@href="/en/academics/programs/${id}/courses/create/"]    30s
    Scroll Element Into View    //a[@href="/en/academics/programs/${id}/courses/create/"]
    Wait Until Keyword Succeeds    30s    1s    Click Element    //a[@href="/en/academics/programs/${id}/courses/create/"]

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
    ${id}    Set Variable    5
    Open Program Lists
    Handle Advertise
    Verify Required Field Warning
    Wait Until Element Is Visible    //a[@href="/en/academics/programs/${id}/courses/create/"]    30s
    Scroll Element Into View    //a[@href="/en/academics/programs/${id}/courses/create/"]
    Wait Until Keyword Succeeds    30s    1s    Click Element    //a[@href="/en/academics/programs/${id}/courses/create/"]

Verify Course Creation Error    
    Wait Until Element Is Visible    //p[@id="error_1_id_course_code"]/strong    30s
    Scroll Element Into View    //p[@id="error_1_id_course_code"]/strong
    ${Message_Course_Error}=    Get Text    //p[@id="error_1_id_course_code"]/strong
    Should Be Equal    ${Message_Course_Error}    ${EXPECTED_ERROR}




Open Course Creation Page
    ${id}    Set Variable    5
    ${SectionStudy}    Replace Variables    ${URL_CREATE_SECTION_STUDY}
    Open Program Lists
    Handle Advertise
    Verify Required Field Warning

    Wait Until Element Is Visible    ${SectionStudy}     30s
    Scroll Element Into View    ${SectionStudy}
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${SectionStudy}

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
    
    Page Should Contain    Course code is unique

View All Button Selection
    ${id}    Set Variable    5
    ${AllSectionStudy}    Replace Variables    ${URL_ALL_SECTION_STUDY}
    
    Wait Until Element Is Visible    ${AllSectionStudy}    30s
    Scroll Element Into View    ${AllSectionStudy}
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${AllSectionStudy}

    Wait Until Element Is Visible    ${ACTUAL_ALL_SECTION_STUDY}    30s
    ${actual_title}=    Get Text    ${ACTUAL_ALL_SECTION_STUDY}
    
    Should Contain    ${actual_title}    Courses for Công nghệ thông tin

Click The Button To View Course Details
    ${id}    Set Variable    45
    ${coursedetail}    Replace Variables    ${URL_COURSE_DETAILS}
    Wait Until Element Is Visible    ${coursedetail}    30s
    Scroll Element Into View    ${coursedetail}
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${coursedetail}

    Wait Until Element Is Visible    //h6[contains(text(),"Thông tin học phần")]    30s
    ${title_course_details}=    Get Text    //h6[contains(text(),"Thông tin học phần")]
    Should Contain    ${title_course_details}    Thông tin học phần

Click The Button To Edit Course
    ${id}    Set Variable    45
    ${upcourse}    Replace Variables    ${URL_EDIT_COURSE}
    Wait Until Element Is Visible    ${upcourse}    30s
    Scroll Element Into View    ${upcourse}
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${upcourse}

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
    ${id}    Set Variable    45
    ${urlcreateclass}    Replace Variables    ${URL_CREATE_CLASS}
    Wait Until Element Is Visible    ${urlcreateclass}    30s
    Scroll Element Into View    ${urlcreateclass}
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${urlcreateclass}

    Wait Until Element Is Visible    ${ACTUAL_CREATE_CLASS}    30s
    ${title_create_class}=    Get Text    ${ACTUAL_CREATE_CLASS}
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
    ${id}    Set Variable    5
    ${urlbacktocourse}    Replace Variables    ${URL_BACK_TO_COURSE_DETAILS}
    Wait Until Element Is Visible    ${urlbacktocourse}    30s
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${urlbacktocourse}
    Wait Until Element Is Visible    ${ACTUAL_BACK_TO_COURSE_DETAILS}    30s
    ${actualback}=    Get Text    ${ACTUAL_BACK_TO_COURSE_DETAILS}
    Should Contain    ${actualback}    Courses for Công nghệ thông tin


Click The Button View CLOs
    ${id}    Set Variable    45
    ${urlclos}    Replace Variables    ${URL_PAGE_CLOS}
    Wait Until Element Is Visible    ${urlclos}    30s
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${urlclos}
    Wait Until Element Is Visible    ${ACTUAL_TITLE_CLOS}    30s
    ${title_clos}=    Get Text    ${ACTUAL_TITLE_CLOS}
    Should Contain    ${title_clos}    ${CLOS}


Open Operation With Add CLO Button
    ${id}    Set Variable    45
    ${urladd}    Replace Variables    ${URL_ADD_CLO}
    Wait Until Element Is Visible    ${urladd}    30s
    Scroll Element Into View    ${urladd}
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${urladd}

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
    ${id}    Set Variable    45
    ${urlbacktocourse}    Replace Variables    ${URL_BACK_TO_CLOS}
    Wait Until Element Is Visible    ${urlbacktocourse}   30s
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${urlbacktocourse}
    Wait Until Element Is Visible    ${ACTUAL_TITLE_CLOS}    30s
    ${title_clos}=    Get Text    ${ACTUAL_TITLE_CLOS}
    Should Contain    ${title_clos}    ${CLOS}

View Details CLOs
    ${id}    Set Variable    122
    ${urldetailclos}    Replace Variables    ${URL_DETAILS_CLOS}
    Wait Until Element Is Visible    ${urldetailclos}    30s
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${urldetailclos}
    Wait Until Element Is Visible    ${TITLE_PAGE_DETAIL_CLOS}    30s
    ${page_title}=    Get Text    ${TITLE_PAGE_DETAIL_CLOS}
    Should Be Equal    ${page_title}    ${TITLE_CLO_DETAIL}
View Edit CLOs
    ${id}    Set Variable    122
    ${urledit}    Replace Variables    ${URL_EDIT_CLOS}
    Wait Until Element Is Visible   ${urledit}    30s
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${urledit}
    Wait Until Element Is Visible    ${TITLE_PAGE_EDIT_CLOS}    30s
    ${page_title}=    Get Text    ${TITLE_PAGE_EDIT_CLOS}
    Should Be Equal    ${page_title}    Edit CLO
View Map PLO
    ${id}    Set Variable    122
    ${urlplo}    Replace Variables    ${URL_PLO}
    Wait Until Element Is Visible    ${urlplo}    30s
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${urlplo}
    Wait Until Element Is Visible    ${TITLE_PLO}    30s
    ${page_title}=    Get Text    ${TITLE_PLO}
    Should Be Equal    ${page_title}    Map CLO to PLO

Create Mapping PLOs
    [Arguments]    ${Plo}    ${MappingPlo}
    Wait Until Element Is Visible    ${SELECT_PLO}    30s
    Scroll Element Into View    ${SELECT_PLO}
    Select From List By Label    ${SELECT_PLO}    ${Plo}
    Wait Until Element Is Visible    ${SELECT_MAPPING_PLO}    30s
    Scroll Element Into View    ${SELECT_MAPPING_PLO}
    Select From List By Label    ${SELECT_MAPPING_PLO}    ${MappingPlo}
    Wait Until Element Is Visible    ${CREATE_MAPPING_BTN}    30s
    Scroll Element Into View    ${CREATE_MAPPING_BTN}
    Wait Until Keyword Succeeds    30s    1s    Click Button    ${CREATE_MAPPING_BTN}
    Wait Until Element Is Visible    ${ACTUAL_MESSAGE_MAPPING}    30s
    ${actual_message_mapping}=    Get Text    ${ACTUAL_MESSAGE_MAPPING}
    Should Be Equal    ${actual_message_mapping}    PLO-CLO Mapping created successfully!

Click The Button Edit CLOs
    ${id}    Set Variable    123
    ${urledit}    Replace Variables    ${URL_EDIT_CLO}
    Wait Until Element Is Visible    ${urledit}    30s
    Scroll Element Into View    ${urledit}
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${urledit}
Fill Out The CLO Edit Form
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
  
Click The Button Edit CLO
    Wait Until Element Is Visible    ${EDIT_CLOS_BTN}    30s
    Scroll Element Into View    ${EDIT_CLOS_BTN}
    Wait Until Keyword Succeeds    30s    1s    Click Button    ${EDIT_CLOS_BTN}

Verify Message CLO Edit Results 
    Wait Until Element Is Visible    ${MESSAGE_UPDATE_CLOS}    30s
    ${message_up_clos}=    Get Text    ${MESSAGE_UPDATE_CLOS}
    Should Be Equal    ${message_up_clos}    ${EXPECTED_MESSAGE_UPDATE_CLO}
Verify CLO Edit Results  
    [Arguments]    ${clocodeup}  ${descriptionup}  ${categoryup}   ${levelup}    ${weightup}       ${assessmentmethodup}
    Wait Until Element Is Visible    ${MESSAGE_UPDATE_CLOS}    30s
    ${actualmessage}=    Get Text    ${MESSAGE_UPDATE_CLOS}
    Wait Until Element Is Visible    ${ACTUAL_UPDATE_CLOCODE_CLOS}    30s
    Scroll Element Into View    ${ACTUAL_UPDATE_CLOCODE_CLOS}
    ${actual_code_up}=    Get Text    ${ACTUAL_UPDATE_CLOCODE_CLOS}
    Wait Until Element Is Visible    ${ACTUAL_UPDATE_CATEGORY_CLOS}    30s
    Scroll Element Into View    ${ACTUAL_UPDATE_CATEGORY_CLOS}
    ${actual_category_up}=    Get Text    ${ACTUAL_UPDATE_CATEGORY_CLOS}
    Scroll Element Into View    ${ACTUAL_UPDATE_LEVEL_CLOS}    
    ${actual_level_up}=    Get Text    ${ACTUAL_UPDATE_LEVEL_CLOS}
    Wait Until Element Is Visible    ${ACTUAL_UPDATE_WEIGHT_CLOS}    30s
    ${actual_weight_up}=    Get Text    ${ACTUAL_UPDATE_WEIGHT_CLOS}
    Wait Until Element Is Visible    ${ACTUAL_UPDATE_DESCRIPTION_CLOS}    30s
    Scroll Element Into View    ${ACTUAL_UPDATE_DESCRIPTION_CLOS}
    ${actual_description_up}=    Get Text    ${ACTUAL_UPDATE_DESCRIPTION_CLOS}
    Wait Until Element Is Visible    ${ACTUAL_UPDATE_ASSESSMENT_CLOS}    30s
    Scroll Element Into View    ${ACTUAL_UPDATE_ASSESSMENT_CLOS}
    ${actual_assessmentmethod_up}=    Get Text    ${ACTUAL_UPDATE_ASSESSMENT_CLOS}
    ##Verify
    Should Be Equal    ${actualmessage}    CLO updated successfully!
    Should Be Equal    ${actual_code_up}    ${clocodeup}
    Should Be Equal    ${actual_description_up}    ${descriptionup}
    Should Be Equal    ${actual_category_up}    ${categoryup}
    Should Be Equal    ${actual_level_up}    ${levelup}
    Should Contain    ${actual_weight_up}    ${weightup}
    
    Should Be Equal    ${actual_assessmentmethod_up}    ${assessmentmethodup}
    
Verify Message CLO Edit Results With Clo Code Duplication
    Page Should Contain    Clo code is unique
Click The Button Quick ADD CLO
    ${id}    Set Variable    45
    ${urladd}    Replace Variables    ${URL_ADD_CLO_QUICK}
    Wait Until Element Is Visible    ${urladd}    30s
    Scroll Element Into View    ${urladd}
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${urladd}
Verify Title Page CLo
    Page Should Contain    ${TITLE_ADD_CLO}

Click The Button ADD Chapter
    ${id}    Set Variable    45
    ${urladdchapter}    Replace Variables    ${URL_ADD_CHAPTER}
    Wait Until Element Is Visible    ${urladdchapter}    30s
    Scroll Element Into View    ${urladdchapter}
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${urladdchapter}
Verify Title Page Add Chapter
    Page Should Contain    Thêm chương mới

Fill Out The ADD Chapter Form
    [Arguments]    ${chapternumber}    ${chaptertitle}    ${chapterdescription}    ${chapterleaning}    ${chaptertime}    ${chapterteaching}    
    Wait Until Element Is Visible    ${INPUT_CHAPTER_NUMBER}    30s
    Scroll Element Into View    ${INPUT_CHAPTER_NUMBER}
    Input Text    ${INPUT_CHAPTER_NUMBER}    ${chapternumber}
    Wait Until Element Is Visible    ${INPUT_CHAPTER_TITLE}    30s
    Scroll Element Into View    ${INPUT_CHAPTER_TITLE}
    Input Text    ${INPUT_CHAPTER_TITLE}    ${chaptertitle}
    Wait Until Element Is Visible    ${TEXTAREA_CHAPTER_DESCRIPTION}    30s
    Scroll Element Into View    ${TEXTAREA_CHAPTER_DESCRIPTION}
    Input Text    ${TEXTAREA_CHAPTER_DESCRIPTION}    ${chapterdescription}
    Wait Until Element Is Visible    ${TEXTAREA_CHAPTER_LEARNING}    30s
    Scroll Element Into View    ${TEXTAREA_CHAPTER_LEARNING}
    Input Text    ${TEXTAREA_CHAPTER_LEARNING}    ${chapterleaning}
    Wait Until Element Is Visible    ${INPUT_CHAPTER_TIME}    30s
    Scroll Element Into View    ${INPUT_CHAPTER_TIME}
    Input Text    ${INPUT_CHAPTER_TIME}   ${chaptertime}
    Wait Until Element Is Visible    ${TEXTAREA_CHAPTER_TEACHING_METHOD}    30s
    Scroll Element Into View    ${TEXTAREA_CHAPTER_TEACHING_METHOD}
    Input Text    ${TEXTAREA_CHAPTER_TEACHING_METHOD}    ${chapterteaching}

Click The Button ADD 
    Wait Until Element Is Visible    ${CREATE_CHAPTER_BTN}    30s
    Scroll Element Into View    ${CREATE_CHAPTER_BTN}
    Wait Until Keyword Succeeds    30s    1s    Click Button    ${CREATE_CHAPTER_BTN}
Click The Button Exit Chapter
    ${id}    Set Variable    45
    ${urlexit}    Replace Variables    ${URL_EXIT_CHAPTER}
    Wait Until Element Is Visible    ${urlexit}    30s
    Scroll Element Into View    ${urlexit}
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${urlexit}

Verify Page When Number0
    Page Should Contain    Số lương phải lớn hơn 0

Fill Out Form Title Chapter Blank
    [Arguments]    ${chapternumber}    ${chapterdescription}    ${chapterleaning}    ${chaptertime}    ${chapterteaching}    
    Wait Until Element Is Visible    ${INPUT_CHAPTER_NUMBER}    30s
    Scroll Element Into View    ${INPUT_CHAPTER_NUMBER}
    Input Text    ${INPUT_CHAPTER_NUMBER}    ${chapternumber}
    
    Wait Until Element Is Visible    ${TEXTAREA_CHAPTER_DESCRIPTION}    30s
    Scroll Element Into View    ${TEXTAREA_CHAPTER_DESCRIPTION}
    Input Text    ${TEXTAREA_CHAPTER_DESCRIPTION}    ${chapterdescription}
    Wait Until Element Is Visible    ${TEXTAREA_CHAPTER_LEARNING}    30s
    Scroll Element Into View    ${TEXTAREA_CHAPTER_LEARNING}
    Input Text    ${TEXTAREA_CHAPTER_LEARNING}    ${chapterleaning}
    Wait Until Element Is Visible    ${INPUT_CHAPTER_TIME}    30s
    Scroll Element Into View    ${INPUT_CHAPTER_TIME}
    Input Text    ${INPUT_CHAPTER_TIME}   ${chaptertime}
    Wait Until Element Is Visible    ${TEXTAREA_CHAPTER_TEACHING_METHOD}    30s
    Scroll Element Into View    ${TEXTAREA_CHAPTER_TEACHING_METHOD}
    Input Text    ${TEXTAREA_CHAPTER_TEACHING_METHOD}    ${chapterteaching}

Verify Page When Title Blank
    Page Should Contain    Tiêu đề chương không được để trống

Click The Button Add Test
    ${id}    Set Variable    45
    ${urltest}    Replace Variables    ${URL_ADD_TEST}
    Wait Until Element Is Visible    ${urltest}    30s
    Scroll Element Into View    ${urltest}
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${urltest}

Verify Page Test
    Page Should Contain    Thêm đánh giá mới

Fill Our The Test Form
    [Arguments]    ${name}    ${type}    ${percentage}    ${description}    ${format}    ${minutes}    ${totalmarks}    ${method}    ${criteria}    ${date}    ${location}    ${status}
    Wait Until Element Is Visible    ${INPUT_TEST_NAME}    30s
    Scroll Element Into View    ${INPUT_TEST_NAME}
    Input Text    ${INPUT_TEST_NAME}    ${name}
    Wait Until Element Is Visible    ${SELECT_TEST_TYPE}    30s
    Scroll Element Into View    ${SELECT_TEST_TYPE}
    Select From List By Label    ${SELECT_TEST_TYPE}    ${type}
    Wait Until Element Is Visible    ${INPUT_TEST_PERCENTAGE}    30s
    Scroll Element Into View    ${INPUT_TEST_PERCENTAGE}
    Input Text    ${INPUT_TEST_PERCENTAGE}    ${percentage}
    Wait Until Element Is Visible    ${TEXTAREA_TEST_DESCRIPTION}    30s
    Scroll Element Into View    ${TEXTAREA_TEST_DESCRIPTION}
    Input Text    ${TEXTAREA_TEST_DESCRIPTION}    ${description}
    Wait Until Element Is Visible    ${SELECT_TEST_FORMAT}    30s
    Scroll Element Into View    ${SELECT_TEST_FORMAT}    
    Select From List By Label    ${SELECT_TEST_FORMAT}    ${format}
    Wait Until Element Is Visible    ${INPUT_TEST_MINUTES}    30s
    Scroll Element Into View    ${INPUT_TEST_MINUTES}
    Input Text    ${INPUT_TEST_MINUTES}    ${minutes}
    Scroll Element Into View    ${INPUT_TEST_TOTAL_MARKS}
    Input Text    ${INPUT_TEST_TOTAL_MARKS}    ${totalmarks}
    Scroll Element Into View    ${TEXTAREA_TEST_METHOD}
    Input Text    ${TEXTAREA_TEST_METHOD}    ${method}
    Scroll Element Into View    ${TEXTAREA_TEST_CRITERIA}
    Input Text    ${TEXTAREA_TEST_CRITERIA}    ${criteria}
    
    Scroll Element Into View    ${INPUT_TEST_DATE}

    Input Text    ${INPUT_TEST_DATE}    ${date}

    Scroll Element Into View    ${INPUT_TEST_LOCATION}    
    Input Text    ${INPUT_TEST_LOCATION}    ${location}
    Scroll Element Into View    ${SELECT_TEST_STATUS}
    Select From List By Label    ${SELECT_TEST_STATUS}    ${status}

Click The Button Create Test
    Wait Until Element Is Visible    ${CREATE_TEST_BTN}    30s
    Scroll Element Into View    ${CREATE_TEST_BTN}
    Wait Until Keyword Succeeds    30s    1s    Click Button    ${CREATE_TEST_BTN}

Click The Button Exit Create Test
    ${id}    Set Variable    45
    ${exit}    Replace Variables    ${URL_EXIT_TEST}
    Wait Until Element Is Visible    ${exit}    30s
    Scroll Element Into View    ${exit}
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${exit}

Verify Page When Form Create Test Blank Information
    Page Should Contain    Vui lòng điền đầy đủ thông tin

Click The Button Course 
    ${id}    Set Variable    5
    ${urlcourse}    Replace Variables    ${URL_COURSE}
    Handle Advertise
    Wait Until Element Is Visible    ${urlcourse}    30s
    Wait Until Element Is Visible    ${NAME_COURSE}    30s
    ${namecourse}=    Get Text    ${NAME_COURSE}

    Scroll Element Into View    ${urlcourse}
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${urlcourse}
    Wait Until Element Is Visible    ${ACTUAL_PAGE_COURSE}    30s
    ${actualcourse}=    Get Text    ${ACTUAL_PAGE_COURSE}
    Should Contain    ${actualcourse}    ${namecourse}
Click The Button ADD Course
    ${id}    Set Variable    5
    ${urlcourse}    Replace Variables    ${URL_ADD_COURSE}
    Wait Until Element Is Visible    ${urlcourse}    30s
    Scroll Element Into View    ${urlcourse}
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${urlcourse}
    Wait Until Element Is Visible    ${ACTUAL_ADD_COURSE}    30s
    ${actualadd}=    Get Text    ${ACTUAL_ADD_COURSE}
    Should Be Equal    ${actualadd}    Create New Course

Click The Button Back to Program
    Wait Until Element Is Visible    ${URL_BACK_TO_PROGRAM}    30s
    Scroll Element Into View    ${URL_BACK_TO_PROGRAM}
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${URL_BACK_TO_PROGRAM}
    ${actualprogarm}=    Get Text    //h1[@class="content-title"]
    Should Be Equal    ${actualprogarm}    Quản lý chương trình


Click The Button Infomation Course
    ${id}    Set Variable    2
    ${urlcourse}    Replace Variables    ${URL_COURSE_INFO}
    ${code}    Replace Variables    ${CODE_COURSE}
    ${name}    Replace Variables    ${NAME_COURSE_INFO}

    Wait Until Element Is Visible    ${urlcourse}   30s
    Wait Until Element Is Visible    ${code}    30s
    Wait Until Element Is Visible    ${name}   30s
    ${codecourse}=    Get Text    ${code}
    ${namecourse}=    Get Text    ${name}
    Scroll Element Into View    ${urlcourse}
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${urlcourse}
    Wait Until Element Is Visible    ${ACTUAL_COURSE_INFO}    30s
    ${actualinfo}=    Get Text    ${ACTUAL_COURSE_INFO}
    Should Contain    ${actualinfo}    ${codecourse}
    Should Contain    ${actualinfo}    ${namecourse}

Click The Button Edit Course
    Wait Until Element Is Visible    ${URL_EDIT_COURSES}    30s
    Scroll Element Into View    ${URL_EDIT_COURSES}
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${URL_EDIT_COURSES}
    Page Should Contain    Edit Course

Click The Button CLOs
    ${id}    Set Variable    2
    ${urledit}    Replace Variables    ${URL_CLOS}
    ${code}    Replace Variables    ${CODE_COURSE}
    ${name}    Replace Variables    ${NAME_COURSE_INFO}
    Wait Until Element Is Visible    ${urledit}    30s
    Wait Until Element Is Visible    ${code}    30s
    Wait Until Element Is Visible    ${name}    30s
    ${codecourse}=    Get Text    ${code}
    ${namecourse}=    Get Text    ${name}
    Scroll Element Into View    ${urledit}
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${urledit}
    Wait Until Element Is Visible    ${ACTUAL_COURSE_INFO}    30s
    ${actualinfo}=    Get Text    ${ACTUAL_COURSE_INFO}
    Should Contain    ${actualinfo}    CLOs
    Should Contain    ${actualinfo}    ${codecourse}
    Should Contain    ${actualinfo}    ${namecourse}
    