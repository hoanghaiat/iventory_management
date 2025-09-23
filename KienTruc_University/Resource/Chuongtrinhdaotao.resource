*** Settings ***
Library    SeleniumLibrary    run_on_failure=Nothing
Library    String
Library    Collections
Library    XML
Variables    ../locator.py
Resource    ../Resource/DangNhap.resource

*** Variables ***
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
    ${EXPECTED_TITLE}    Set Variable    Quản lý chương trình
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

    ${lower_keyword}=    Convert To Lowercase    ${keyword}
    FOR    ${text}    IN    @{list}
        ${lower_text}=    Convert To Lowercase    ${text}
        Should Contain    ${lower_text}    ${lower_keyword}
    END

Verify No Search Results
    ${EXPECTED_SEARCH_NOT}    Set Variable    No programs found.
    Wait Until Element Is Visible    ${ACTUAL_SEARCH_NOT}    30s
    ${actual}=    Get Text    ${ACTUAL_SEARCH_NOT}
    Should Be Equal    ${actual}    ${EXPECTED_SEARCH_NOT}

Verify Empty Field Message
    Run Keyword And Return    Page Should Contain    Vui lòng nhập từ khóa cần tìm kiếm

#######
Verify Required Field Warning
    ${id}    Set Variable    5
    Handle Advertise
    #Wait Until Element Is Visible    ${ADVERTISE}    30s
    #Click Element    //a[@id="djHideToolBarButton"]
    Wait Until Element Is Visible    //a[@href="/en/academics/programs/${id}/"]    30s
    Wait Until Keyword Succeeds    30s    1s    Click Element    //a[@href="/en/academics/programs/${id}/"]

Open Create PLO Form
    ${id}    Set Variable    5
    Open Program Page
    Verify Required Field Warning
    Wait Until Element Is Visible    //a[@href="/en/academics/programs/${id}/plos/create/"]    30s
    Scroll Element Into View    //a[@href="/en/academics/programs/${id}/plos/create/"]
    Wait Until Keyword Succeeds    30s    1s    Click Element    //a[@href="/en/academics/programs/${id}/plos/create/"]

Fill In Valid PLO Information
    [Arguments]    ${plocode}    ${description}    ${category}    ${level}    ${version}
    Fill Text Field    ${INPUT_PLO_CODE}    ${plocode}
    Fill Text Field    ${TEXTAREA_DESCRIPTION}    ${description}
    Fill Dropdown    ${SELECT_CATEGORY}    ${category}
    Fill Dropdown    ${SELECT_LEVEL}    ${level}
    Fill Text Field    ${INPUT_VERSION}    ${version}

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
    Open Program Page
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
    Open Program Page
    Handle Advertise
    Verify Required Field Warning
    Wait Until Element Is Visible    //a[@href="/en/academics/programs/${id}/courses/create/"]    30s
    Scroll Element Into View    //a[@href="/en/academics/programs/${id}/courses/create/"]
    Wait Until Keyword Succeeds    30s    1s    Click Element    //a[@href="/en/academics/programs/${id}/courses/create/"]

Fill In Valid Course Information
    [Arguments]    ${CourseCode}    ${CourseName}    ${Credits}    ${DescriptionCourse}    ${TypeCourse}    ${StatusCourse}
    Fill Text Field    ${INPUT_COURSE_CODE}    ${CourseCode}
    Fill Text Field    ${INPUT_COURSE_NAME}    ${CourseName}
    Fill Text Field    ${INPUT_CREDITS}    ${Credits}
    Fill Text Field    ${TEXTAREA_DESCRIPTION_COURSE}    ${DescriptionCourse}
    Fill Dropdown    ${SELECT_TYPE_COURSE}    ${TypeCourse}
    Fill Checkbox    ${CHECKBOX_CORE_SUBJECT}
    Fill Dropdown    ${SELECT_STATUS_COURSE}    ${StatusCourse}

Submit Course Form
    Wait Until Element Is Visible    ${BTN_CREATE_COURSE}    30s
    Scroll Element Into View    ${BTN_CREATE_COURSE}
    Wait Until Keyword Succeeds    30s    1s    Click Button    ${BTN_CREATE_COURSE}

