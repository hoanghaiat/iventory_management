*** Settings ***
Library    SeleniumLibrary
Resource    ../Resource/DangNhap.resource
Resource    ../Resource/TrangChu.resource
Resource    ../Resource/HocPhan.resource
Resource    ../Resource/LopHoc.resource

Test Setup    Login To System Success  
*** Variables ***
${SEMESTER}    All Semesters 
${ACADEMIC_YEAR}    All Years
${STATUS}    All Statuses
${KEYWORD}    phần mềm
${SEMESTER_SUMMER}    Summer
${STATUS_ONGOING}    Ongoing
*** Test Cases ***
TC-CL-01: Danh sách lớp học
    [Documentation]    TC-CL-01
    [Tags]    PhuongLy    Quản lý lớp học
    Open Class List
    Verify The Page
TC-CL-02: Thao tác tạo lớp học
    [Documentation]    TC-CL-02
    [Tags]    PhuongLy    Quản lý lớp học
    Open Class List
    Verify The Page
    Click The Button Create Class In Page Class
TC-CL-03: Thao tác tạo học phần
    [Documentation]    TC-CL-03
    [Tags]    PhuongLy    Quản lý lớp học
    Open Class List
    Verify The Page
    Click The Button Courses In Page Class 
TC-CL-04: Tìm kiếm tất cả với từ khóa tồn tại 
    [Documentation]    TC-CL-04
    [Tags]    PhuongLy    Thao tác tìm kiếm
    Open Class List
    Verify The Page
    Fill All The Input Search    ${SEMESTER}    ${ACADEMIC_YEAR}    ${STATUS}    ${KEYWORD}
    Click The Button Search In The Page Class
    Verify Search Results Contain Keyword Class    ${KEYWORD}
TC-CL-05: Tìm kiếm với Semester Summer
    [Documentation]    TC-CL-05
    [Tags]    PhuongLy    Thao tác tìm kiếm
    Open Class List
    Verify The Page
    Fill All The Input Search    ${SEMESTER_SUMMER}    ${ACADEMIC_YEAR}    ${STATUS}    ${KEYWORD}
    Click The Button Search In The Page Class 
    Verify Search Results Contain Keyword Class Summer    ${SEMESTER_SUMMER}
    
TC-CL-06: Tìm kiếm với Status Ongoing
    [Documentation]    TC-CL-06
    [Tags]    PhuongLy    Thao tác tìm kiếm
    Open Class List
    Verify The Page
    Fill All The Input Search    ${SEMESTER}    ${ACADEMIC_YEAR}    ${STATUS_ONGOING}    ${KEYWORD}
    Click The Button Search In The Page Class 
    Verify Search Results Contain Keyword Class Status Ongoing    ${STATUS_ONGOING}

TC-CL-07: Thông tin chi tiết lớp học
    [Documentation]    TC-CL-07
    [Tags]    PhuongLy    Thông tin lớp học
    Open Class List
    Verify The Page
    ${CODE}    ${NAME}    ${SEMESTER}    ${YEAR}=    Click The Button View Information Class
    Verify The Information View Class    ${CODE}    ${NAME}    ${SEMESTER}    ${YEAR}
TC-CL-08: Thao tác tạo nội dung buổi học tự động
    [Documentation]    TC-CL-08
    [Tags]    PhuongLy    Thông tin lớp học
    Open Class List
    Verify The Page
    
TC-CL-11: Thao tác bài kiểm tra
    [Documentation]    TC-CL-11
    [Tags]    PhuongLy    Thông tin lớp học
    Open Class List
    Verify The Page
    Click The Button View
    Click The Button Test
TC-CL-12: Thao tác quay lại
    [Documentation]    TC-CL-12
    [Tags]    PhuongLy    Thông tin lớp học
    Open Class List
    Verify The Page
    Click The Button View
    Click The Button Back To List
TC-CL-13: Thao tác Xem tất cả CLO
    [Documentation]    TC-CL-13
    [Tags]    PhuongLy    Thông tin lớp học
    Open Class List
    Verify The Page
    Click The Button View
    Click The Button View All CLOs

TC-CL-14: Thao tác thêm nội dung
    [Documentation]    TC-CL-14
    [Tags]    PhuongLy    Thông tin lớp học
    Open Class List
    Verify The Page
    Click The Button View
    Click The Button Add Content
TC-CL-15: Thao tác thêm đánh giá
    [Documentation]    TC-CL-15
    [Tags]    PhuongLy    Thông tin lớp học
    Open Class List
    Verify The Page
    Click The Button View
    Click The Button Add Assessment