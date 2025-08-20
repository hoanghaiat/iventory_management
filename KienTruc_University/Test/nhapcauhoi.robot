*** Settings ***
Library    SeleniumLibrary
Resource   ../Resource/nhapcauhoi.resource

Suite Setup       Open Browser And Login
Suite Teardown    Close All Browsers
Test Teardown     Capture Page Screenshot
Test Timeout      3 minutes
Documentation     Bộ test Import/Manage/Clear Filters cho Question Bank.

*** Variables ***
${VALID_FILE}      ${CURDIR}/../data/valid_questions.csv
${INVALID_FILE}    ${CURDIR}/../data/invalid_questions.txt

*** Test Cases ***
TC_BTN_002: Import file câu hỏi hợp lệ
    [Documentation]    Import file CSV đúng định dạng, kiểm tra thông báo thành công
    Open Import Dialog
    Import File And Submit    ${VALID_FILE}
    Toast Should Be Success

TC_BTN_003: Import file sai định dạng
    [Documentation]    Import file .txt sai định dạng, kiểm tra thông báo lỗi
    Open Import Dialog
    Import File And Submit    ${INVALID_FILE}
    Toast Should Be Error

TC_BTN_004: Mở trang quản lý tag
    [Documentation]    Click Manage Tags, kiểm tra mở trang quản lý tag
    Go To Manage Tags
    Tag Page Should Open

TC_BTN_005: Xóa toàn bộ bộ lọc
    [Documentation]    Chọn Course, Difficulty rồi click Clear Filters, kiểm tra về trạng thái mặc định
    Go To Question Bank
    Select Filter Values    Course    Easy
    Clear All Filters
    Filters Should Reset
