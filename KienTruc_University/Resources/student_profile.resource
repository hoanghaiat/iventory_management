*** Settings ***
Library    SeleniumLibrary
Library    Collections
Variables  ../variables/locator.py

*** Variables ***
${DEFAULT_USERNAME}          student1
${DEFAULT_FIRSTNAME}         Nguyễn Văn
${DEFAULT_LASTNAME}          A
${DEFAULT_EMAIL}             student@student.university.edu.vn
${DEFAULT_PHONE}             0905475265
${DEFAULT_DEPARTMENT}        Khoa Công Nghệ Thông Tin
${DEFAULT_SPECIALIZATION}    Software Engineer
*** Keywords ***

Open Profile Page
    Wait Until Element Is Visible    ${TAB}    10s
    Click Element    ${TAB}
    Click Element    ${SETTING_PROFILE}
    Click Link       ${PROFILE_BTN}

Click Log Out Button
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${TAB}
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${SETTING_PROFILE}
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${LOGOUT_BUTTON}

Verify Profile Information
    Page Should Contain    Hồ sơ cá nhân

Click Edit Profile Button
    Wait Until Element Is Visible    ${EDIT_PROFILE_BUTTON}    10s
    Click Element    ${EDIT_PROFILE_BUTTON}
    Wait Until Element Is Visible    ${UPDATE_PROFILE_BUTTON}   10s


Get Default Profile Data
    ${profile_data}=    Create Dictionary
    ...    ${USENAME_FIELDS}         ${DEFAULT_USERNAME}
    ...    ${FIRST_NAME_FIELDS}      ${DEFAULT_FIRSTNAME}
    ...    ${LAST_NAME_FIELDS}       ${DEFAULT_LASTNAME}
    ...    ${EMAIL_FIELDS}           ${DEFAULT_EMAIL}
    ...    ${PHONE_FIELDS}           ${DEFAULT_PHONE}
    ...    ${DEPARTMENT_FIELDS}      ${DEFAULT_DEPARTMENT}
    ...    ${SPECIALIZATION_FIELDS}  ${DEFAULT_SPECIALIZATION}
    [Return]    ${profile_data}

Get Profile Data With Empty Username
    ${profile_data}=    Get Default Profile Data
    Set To Dictionary    ${profile_data}    ${USENAME_FIELDS}=${EMPTY}
    [Return]    ${profile_data}

Get Profile Data With Empty Email
    ${profile_data}=    Get Default Profile Data
    Set To Dictionary    ${profile_data}    ${EMAIL_FIELDS}=${EMPTY}
    [Return]    ${profile_data}

Get Profile Data With Empty Username And Email
    ${profile_data}=    Get Default Profile Data
    Set To Dictionary    ${profile_data}    ${USENAME_FIELDS}=${EMPTY}
    Set To Dictionary    ${profile_data}    ${EMAIL_FIELDS}=${EMPTY}
    [Return]    ${profile_data}

Fill Profile Form
    [Arguments]    ${profile_data}
    Wait Until Element Is Visible    ${FIRST_NAME_FIELDS}    10s
    FOR    ${field}    ${value}    IN    &{profile_data}
        Clear Field And Input Value    ${field}    ${value}
    END

Clear Field And Input Value
    [Arguments]    ${field_input}    ${info_user}
    Clear Element Text    ${field_input}
    Run Keyword If    '${info_user}' != '${EMPTY}'    Input Text    ${field_input}    ${info_user}

Click Update Profile Button
    Wait Until Element Is Visible    ${UPDATE_PROFILE_BUTTON}   10s
    Scroll Element Into View    ${UPDATE_PROFILE_BUTTON}
    Wait Until Element Is Enabled    ${UPDATE_PROFILE_BUTTON}
    Wait Until Page Does Not Contain Element    ${LOADING}    10s
    Click Element    ${UPDATE_PROFILE_BUTTON}

Verify Success Message
    [Arguments]    ${expected_msg}=Your profile has been updated
    Wait Until Element Contains    ${SUCCESS_MESSAGE}    ${expected_msg}    10s
    Element Should Contain    ${SUCCESS_MESSAGE}    ${expected_msg}
   

Verify Error Message For Required Fields
    [Arguments]    ${field_key}
    ${locator}=    Set Variable    ${ERROR_MESSAGES}[${field_key}]
    Wait Until Element Contains    ${locator}    This field is required    10s
    Element Should Contain    ${locator}    This field is required


Verify Profile Data In Form
    [Arguments]    ${profile_data}
    FOR    ${field_input}    ${expected_value}    IN    &{profile_data}
        ${current_value}=    Get Value    ${field_input}
        Should Be Equal    ${current_value}    ${expected_value}
    END