Verify Course Creation Success
    ${EXPECTED_SUCCESS}    Set Variable    Course created successfully!
    [Arguments]    ${CourseCode}    ${CourseName}    ${Credits}    ${TypeCourse}    ${StatusCourse}

    Wait Until Element Is Visible    ${MESSAGE_ACTUAL_COURSE}    30s
    ${Actual_Course_Message}=    Get Text    ${MESSAGE_ACTUAL_COURSE}
    Verify Text Equal    ${MESSAGE_ACTUAL_COURSE}    ${EXPECTED_SUCCESS}
    Verify Text Equal    ${ACTUAL_COURSE_CODE}       ${CourseCode}
    Verify Text Equal    ${ACTUAL_COURSE_NAME}       ${CourseName}
    Verify Text Equal    ${ACTUAL_COURSE_CREDITS}    ${Credits}
    Verify Text Equal    ${ACTUAL_COURSE_TYPE}       ${TypeCourse}
    Verify Text Equal    ${ACTUAL_COURSE_STATUS}     ${StatusCourse}

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

Open PLO Page
    ${id}    Set Variable    5
    Open Program Page
    Handle Advertise
    Verify Required Field Warning
    Wait Until Element Is Visible    //a[@href="/en/academics/programs/${id}/courses/create/"]    30s
    Scroll Element Into View    //a[@href="/en/academics/programs/${id}/courses/create/"]
    Wait Until Keyword Succeeds    30s    1s    Click Element    //a[@href="/en/academics/programs/${id}/courses/create/"]

Verify Course Creation Error 
    ${EXPECTED_ERROR}    Set Variable    This field is required.   
    Wait Until Element Is Visible    //p[@id="error_1_id_course_code"]/strong    30s
    Scroll Element Into View    //p[@id="error_1_id_course_code"]/strong
    ${Message_Course_Error}=    Get Text    //p[@id="error_1_id_course_code"]/strong
    Should Be Equal    ${Message_Course_Error}    ${EXPECTED_ERROR}
Open Course Creation Page
    ${id}    Set Variable    5
    ${SectionStudy}    Replace Variables    ${URL_CREATE_SECTION_STUDY}
    Open Program Page
    Handle Advertise
    Verify Required Field Warning

    Wait Until Element Is Visible    ${SectionStudy}     30s
    Scroll Element Into View    ${SectionStudy}
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${SectionStudy}

Fill Course Information
    [Arguments]    ${CourseCode}    ${CourseName}    ${Credits}    ${DescriptionCourse}    ${TypeCourse}    ${StatusCourse}
    
    Fill Text Field    ${INPUT_COURSE_CODE}    ${CourseCode}
    Fill Text Field    ${INPUT_COURSE_NAME}    ${CourseName}
    Fill Text Field    ${INPUT_CREDITS}    ${Credits}
    Fill Text Field    ${TEXTAREA_DESCRIPTION_COURSE}    ${DescriptionCourse}
    Fill Dropdown    ${SELECT_TYPE_COURSE}    ${TypeCourse}
    Fill Checkbox    ${CHECKBOX_CORE_SUBJECT}
    Fill Dropdown    ${SELECT_STATUS_COURSE}    ${StatusCourse}

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
    Fill Text Field    ${INPUT_SEMESTER}    ${semester}
    Fill Text Field    ${INPUT_ACADEMIC_YEAR}    ${academicyear}
    Fill Dropdown    ${SELECT_STATUS_CLASS}    ${status}
    Wait Until Element Is Visible    ${INPUT_START_DATE}    30s
    Fill Text Field    ${INPUT_START_DATE}    ${startdate}
    Fill Text Field    ${INPUT_END_DATE}    ${enddate}
    Fill Text Field    ${INPUT_ROOM}    ${room}
    Fill Text Field    ${INPUT_MAX_STUDENTS}    ${maxstudent}
    Fill Text Field   ${TEXTATEA_SCHEDULE}    ${schedule}
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
    ${CLOS}    Set Variable    CLOs
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

    Fill Text Field    ${INPUT_CLO_CODE}    ${Clocode}
    Fill Text Field    ${TEXTAREA_DESCRIPTION_CLO}    ${Description}
    Fill Dropdown   ${SELECT_CATEGORY_CLO}    ${Category}
    Fill Dropdown    ${SELECT_LEVEL_CLO}    ${Level}
    Fill Text Field   ${INPUT_WEIGHT_CLO}    ${Weight}
    Fill Dropdown    ${SELECT_ASSESSMENT_METHOD}    ${Assessmentmethod}
  
Click The Button Create CLO
    Wait Until Element Is Visible    ${CREATE_CLO_BTN}    30s
    Scroll Element Into View    ${CREATE_CLO_BTN}
    Wait Until Keyword Succeeds    30s    1s    Click Button    ${CREATE_CLO_BTN}

