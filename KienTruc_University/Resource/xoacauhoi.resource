*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BTN_CLEAR}    xpath=//button[normalize-space()='Clear Filters']

*** Keywords ***
Click Clear Filters
    Wait Until Element Is Visible    ${BTN_CLEAR}    10s
    Click Element    ${BTN_CLEAR}
    Sleep    1s


Set Course

    [Arguments]    ${course_name}
    # Chọn dropdown hoặc ô nhập cho Course, sửa selector cho đúng giao diện thực tế
    ${course_dropdown}=    Set Variable    xpath=//label[contains(.,'Course')]/following-sibling::select | //select[@name='course']
    Wait Until Element Is Visible    ${course_dropdown}    10s
    Select From List By Label    ${course_dropdown}    ${course_name}
    Sleep    0.5s

Set Tag

    [Arguments]    ${tag_name}
    # Chọn dropdown hoặc ô nhập cho Tag, sửa selector cho đúng giao diện thực tế
    ${tag_dropdown}=    Set Variable    xpath=//label[contains(.,'Tag')]/following-sibling::select | //select[@name='tag']
    Wait Until Element Is Visible    ${tag_dropdown}    10s
    Select From List By Label    ${tag_dropdown}    ${tag_name}
    Sleep    0.5s