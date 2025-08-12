*** Settings ***
Library    SeleniumLibrary
Library    String
Library    Collections
Variables  ../variables/locator.py


*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Login As Student
    Input Text    id=id_username    ${USERNAME}
    Input Text    id=id_password    ${PASSWORD}
    Click Button  xpath=//button[@type='submit' or contains(text(),'Login')]

Open Profile Page
    Wait Until Element Is Visible    xpath=//*[@id="djHideToolBarButton"]    10s
    Click Element    xpath=//*[@id="djHideToolBarButton"]
    Click Element    xpath=/html/body/div[1]/div[2]/div[2]/button
    Click Link       xpath=/html/body/div[1]/div[2]/div[2]/ul/li[1]/a
    Wait Until Page Contains    Hồ sơ cá nhân

Click Log Out Button 
    Wait Until Element Is Visible    xpath=//*[@id="djHideToolBarButton"]    10s
    Click Element    xpath=//*[@id="djHideToolBarButton"]
    Click Element    xpath=/html/body/div[1]/div[2]/div[2]/button
    Click Element    ${LOGOUT_BUTTON}
    Wait Until Page Contains    Đăng nhập hệ thống 

Verify Profile Information
    Page Should Contain    Hồ sơ cá nhân 
    Page Should Contain Element    xpath=/html/body/div[3]/div[2]/div/div[1]/div/div[2]/div/h4
    Page Should Contain Element    xpath=/html/body/div[3]/div[2]/div/div[1]/div/div[2]/div/p
    Page Should Contain Element    xpath=/html/body/div[3]/div[2]/div/div[1]/div/div[2]/ul/li[1]/span[2]
    Page Should Contain Element    xpath=/html/body/div[3]/div[2]/div/div[1]/div/div[2]/ul/li[2]/span[2]
    Page Should Contain Element    xpath=/html/body/div[3]/div[2]/div/div[1]/div/div[2]/ul/li[3]/span[2]
    Page Should Contain Element    xpath=/html/body/div[3]/div[2]/div/div[1]/div/div[2]/ul/li[4]/span[2]
    Page Should Contain Element    xpath=/html/body/div[3]/div[2]/div/div[1]/div/div[2]/ul/li[5]/span[2]

Click Edit Profile Button 
    Wait Until Element Is Visible    ${EDIT_PROFILE_BUTTON}    10s
    Click Element    ${EDIT_PROFILE_BUTTON}  
    Wait Until Element Is Visible    ${UPDATE_PROFILE_BUTTON}   10s

Fill Profile With Valid Data 
    [Arguments]     ${user_name}   ${first_name}   ${last_name}    ${email}   ${phone}   ${department}   ${specialization}
    Wait Until Element Is Visible    ${FIRST_NAME_FIELDS}    5s 
    Clear Element Text    ${FIRST_NAME_FIELDS}
    Input Text    ${FIRST_NAME_FIELDS}   ${first_name}

    Clear Element Text    ${USENAME_FIELDS}
    Input Text    ${USENAME_FIELDS}    ${user_name}

    Clear Element Text    ${LAST_NAME_FIELDS}
    Input Text    ${LAST_NAME_FIELDS}    ${last_name}

    Clear Element Text     ${EMAIL_FIELDS}
    Input Text    ${EMAIL_FIELDS}    ${email}

    Clear Element Text     ${PHONE_FIELDS}
    Input Text    ${PHONE_FIELDS}    ${phone}

    Clear Element Text    ${DEPARTMENT_FIELDS}  
    Input Text    ${DEPARTMENT_FIELDS}    ${department}

    Clear Element Text    ${SPECIALIZATION_FIELDS}    
    Input Text    ${SPECIALIZATION_FIELDS}   ${specialization}

Click Update Profile Button
    Wait Until Element Is Visible    ${UPDATE_PROFILE_BUTTON}   10s 
    Scroll Element Into View    ${UPDATE_PROFILE_BUTTON}
    Wait Until Element Is Enabled    ${UPDATE_PROFILE_BUTTON}   
    Wait Until Page Does Not Contain Element    xpath=//div[contains(@class,'loading')]    10s
    Click Element    ${UPDATE_PROFILE_BUTTON}
    Log     Profile update form submitted

Verify Success Message And Profile Update 
    Wait Until Element Contains    ${SUCCESS_MESSAGE}    Your profile has been updated      10s
    Element Should Contain    ${SUCCESS_MESSAGE}    updated
    Log   Success message should displayed : Your profile has been updated

Verify Error Message For Required Fields
    [Arguments]    ${field_key}
    ${locator}=    Set Variable    ${ERROR_MESSAGES}[${field_key}]
    Wait Until Element Contains    ${locator}    This field is required    10s
    Element Should Contain    ${locator}    This field is required
    Log    Error message displayed for ${field_key} : This field is required

Fill Profile Form With Empty Username Fields
    Wait Until Element Is Visible    ${FIRST_NAME_FIELDS}   10s
    Clear Element Text    ${FIRST_NAME_FIELDS} 
    Input Text    ${FIRST_NAME_FIELDS}    Nguyễn Văn
    Clear Element Text    ${USENAME_FIELDS}
    Clear Element Text    ${EMAIL_FIELDS}
    Input Text    ${EMAIL_FIELDS}    student@student.university.edu.vn
    Clear Element Text    ${LAST_NAME_FIELDS}
    Input Text    ${LAST_NAME_FIELDS}    A
    Clear Element Text    ${PHONE_FIELDS}
    Input Text    ${PHONE_FIELDS}    0905475265
    Clear Element Text    ${DEPARTMENT_FIELDS}
    Input Text    ${DEPARTMENT_FIELDS}    Khoa Công Nghệ Thông Tin
    Clear Element Text    ${SPECIALIZATION_FIELDS}
    Input Text    ${SPECIALIZATION_FIELDS}    Software Engineer
    Log    Form filled with empty username field

Fill Profile Form With Empty Email 
    Wait Until Element Is Visible    ${FIRST_NAME_FIELDS}   10s
    Clear Element Text    ${FIRST_NAME_FIELDS} 
    Input Text    ${FIRST_NAME_FIELDS}    Nguyễn Văn
    Clear Element Text    ${USENAME_FIELDS}
    Input Text    ${USENAME_FIELDS}    student1
    Clear Element Text    ${EMAIL_FIELDS}
    Clear Element Text    ${LAST_NAME_FIELDS}
    Input Text    ${LAST_NAME_FIELDS}    A
    Clear Element Text    ${PHONE_FIELDS}
    Input Text    ${PHONE_FIELDS}    0905475265
    Clear Element Text    ${DEPARTMENT_FIELDS}
    Input Text    ${DEPARTMENT_FIELDS}    Khoa Công Nghệ Thông Tin
    Clear Element Text    ${SPECIALIZATION_FIELDS}
    Input Text    ${SPECIALIZATION_FIELDS}    Software Engineer
    Log    Form filled with empty username field

Fill Profile Form With Valid Username & Email
    Wait Until Element Is Visible    ${USENAME_FIELDS}
    Clear Element Text    ${USENAME_FIELDS} 
    Input Text    ${USENAME_FIELDS}    student1
    Clear Element Text    ${EMAIL_FIELDS}
    Input Text    ${EMAIL_FIELDS}    student@student.university.edu.vn
    Log    Form filled with valid username & email
