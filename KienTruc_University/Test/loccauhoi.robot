*** Settings ***
Library    SeleniumLibrary
Resource    ../resource/TaoMoiCauHoi.resource
Suite Setup    Open Browser To TaoMoiCauHoi
Suite Teardown    Close All Browsers
*** Variables ***

*** Test Cases ***
TC_CB_01 : Thêm câu hỏi bỏ trống các trường dữ liệu
    [Documentation]    TC_CB_01
    [Tags]    honghanh    TaoMoiCauHoi
    Add a new question to the data field

TC_CB_02 : Thêm câu hỏi thành công
    [Documentation]    TC_CB_02
    [Tags]    honghanh    TaoMoiCauHoi
    Add new question
TC_CB_03 : Kiểm tra trường Course
    [Documentation]    TC_CB_03
    [Tags]    honghanh    TaoMoiCauHoi
    Check the Course field
TC_CB_04 : Kiểm tra trường Content
    [Documentation]    TC_CB_04
    [Tags]    honghanh    TaoMoiCauHoi
    Check the Content field

TC_CB_05 : Kiểm tra trường Type
    [Documentation]    TC_CB_05
    [Tags]    honghanh    TaoMoiCauHoi
    Check the Type field

TC_CB_06 : Kiểm tra trường Difficulty
    [Documentation]    TC_CB_06
    [Tags]    honghanh    TaoMoiCauHoi
    Check the Difficulty field

TC_CB_07 : Kiểm tra trường Bloom
    [Documentation]    TC_CB_07
    [Tags]    honghanh    TaoMoiCauHoi
    Check the Bloom field

TC_CB_08 : Kiểm tra trường Status
    [Documentation]    TC_CB_08
    [Tags]    honghanh    TaoMoiCauHoi
    Check the Status field

TC_CB_09 : Kiểm tra trường Approval Status
    [Documentation]    TC_CB_09
    [Tags]    honghanh    TaoMoiCauHoi
    Check the Approval Status field

TC_CB_10 : Kiểm tra nút Back to Question Bank
    [Documentation]    TC_CB_10
    [Tags]    honghanh    TaoMoiCauHoi
    Back to Question Bank

TC_CB_11 : Điều hướng trang Thẻ phân loại
    [Documentation]    TC_CB_11
    [Tags]    honghanh    TaoMoiCauHoi
    Manage Tags navigation

TC_CB_12 : Điều hướng trang nhập câu hỏi
    [Documentation]    TC_CB_12
    [Tags]    honghanh    TaoMoiCauHoi
    Import Questions navigation
