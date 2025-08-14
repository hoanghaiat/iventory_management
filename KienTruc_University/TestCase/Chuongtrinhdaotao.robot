*** Settings ***
Library    SeleniumLibrary
Resource    ../Resource/Chuongtrinhdaotao.resource
Resource    ../Resource/DangNhap.resource
Resource    ../Resource/TrangChu.resource
Test Setup    Login To System Success   

*** Variables ***
${Clocode}    CLO0001
${Clocodeexist}    CLO01
${Description_Clo}    CLOss
${Categoty_Clo}    Skill
${Level_Clo}    Apply
${Weight_Clo}    30
${Assessmentmethod_Clo}    Exam

*** Test Cases ***

TC-PG-01: Danh sách chương trình 
    [Documentation]    TC-PG-01
    [Tags]    Phương Ly     Danh sách chương trình đào tạo
    Open Program List
    Verify Page Title

TC-PG-02: Tìm kiếm với từ khóa tồn tại viết thường
    [Documentation]    TC-PG-02
    [Tags]    Phương Ly     Tìm kiếm chương trình đào tạo hợp lệ
    Open Program Page
    Enter Search Keyword    Phần mềm
    Click Search Button
    Verify Search Results Contain Keyword    Phần mềm

TC-PG-03: Tìm kiếm với từ khóa tồn tại viết khoa
    [Documentation]    TC-PG-03
    [Tags]    Phương Ly     Tìm kiếm chương trình đào tạo hợp lệ
    Open Program Page
    Enter Search Keyword    PHẦN MỀM
    Click Search Button
    Verify Search Results Contain Keyword    PHẦN MỀM
TC-PG-04: Tìm kiếm với từ khóa không tồn tại
    [Documentation]    TC-PG-04
    [Tags]    Phương Ly     Tìm kiếm chương trình đào tạo không hợp lệ
    Open Program Page
    Enter Search Keyword    Kinh tế
    Click Search Button
    Verify No Search Results
TC-PG-05: Không nhập từ khóa tìm kiếm
    [Documentation]    TC-PG-05
    [Tags]    Phương Ly     Tìm kiếm chương trình đào tạo không hợp lệ
    Open Program Page
    Click Search Button
    Verify Empty Field Message



TC-PG-06: Thông tin chi tiết chương trình
    [Documentation]    TC-PG-06
    [Tags]    Phương Ly     Kiểm tra thông tin chi tiết của chương trình
    Open Program Lists
    Verify Required Field Warning
    

TC-PG-07: Tạo PLO thành công
    [Documentation]    TC-PG-07
    [Tags]    Phương Ly     Thông tin chi tiết chương trình đào tạo
    Open Create PLO Form
    Fill In Valid PLO Information    13145    kiến thức    Skill    Apply    2024
    Submit Forms
    Verify Success Message Is Displayed    13145
    

TC-PG-08: Kiểm tra thao tác hủy tạo PLO
    [Documentation]    TC-PG-08
    [Tags]    Phương Ly     Thông tin chi tiết chương trình đào tạo
    Open Create PLO Form
    Fill In Valid PLO Information    13148    kiến thức    Skill    Apply    2024
    Exit PLO Form Without Saving
    Verify PLO Not Created    13148

TC-PG-9: Tạo mới PLo với code Plo đã tồn tạo
    [Documentation]    TC-PG-09
    [Tags]    Phương Ly     Thông tin chi tiết chương trình đào tạo
    Open Create PLO Form
    Fill In Valid PLO Information    1314    thực hành    Skill    Remember    2024
    Submit Form
    Verify Duplicate Code Warning Displayed



TC-PG-10: Tạo PLo trống thông tin
    [Documentation]    TC-PG-10
    [Tags]    Phương Ly     Thông tin chi tiết chương trình đào tạo
    Go To PLO Page
    Click Create PLO Button



TC-PG-11: Kiểm tra thao tác tạo học phần mới thành công
    [Documentation]    TC-PG-11
    [Tags]    Phương Ly     Thông tin chi tiết chương trình đào tạo
    Open Create Course Form
    Fill In Valid Course Information    CNTT01    Kiểm thử phần mềm    3    Kiểm thử chất lượng phần mềm    Mandatory    Updating
    Submit Course Form
    Verify Course Creation Success    CNTT01    Kiểm thử phần mềm    3    Mandatory    Updating


TC-PG-12: Kiểm tra thao tác tạo học phần mới khi để trống thông tin
    [Documentation]    TC-PG-12
    [Tags]    Phương Ly     Thông tin chi tiết chương trình đào tạo
    Open PLO Page
    Click Create Button
    Verify Course Creation Error  


TC-PG-13: Tạo học phần mới với Course Code đã tồn tại
    [Documentation]    TC-PG-13
    [Tags]    Phương Ly     Thông tin chi tiết chương trình đào tạo
    
    Open Course Creation Page
    Fill Course Information    CNTT001    Quản lý dự án    3    Scrum    Mandatory    Updating
    Submit Course Creation
TC-PG-14: Kiểm tra thao tác xem tất cả
    [Documentation]    TC-PG-14
    [Tags]    Phương Ly     Thông tin chi tiết chương trình đào tạo
    Open Program Lists
    Verify Required Field Warning
    View All Button Selection

