*** Settings ***
Library    SeleniumLibrary
Library    CustomLibrary
Library    String
Library    Collections
Variables  ../variables/locator.py


*** Keywords ***
Open Browser And Login
    Open Browser    ${BASE_LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    id=id_username    10s
    Input Text    id=id_username    ${USERNAME}
    Input Text    id=id_password    ${PASSWORD}
    Click Button    xpath=//button[@type='submit']
    

Go To Course Page
    Click Element    xpath=//*[@id="djHideToolBarButton"]
    Wait Until Element Is Visible    ${MENU_COURSE}    10s
    Click Element    ${MENU_COURSE}
    Wait Until Element Is Visible    ${SEARCH_BOX_PROGRAMS}    10s
    Wait Until Element Is Visible    ${COURSES_TABLE_ROWSS}    
Click View Course Button
    [Documentation]    Click nút View của Course đầu tiên trong danh sách
    ${view_course_locator}=    Set Variable    (//a[contains(@href, '/courses/') and contains(@class, 'btn-info')])[1]
    Wait Until Element Is Visible    ${view_course_locator}    10s
    Scroll Element Into View         ${view_course_locator}
    Click Element                    ${view_course_locator}
Click Edit Course Button 
    Wait Until Element Is Visible    ${EDIT_COURSE_VN}   10s
    Scroll Element Into View    ${EDIT_COURSE_VN}
    Wait Until Element Is Enabled    ${EDIT_COURSE_VN}     10s 
    Click Element    ${EDIT_COURSE_VN}
Click View CLOs Button
    [Documentation]    Click nút "Xem CLOs" của Course đầu tiên trong danh sách
    ${view_clos_locator}=    Set Variable    (//a[contains(@href, '/courses/') and contains(@href, '/clos/') and contains(@class, 'btn-success')])[1]
    Wait Until Element Is Visible    ${view_clos_locator}    10s
    Scroll Element Into View         ${view_clos_locator}
    Click Element                    ${view_clos_locator}
Click Edit CLOs Button
    [Documentation]    Click nút Edit của CLO đầu tiên trong danh sách
    ${edit_clo_locator}=    Set Variable    (//a[contains(@href, '/clos/') and contains(@href, '/update/')])[1]
    Wait Until Element Is Visible    ${edit_clo_locator}    10s
    Scroll Element Into View          ${edit_clo_locator}
    Click Element                     ${edit_clo_locator} 

Click Create Class Button
    [Documentation]    Click nút "Tạo lớp học" của Course đầu tiên trong danh sách
    ${create_class_locator}=    Set Variable    (//a[contains(@href, '/classes/create/') and contains(@class, 'btn-info')])[1]
    Wait Until Element Is Visible    ${create_class_locator}    10s
    Scroll Element Into View         ${create_class_locator}
    Click Element                    ${create_class_locator}

Click Back To Courses Button
    [Documentation]    Click nút "Quay lại danh sách học phần" trong trang chi tiết Program
    ${back_courses_locator}=    Set Variable    (//a[contains(@href, '/programs/') and contains(@href, '/courses/') and contains(@class, 'btn-secondary')])[1]
    Wait Until Element Is Visible    ${back_courses_locator}    10s
    Scroll Element Into View         ${back_courses_locator}
    Click Element                    ${back_courses_locator}

Click Add CLO Button
    [Documentation]    Click nút "Thêm CLO" trong trang chi tiết Course
    ${add_clo_locator}=    Set Variable    (//a[contains(@href, '/courses/') and contains(@href, '/clos/create')])[1]
    Wait Until Element Is Visible    ${add_clo_locator}    10s
    Scroll Element Into View         ${add_clo_locator}
    Click Element                    ${add_clo_locator}


Click Add Content Button
    [Documentation]    Click nút "Thêm chương" trong trang chi tiết Course
    ${add_content_locator}=    Set Variable    (//a[contains(@href, '/courses/') and contains(@href, '/contents/create')])[1]
    Wait Until Element Is Visible    ${add_content_locator}    10s
    Scroll Element Into View         ${add_content_locator}
    Click Element                    ${add_content_locator}


Click Add Assessment Button
    [Documentation]    Click nút "Thêm bài kiểm tra" trong trang chi tiết Course
    ${add_assessment_locator}=    Set Variable    (//a[contains(@href, '/courses/') and contains(@href, '/assessments/create')])[1]
    Wait Until Element Is Visible    ${add_assessment_locator}    10s
    Scroll Element Into View         ${add_assessment_locator}
    Click Element                    ${add_assessment_locator}


Click Add Class Button
    [Documentation]    Click nút "Tạo lớp học" trong trang chi tiết Course
    ${add_class_locator}=    Set Variable    (//a[contains(@href, '/courses/') and contains(@href, '/classes/create')])[1]
    Wait Until Element Is Visible    ${add_class_locator}    10s
    Scroll Element Into View         ${add_class_locator}
    Click Element                    ${add_class_locator}

Click Setting Button 
    Wait Until Element Is Visible    ${SETTING_BTN}    10s 
    Scroll Element Into View    ${SETTING_BTN}
    Wait Until Element Is Enabled    ${SETTING_BTN}     10s 
    Click Element    ${SETTING_BTN}  
    Wait Until Page Contains Element    ${CLO_SETTING_TITLE} 
Click First Assessment Category Action
    [Arguments]    ${action}    # update | delete
    ${href}=    Get Element Attribute    (//a[contains(@href, '/assessment-categories/') and contains(@href, '${action}')])[1]    href
    ${id}=    Fetch From Right    ${href}    /assessment-categories/
    ${id}=    Fetch From Left    ${id}    /
    Log    Found ID: ${id}
    Click Element    (//a[contains(@href, '/assessment-categories/${id}/${action}')])[1]