Verify New CLO Creation Results
    ${EXPECTED_MESSAGE_CLO}    Set Variable    CLO created successfully!
    [Arguments]    ${Clocode}    ${Description}    ${Category}    ${Level}    ${Weight}
    Verify Text Equal    ${ACTUAL_MESSAGE_CLO}      ${EXPECTED_MESSAGE_CLO}
    Verify Text Equal    ${ACTUAL_CLO_CODE}         ${Clocode}
    Verify Text Equal    ${ACTUAL_DESCRIPTION_CLO}  ${Description}
    Verify Text Equal    ${ACTUAL_CATEGORY_CLO}     ${Category}
    Verify Text Equal    ${ACTUAL_LEVEL_CLO}        ${Level}
    Verify Text Contain  ${ACTUAL_WEIGHT_CLO}       ${Weight}
    
 Verify Message CLO Creation Results   
    Verify Text Equal    ${ACTUAL_MESSAGE_CLO_ERROR}    This field is required.
       
Verify Error Message Mhen Code is Duplicated
    Page Should Contain    Clo code is unique

Click The Button Back To CLOs
    ${id}    Set Variable    45
    ${urlbacktocourse}    Replace Variables    ${URL_BACK_TO_CLOS}
    ${CLOS}    Set Variable    CLOs
    Wait Until Element Is Visible    ${urlbacktocourse}   30s
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${urlbacktocourse}
    Verify Text Contain    ${ACTUAL_TITLE_CLOS}    ${CLOS}

View Details CLOs
    ${id}    Set Variable    122
    ${urldetailclos}    Replace Variables    ${URL_DETAILS_CLOS}
    ${TITLE_CLO_DETAIL}    Set Variable    CLO Details
    Wait Until Element Is Visible    ${urldetailclos}    30s
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${urldetailclos}

    Verify Text Equal    ${TITLE_PAGE_DETAIL_CLOS}    ${TITLE_CLO_DETAIL}
View Edit CLOs
    ${id}    Set Variable    122
    ${urledit}    Replace Variables    ${URL_EDIT_CLOS}
    Wait Until Element Is Visible   ${urledit}    30s
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${urledit}

    Verify Text Equal    ${TITLE_PAGE_EDIT_CLOS}    Edit CLO
View Map PLO
    ${id}    Set Variable    122
    ${urlplo}    Replace Variables    ${URL_PLO}
    Wait Until Element Is Visible    ${urlplo}    30s
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${urlplo}
    Should Be Equal    ${TITLE_PLO}    Map CLO to PLO

Create Mapping PLOs
    [Arguments]    ${Plo}    ${MappingPlo}
    Fill Dropdown    ${SELECT_PLO}    ${Plo}
    Fill Dropdown    ${SELECT_MAPPING_PLO}    ${MappingPlo}

    Wait Until Element Is Visible    ${CREATE_MAPPING_BTN}    30s
    Scroll Element Into View    ${CREATE_MAPPING_BTN}
    Wait Until Keyword Succeeds    30s    1s    Click Button    ${CREATE_MAPPING_BTN}
    Should Be Equal    ${ACTUAL_MESSAGE_MAPPING}    PLO-CLO Mapping created successfully!

Click The Button Edit CLOs
    ${id}    Set Variable    123
    ${urledit}    Replace Variables    ${URL_EDIT_CLO}
    Wait Until Element Is Visible    ${urledit}    30s
    Scroll Element Into View    ${urledit}
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${urledit}
Fill Out The CLO Edit Form
    [Arguments]    ${Clocode}    ${Description}    ${Category}    ${Level}    ${Weight}    ${Assessmentmethod}
    Fill Text Field    ${INPUT_CLO_CODE}    ${Clocode}
    Fill Text Field    ${TEXTAREA_DESCRIPTION_CLO}    ${Description}
    Fill Dropdown   ${SELECT_CATEGORY_CLO}    ${Category}
    Fill Dropdown    ${SELECT_LEVEL_CLO}    ${Level}
    Fill Text Field   ${INPUT_WEIGHT_CLO}    ${Weight}
    Fill Dropdown    ${SELECT_ASSESSMENT_METHOD}    ${Assessmentmethod}
  
Click The Button Edit CLO
    Wait Until Element Is Visible    ${EDIT_CLOS_BTN}    30s
    Scroll Element Into View    ${EDIT_CLOS_BTN}
    Wait Until Keyword Succeeds    30s    1s    Click Button    ${EDIT_CLOS_BTN}

Verify Message CLO Edit Results 
    ${EXPECTED_MESSAGE_UPDATE_CLO}    Set Variable    CLO updated successfully!
    Verify Text Equal    ${MESSAGE_UPDATE_CLOS}    ${EXPECTED_MESSAGE_UPDATE_CLO}