TC-PG-15: Xem chi tiết học phần
    [Documentation]    TC-PG-15
    [Tags]    Phương Ly     Thông tin chi tiết chương trình đào tạo
    Open Program Lists
    Verify Required Field Warning
    Click The Button To View Course Details
TC-PG-16: Thao tác chỉnh sửa học phần
    [Documentation]    TC-PG-16
    [Tags]    Phương Ly     Thao tác trong trang Thông tin học phần
    Open Program Lists
    Verify Required Field Warning
    Click The Button To Edit Course
TC-PG-17: Thao tác tác quay lại
    [Documentation]    TC-PG-17
    [Tags]    Phương Ly     Thao tác trong trang Thông tin học phần
    Open Program Lists
    Verify Required Field Warning
    Click The Button To Edit Course
    Click The Button Back To Course

TC-PG-18: Thao tác tạo lớp học
    [Documentation]    TC-PG-18
    [Tags]    Phương Ly     Thao tác trong trang Thông tin học phần
    Open Program Lists
    Verify Required Field Warning
    Click The Button To View Course Details
    Click The Button Create Class
 
TC-PG-19: Tạo lớp học mới thành công
    [Documentation]    TC-PG-19
    [Tags]    Phương Ly     Thao tác trong trang Thông tin học phần
    Open Program Lists
    Verify Required Field Warning
    Click The Button To View Course Details
    Click The Button Create Class
    Fill Out The Class Creation Form    Học kì 2    2025    Pending    03/08/2025    30/03/2025   1    30    học tập 
    Check The Class Creation Results Success
 TC-PG-20: Tạo lớp học mới sai lệch về thời gian
    [Documentation]    TC-PG-20
    [Tags]    Phương Ly     Thao tác trong trang Thông tin học phần
    Open Program Lists
    Verify Required Field Warning
    Click The Button To View Course Details
    Click The Button Create Class
    Fill Out The Class Creation Form    Học kì 2    2025    Pending    20/08/2025    10/08/2025   1    30    học tập 
    Check The Class Creation Results Failed
 TC-PG-21: Thao tác quay lại danh sách học phần
    [Documentation]    TC-PG-21
    [Tags]    Phương Ly     Thao tác trong trang Thông tin học phần
    Open Program Lists
    Verify Required Field Warning
    Click The Button To View Course Details
    Operation To Return To The List Of Courses
 TC-PG-22: Thao tác xem CLOs
    [Documentation]    TC-PG-22
    [Tags]    Phương Ly     Thao tác trong trang Thông tin học phần
    Open Program Lists
    Verify Required Field Warning
    Click The Button To View Course Details
    Click The Button View CLOs
TC-PG-23: Tạo CLO mới thành công
    [Documentation]    TC-PG-23
    [Tags]    Phương Ly     Thao tác trong trang Thông tin học phần
    Open Program Lists
    Verify Required Field Warning
    Click The Button To View Course Details
    Click The Button View CLOs
    Open Operation With Add CLO Button
    Click The Button Create CLO
    Fill Out The CLO Creation Form   ${Clocode}    ${Description_Clo}    ${Categoty_Clo}    ${Level_Clo}    ${Weight_Clo}    ${Assessmentmethod_Clo}
    Click The Button Create CLO
    Verify New CLO Creation Results    ${Clocode}    ${Description_Clo}    ${Categoty_Clo}    ${Level_Clo}    ${Weight_Clo}
TC-PG-24: Tạo CLO với thông tin trống
    [Documentation]    TC-PG-24
    [Tags]    Phương Ly     Thao tác trong trang Thông tin học phần
    Open Program Lists
    Verify Required Field Warning
    Click The Button To View Course Details
    Click The Button View CLOs
    Open Operation With Add CLO Button
    Click The Button Create CLO
    Verify Message CLO Creation Results

TC-PG-25: Tạo CLO với Clo code đã tồn tại
    [Documentation]    TC-PG-25
    [Tags]    Phương Ly     Thao tác trong trang Thông tin học phần
    Open Program Lists
    Verify Required Field Warning
    Click The Button To View Course Details
    Click The Button View CLOs
    Open Operation With Add CLO Button
    Click The Button Create CLO
    Fill Out The CLO Creation Form   ${Clocode}    ${Description_Clo}    ${Categoty_Clo}    ${Level_Clo}    ${Weight_Clo}    ${Assessmentmethod_Clo}
    Verify Error Message Mhen Code is Duplicated

TC-PG-26: Thao tác Back to CLOs
    [Documentation]    TC-PG-26
    [Tags]    Phương Ly     Thao tác trong trang Thông tin học phần
    Open Program Lists
    Verify Required Field Warning
    Click The Button To View Course Details
    Click The Button View CLOs
    Open Operation With Add CLO Button
    Click The Button Back To CLOs
TC-PG-27: Thao tác Chi tiết CLOs
    [Documentation]    TC-PG-27
    [Tags]    Phương Ly     Thao tác trong trang Thông tin học phần
    Open Program Lists
    Verify Required Field Warning
    Click The Button To View Course Details
    Click The Button View CLOs
    View Details CLOs
TC-PG-28: Thao tác chỉnh sửa trong trang CLO Details
    [Documentation]    TC-PG-28
    [Tags]    Phương Ly     Thao tác trong trang Thông tin học phần
    Open Program Lists
    Verify Required Field Warning
    Click The Button To View Course Details
    Click The Button View CLOs
    View Edit CLOs
