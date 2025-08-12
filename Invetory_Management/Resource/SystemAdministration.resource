*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://kholuutru.minds.vn/
${USERNAME}  admin_qc_automation
${PASSWORD}  Qc@12345
${username_xpath}       xpath=//*[@id="username"]
${password_xpath}       xpath=//*[@id="password"]
${loginbtn_xpath}       xpath=//*[@id="loginBtn"]
${admin_page}        xpath=//a[@href='/admin']

${card_user_detail}        xpath=//a[@href='/admin/users' and contains(@class,'card-footer')]
${card_unit_detail}        xpath=//a[@href='/don-vi' and contains(@class,'card-footer')]
${card_storage_detail}    xpath=//a[@href='/phong' and contains(@class,'card-footer')]
${card_catalog_detail}    xpath=//a[@href='/muc-luc' and contains(@class,'card-footer')]
${link_user_management}     xpath=//a[@href='/admin/users' and contains(@class,'list-group-item')]
${link_system_logs}    xpath=//a[@href='/admin/logs' and contains(@class,'list-group-item')]

${account_management_page}  xpath=//a[@href='/admin/users']
${add_acc_btn}      //a[@href='/admin/users/add'and contains(@class,'btn btn-primary')]
${addacc_username_xpath}          xpath=//input[@id='username' and contains(@class,'form-control-lg')]
${addacc_email_xpath}             xpath=//input[@id='email' and contains(@class,'form-control-lg')]
${addacc_password_xpath}          xpath=//input[@id='password' and contains(@class,'form-control-lg')]
${addacc_confirm_password_xpath}  xpath=//input[@id='confirm_password' and contains(@class,'form-control-lg')]
${addacc_submit_btn_xpath}        xpath=//input[@id='submit' and contains(@class,'btn-success')]            
*** Keywords ***
Login To System
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Wait Until Element Is Visible    ${username_xpath}    30s
    Input Text    ${username_xpath}    ${USERNAME}
    Input Text    ${password_xpath}    ${PASSWORD}
    Click Button  ${loginbtn_xpath}
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
   