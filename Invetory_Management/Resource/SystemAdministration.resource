*** Settings ***
Library    SeleniumLibrary
Variables    ../Variables/locator.py

*** Keywords ***
# Admin Page
Open Admin Page
    Click Element    ${admin_page}
    Wait Until Page Contains    Trang quản trị hệ thống
Navigate to Account Management
    Wait Until Element Is Visible    ${card_user_detail}    10s
    Click Element   ${card_user_detail} 
    Wait Until Page Contains    Quản lý tài khoản
Navigate to Unit Management
    Wait Until Element Is Visible    ${card_unit_detail}    10s
    Click Element   ${card_unit_detail} 
    Wait Until Page Contains    Quản lý Đơn vị
Navigate to Fonds Management
    Wait Until Element Is Visible    ${card_storage_detail}    10s
    Click Element   ${card_storage_detail} 
    Wait Until Page Contains    Quản lý Phông Lưu trữ
Navigate to Catalog Management
    Wait Until Element Is Visible    ${card_catalog_detail}    10s
    Click Element   ${card_catalog_detail} 
    Wait Until Page Contains    Quản lý Mục lục hồ sơ
Navigate from User Menu to Account Management
    Wait Until Element Is Visible    ${link_user_management}    10s
    Click Element   ${link_user_management} 
    Wait Until Page Contains    Quản lý tài khoản
Navigate to System Logs
    Wait Until Element Is Visible    ${link_system_logs}    10s
    Click Element   ${link_system_logs} 
    Wait Until Page Contains    Nhật ký hệ thống

# Account Management 
Open Account Management 
    Click Element    ${account_management_page}
    Wait Until Page Contains    Quản lý tài khoản
Click Add Account Button
    Click Element    ${add_acc_btn}
    Wait Until Page Contains    Thêm tài khoản mới
Add Account
     [Arguments]    ${username}    ${email}    ${password}    ${confirm_password}
    Input Text    ${addacc_username_xpath}          ${username}
    Input Text    ${addacc_email_xpath}             ${email}
    Input Text    ${addacc_password_xpath}          ${password}
    Input Text    ${addacc_confirm_password_xpath}  ${confirm_password}
    Scroll Element Into View    ${addacc_submit_btn_xpath}
    Click Button  ${addacc_submit_btn_xpath}
View Account Details
    Scroll Element Into View    ${view_account_details}
    Click Element    ${view_account_details}
    Wait Until Page Contains    Phân quyền tài khoản

Show entities per page
     [Arguments]    ${so_ban_ghi}
    Select From List By Value    ${select_per_page}    ${so_ban_ghi}
    Sleep    2s
    ${rows}=    Get Element Count    xpath=//table/tbody/tr
    Should Be Equal As Integers    ${rows}    ${so_ban_ghi}
Navigate to Dashboard
    Click Element    ${dashboard_link}
    Wait Until Page Contains    Trang quản trị hệ thống
Click Edit Icon
    Scroll Element Into View    ${edit_icon}
    Click Element    ${edit_icon}
    Wait Until Page Contains    Chỉnh sửa tài khoản
Clear Required Field Email
    Scroll Element Into View    ${editacc_email_xpath}
    Clear Element Text    ${editacc_email_xpath}
    Scroll Element Into View    ${acc_update_button}
    Click Element    ${acc_update_button}
    Wait Until Page Contains    Email là bắt buộc    timeout=10s
Update Successfully
    [Arguments]    ${new_name}
    Wait Until Element Is Visible    ${name_input_xpath}    5s
    Clear Element Text    ${name_input_xpath}
    Input Text    ${name_input_xpath}    ${new_name}
    Scroll Element Into View    ${acc_update_button}
    Click Element    ${acc_update_button}
    Wait Until Page Contains  Tài khoản ${new_name} đã được cập nhật
Cancel Edit
    Wait Until Element Is Visible    ${name_input_xpath}    5s
    Clear Element Text    ${name_input_xpath}
    Input Text    ${name_input_xpath}    user5
    Scroll Element Into View    ${acc_cancel_button}
    Click Element    ${acc_cancel_button}
View Permissions
    Scroll Element Into View    ${view_permission_button}
    Click Element    ${view_permission_button}
    Wait Until Page Contains    Phân quyền tài khoản
Click Edit Button in Permission Interface
    Click Element    ${edit_permission_button}
    Wait Until Page Contains    Chỉnh sửa tài khoản
Click Key Icon (Change Password)
    Scroll Element Into View    ${key_icon}
    Click Element    ${key_icon}
    Wait Until Page Contains    Đổi mật khẩu 
Change Password
    [Arguments]    ${new_password}    ${confirm_new_password}
    Input Text    ${new_password_input}   ${new_password}
    Input Text    ${confirm_new_password_input}    ${confirm_new_password}
    Scroll Element Into View    ${confirm_button}
    Click Button  ${confirm_button}
Check Password Length Error Message
    [Arguments]    ${new_password}    ${confirm_new_password}
    Input Text    ${new_password_input}   ${new_password}
    Input Text    ${confirm_new_password_input}    ${confirm_new_password}
    Scroll Element Into View    ${confirm_button}
    Click Button    ${confirm_button}
    # Lấy thông báo validation từ trình duyệt
    ${msg}=    Get Element Attribute    ${new_password_input}    validationMessage
    Log    ${msg}
    Should Contain    ${msg}    Please lengthen this text to 6 characters or more
Click Cancel Password Change
    Scroll Element Into View    ${cancelbtn}
    Click Element    ${cancelbtn}
    Wait Until Page Contains    Quản lý tài khoản

# System Log Page
Open System Logs
    Click Element    ${system_log_page}
    Wait Until Page Contains    Nhật ký hệ thống
Select Log Type
    [Arguments]    ${type}
    Select From List By Label    ${log_type_dropdown}       ${type}
Click Filter Button
    Click Button    ${filter_button}
Check Log Type Color
    [Arguments]    ${type}    ${expected_color}
    ${elements}=    Get WebElements    xpath=//table//tr[td[contains(text(),'${type}')]]
    FOR    ${el}    IN    @{elements}
        ${color}=    Execute JavaScript    return window.getComputedStyle(arguments[0]).getPropertyValue('color');    ${el}
        Should Contain    ${color}    ${expected_color}
    END
Show Logs Per Page And Verify
    [Arguments]    ${expected_rows}
    Select From List By Value    ${row_dropdown}    ${expected_rows}
    Click Element    ${filter_button}
    Wait Until Element Is Visible    xpath=(//div[contains(@class,"log-line")])[1]    5s
    ${scrollable}    Get WebElement    xpath=//div[contains(@class,"log-container")]
    Execute JavaScript    arguments[0].scrollTop = arguments[0].scrollHeight    ARGUMENTS    ${scrollable}
    Sleep    1s
    ${rows}    Get Element Count    xpath=//div[contains(@class,"log-line")]
    Should Be Equal As Integers    ${rows}    ${expected_rows}
Go To Page
    [Arguments]    ${page_number}
    Scroll Element Into View    xpath=//a[@class="page-link" and normalize-space(text())="${page_number}"]
    Click Element    xpath=//a[@class="page-link" and normalize-space(text())="${page_number}"]
    Wait Until Page Contains Element    xpath=//div[contains(@class,"log-line")]
    Location Should Contain    page=${page_number}
Back to Admin Page
    Click Element    ${back_to_admin_page}
    Wait Until Page Contains    Trang quản trị hệ thống
Refresh Logs
    Click Element    ${refresh_logs_button}
    Wait Until Page Contains    Nhật ký hệ thống