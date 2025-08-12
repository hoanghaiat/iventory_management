*** Settings ***
Library    SeleniumLibrary
Resource    ../resource/TaoMoiCauHoi.resource
Suite Setup    Open Browser To TaoMoiCauHoi
Suite Teardown    Close Web
*** Variables ***

*** Test Cases ***
TC_CB_01 : Thêm câu hỏi bỏ trống các trường dữ liệu
    [Documentation]    Kiểm tra thêm câu hỏi khi bỏ trống các trường dữ liệu
    Add a new question to the data field

TC_CB_02 : Thêm câu hỏi thành công
    [Documentation]    Kiểm tra thêm câu hỏi thành công
    Add new question
TC_CB_03 : Kiểm tra trường Content
    [Documentation]    Kiểm tra trường Content khi tạo mới câu hỏi 
    Check the Content field
TC_CB_04 : Kiểm tra trường Type
    [Documentation]    Kiểm tra trường Type khi tạo mới câu hỏi 
    Check the Type field
TC_CB_05 : Kiểm tra trường Difficulty
    [Documentation]    Kiểm tra trường Difficulty khi tạo mới câu hỏi 
    Check the Difficulty field
TC_CB_06 : Kiểm tra trường Bloom
    [Documentation]    Kiểm tra trường Bloom khi tạo mới câu hỏi 
    Check the Bloom field
TC_CB_07 : Kiểm tra trường Status
    [Documentation]    Kiểm tra trường Status khi tạo mới câu hỏi 
    Check the Status field
TC_CB_08 : Kiểm tra trường Approval Status
    [Documentation]    Kiểm tra trường Approval Status khi tạo mới câu hỏi 
    Check the Approval Status field
TC_CB_09 : Kiểm tra nút Back to Question Bank
    [Documentation]    Kiểm tra nút Back to Question Bank 
    Back to Question Bank
TC_CB_10 : Điều hướng trang Thẻ phân loại
    [Documentation]    Kiểm tra khi click vào"Thẻ phân loại" ở danh mục điều hướng đúng trang 
    Manage Tags navigation
TC_CB_11 : Điều hướng trang nhập câu hỏi
    [Documentation]    Kiểm tra khi click vào"Nhập câu hỏi " ở danh mục điều hướng đúng trang 
    Import Questions navigation