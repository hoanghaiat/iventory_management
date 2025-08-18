*** Settings ***
Library    SeleniumLibrary
Resource   ../Resource/xoacauhoi.resource

*** Test Cases ***

QB-BTN-01 - Clear Filters khi đã chọn filter
    Set Course    Toán Cao Cấp
    Set Tag       Đại cương
    Click Clear Filters
    # Kiểm tra filter đã về mặc định (ví dụ: kiểm tra dropdown về giá trị rỗng)
    ${course_dropdown}=    Set Variable    xpath=//label[contains(.,'Course')]/following-sibling::select | //select[@name='course']
    ${tag_dropdown}=       Set Variable    xpath=//label[contains(.,'Tag')]/following-sibling::select | //select[@name='tag']
    Element Should Contain    ${course_dropdown}    --Chọn Course--
    Element Should Contain    ${tag_dropdown}       --Chọn Tag--


QB-BTN-02 - Clear Filters khi không chọn filter
    Click Clear Filters
    # Kiểm tra dữ liệu không thay đổi (có thể kiểm tra số lượng bản ghi, hoặc trạng thái filter)