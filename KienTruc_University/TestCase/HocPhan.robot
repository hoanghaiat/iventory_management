*** Settings ***
Library    SeleniumLibrary    run_on_failure=No Operation
Resource    ../Resource/DangNhap.resource
Resource    ../Resource/TrangChu.resource
Resource    ../Resource/HocPhan.resource

Suite Setup    Login To System Success  
Test Setup    Open Course List

*** Variables ***
${Key}    block
${Key_Caps}    BLOCK
${UP_COURSE_CODE}    BL008
${UP_COURSE_NAME}    Kiểm thử phần mềm Auto
${UP_COURSE_CREDITS}    4
${UP_COURSE_DESCRIPTION}    Làm quen với RobotFramework
${UP_COURSE_TYPE}    Elective
${UP_COURSE_STATUS}    Active
*** Test Cases ***
Danh sách học phần
    [Documentation]    TC-CS-01
    [Tags]    Phương Ly     Danh sách học phần
    Verify Page Title Course
Kiểm tra thao tác Programs
    [Documentation]    TC-CS-02
    [Tags]    Phương Ly     Thao tác trong học phần
    Click The Button Programs
Tìm kiếm với từ khóa tồn tại viết thường
    [Documentation]    TC-CS-03
    [Tags]    Phương Ly     Tìm kiếm học phần
    Enter Input Search Course    ${Key}
    Click The Button Search Courses
    Verify Search Results Contain Keyword Courses   ${Key}
    
Tìm kiếm với từ khóa tồn tại viết hoa
    [Documentation]    TC-CS-04
    [Tags]    Phương Ly     Tìm kiếm học phần
    Enter Input Search Course    ${Key_Caps}
    Click The Button Search Courses
    Verify Search Results Contain Keyword Courses   ${Key_Caps}
Tìm kiếm với từ khóa không tồn tại
    [Documentation]    TC-CS-05
    [Tags]    Phương Ly     Tìm kiếm học phần
    Enter Input Search Course    Chính trị
    Click The Button Search Courses
    Verify That The Search Sesult Does Not Exist
Tìm kiếm với từ khóa trống
    [Documentation]    TC-CS-06
    [Tags]    Phương Ly     Tìm kiếm học phần
    Click The Button Search Courses
    Verify Empty Search Result
Xem chi tiết thông tin khóa học
    [Documentation]    TC-CS-07
    [Tags]    Phương Ly     Thao tác của khóa học
    Click The Button Information Courses
Thao tác chỉnh sửa khóa học
    [Documentation]    TC-CS-08
    [Tags]    Phương Ly     Thao tác của khóa học
    Click The Button Edit Courses
Chỉnh sửa khóa học thành công
    [Documentation]    TC-CS-09
    [Tags]    Phương Ly     Thao tác của khóa học
    Click The Button Edit Courses
    Fill In Edit Course Form    ${UP_COURSE_CODE}    ${UP_COURSE_NAME}    ${UP_COURSE_CREDITS}    ${UP_COURSE_DESCRIPTION}    ${UP_COURSE_TYPE}    ${UP_COURSE_STATUS}
    Click The Button Update Course
    Verify The Result Of The Update    ${UP_COURSE_CODE}    ${UP_COURSE_NAME}    ${UP_COURSE_CREDITS}    ${UP_COURSE_DESCRIPTION}    ${UP_COURSE_TYPE}    ${UP_COURSE_STATUS}

Chỉnh sửa khóa học xóa hết các trường thông tin
    [Documentation]    TC-CS-10
    [Tags]    Phương Ly     Thao tác của khóa học
    Click The Button Edit Courses
    Clear All Information Fields In The Edit Form
    Click The Button Update Course
    Verify Message When Clearing Fields
Thao tác CLOs
    [Documentation]    TC-CS-11
    [Tags]    Phương Ly     Thao tác của khóa học
    ${CODE_COURSE_EX}    ${NAME_COURSE_EX}    ${TYPE_COURSE_EX}    ${STATUS_COURSE_EX}=    Get Course Information
    Click The Button CLOs Course
    Verify Course CLO Information    ${CODE_COURSE_EX}    ${NAME_COURSE_EX}    ${TYPE_COURSE_EX}    ${STATUS_COURSE_EX}
    
    

    
    
