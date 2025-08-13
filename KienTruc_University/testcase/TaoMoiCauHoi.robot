*** Settings ***
Library    SeleniumLibrary
Resource    ../resource/TaoMoiCauHoi.resource
Suite Setup    Open Browser To TaoMoiCauHoi
Suite Teardown    Close Web
*** Variables ***

*** Test Cases ***
TC_CB_01 : Thêm câu hỏi bỏ trống các trường dữ liệu
    [Documentation]    TC_CB_01
    [Tags]    AnhTuyet    TaoMoiCauHoi
    Add a new question to the data field

TC_CB_02 : Thêm câu hỏi thành công
    [Documentation]    TC_CB_02
    [Tags]    AnhTuyet    TaoMoiCauHoi
    Add new question
TC_CB_03 : Kiểm tra trường Course
    [Documentation]    TC_CB_03
    [Tags]    AnhTuyet    TaoMoiCauHoi
    Check the Course field
TC_CB_04 : Kiểm tra trường Content
    [Documentation]    TC_CB_04
    [Tags]    AnhTuyet    TaoMoiCauHoi
    Check the Content field

TC_CB_05 : Kiểm tra trường Type
    [Documentation]    TC_CB_05
    [Tags]    AnhTuyet    TaoMoiCauHoi
    Check the Type field

TC_CB_06 : Kiểm tra trường Difficulty
    [Documentation]    TC_CB_06
    [Tags]    AnhTuyet    TaoMoiCauHoi
    Check the Difficulty field

TC_CB_07 : Kiểm tra trường Bloom
    [Documentation]    TC_CB_07
    [Tags]    AnhTuyet    TaoMoiCauHoi
    Check the Bloom field

TC_CB_08 : Kiểm tra trường Status
    [Documentation]    TC_CB_08
    [Tags]    AnhTuyet    TaoMoiCauHoi
    Check the Status field

TC_CB_09 : Kiểm tra trường Approval Status
    [Documentation]    TC_CB_09
    [Tags]    AnhTuyet    TaoMoiCauHoi
    Check the Approval Status field

TC_CB_10 : Kiểm tra nút Back to Question Bank
    [Documentation]    TC_CB_10
    [Tags]    AnhTuyet    TaoMoiCauHoi
    Back to Question Bank

TC_CB_11 : Điều hướng trang Thẻ phân loại
    [Documentation]    TC_CB_11
    [Tags]    AnhTuyet    TaoMoiCauHoi
    Manage Tags navigation

TC_CB_12 : Điều hướng trang nhập câu hỏi
    [Documentation]    TC_CB_12
    [Tags]    AnhTuyet    TaoMoiCauHoi
    Import Questions navigation