Verify CLO Edit Results  
    [Arguments]    ${clocodeup}  ${descriptionup}  ${categoryup}   ${levelup}    ${weightup}       ${assessmentmethodup}
    Verify Text Equal    ${MESSAGE_UPDATE_CLOS}              CLO updated successfully!
    Verify Text Equal    ${ACTUAL_UPDATE_CLOCODE_CLOS}       ${clocodeup}
    Verify Text Equal    ${ACTUAL_UPDATE_DESCRIPTION_CLOS}   ${descriptionup}
    Verify Text Equal    ${ACTUAL_UPDATE_CATEGORY_CLOS}      ${categoryup}
    Verify Text Equal    ${ACTUAL_UPDATE_LEVEL_CLOS}         ${levelup}
    Verify Text Contain  ${ACTUAL_UPDATE_WEIGHT_CLOS}        ${weightup}
    Verify Text Equal    ${ACTUAL_UPDATE_ASSESSMENT_CLOS}    ${assessmentmethodup}
    
Verify Message CLO Edit Results With Clo Code Duplication
    Page Should Contain    Clo code is unique
Click The Button Quick ADD CLO
    ${id}    Set Variable    45
    ${urladd}    Replace Variables    ${URL_ADD_CLO_QUICK}
    Wait Until Element Is Visible    ${urladd}    30s
    Scroll Element Into View    ${urladd}
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${urladd}
Verify Title Page CLo
    ${TITLE_ADD_CLO}    Set Variable    Create New CLO
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
    Fill Text Field    ${INPUT_CHAPTER_NUMBER}             ${chapternumber}
    Fill Text Field    ${INPUT_CHAPTER_TITLE}              ${chaptertitle}
    Fill Text Field    ${TEXTAREA_CHAPTER_DESCRIPTION}     ${chapterdescription}
    Fill Text Field    ${TEXTAREA_CHAPTER_LEARNING}        ${chapterleaning}
    Fill Text Field    ${INPUT_CHAPTER_TIME}               ${chaptertime}
    Fill Text Field    ${TEXTAREA_CHAPTER_TEACHING_METHOD}    ${chapterteaching}

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
    Fill Text Field    ${INPUT_CHAPTER_NUMBER}             ${chapternumber}
    Fill Text Field    ${TEXTAREA_CHAPTER_DESCRIPTION}     ${chapterdescription}
    Fill Text Field    ${TEXTAREA_CHAPTER_LEARNING}        ${chapterleaning}
    Fill Text Field    ${INPUT_CHAPTER_TIME}               ${chaptertime}
    Fill Text Field    ${TEXTAREA_CHAPTER_TEACHING_METHOD}    ${chapterteaching}

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
    Fill Text Field    ${INPUT_TEST_NAME}           ${name}
    Fill Dropdown      ${SELECT_TEST_TYPE}          ${type}
    Fill Text Field    ${INPUT_TEST_PERCENTAGE}     ${percentage}
    Fill Text Field    ${TEXTAREA_TEST_DESCRIPTION}    ${description}
    Fill Dropdown      ${SELECT_TEST_FORMAT}        ${format}
    Fill Text Field    ${INPUT_TEST_MINUTES}        ${minutes}
    Fill Text Field    ${INPUT_TEST_TOTAL_MARKS}    ${totalmarks}
    Fill Text Field    ${TEXTAREA_TEST_METHOD}      ${method}
    Fill Text Field    ${TEXTAREA_TEST_CRITERIA}    ${criteria}

    # Xử lý date đặc biệt bằng JS
    Scroll Element Into View    ${INPUT_TEST_DATE}
    Execute JavaScript    document.getElementById("id_assessment_date").value = "${date}"

    Fill Text Field    ${INPUT_TEST_LOCATION}       ${location}
    Fill Dropdown      ${SELECT_TEST_STATUS}        ${status}

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
Verify Results Create Assessment 
    Page Should Contain    Create Assessment Successfully!
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
        Verify Text Contain    ${ACTUAL_PAGE_COURSE}    ${namecourse}
Click The Button ADD Course
    ${id}    Set Variable    5
    ${urlcourse}    Replace Variables    ${URL_ADD_COURSE}
    Wait Until Element Is Visible    ${urlcourse}    30s
    Scroll Element Into View    ${urlcourse}
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${urlcourse}
    Verify Text Equal    ${ACTUAL_ADD_COURSE}    Create New Course

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
    
    Verify Text Contain    ${ACTUAL_COURSE_INFO}    ${codecourse}
    Verify Text Contain    ${ACTUAL_COURSE_INFO}    ${namecourse}

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
    Verify Text Contain    ${ACTUAL_COURSE_INFO}    CLOs
    Verify Text Contain    ${ACTUAL_COURSE_INFO}    ${codecourse}
    Verify Text Contain    ${ACTUAL_COURSE_INFO}    ${namecourse}
    