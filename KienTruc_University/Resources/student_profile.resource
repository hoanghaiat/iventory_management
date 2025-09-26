*** Settings ***
Library    String
Library    SeleniumLibrary    run_on_failure=No Operation
Library    Easter
Resource   ../resources/student_profile.resource
Resource   ../resources/common.resource
Variables    ../Variables/locator.py

*** Variables ***
${DEFAULT_USERNAME}          student1
${DEFAULT_FIRSTNAME}         Nguyễn Văn
${DEFAULT_LASTNAME}          A
${DEFAULT_EMAIL}             student@student.university.edu.vn
${DEFAULT_PHONE}             0905475265
${DEFAULT_DEPARTMENT}        Khoa Công Nghệ Thông Tin
${DEFAULT_SPECIALIZATION}    Software Engineer


${DETAIL_FULLNAME}           xpath=//div//div//h4
${DETAIL_USERNAME}           xpath=(//ul[contains(@class,'list-group')]/li)[1]//span[contains(@class,'text-primary')]
${DETAIL_EMAIL}              xpath=(//ul[contains(@class,'list-group')]/li)[2]//span[contains(@class,'text-primary')]
${DETAIL_PHONE}              xpath=(//ul[contains(@class,'list-group')]/li)[3]//span[contains(@class,'text-primary')]
${DETAIL_DEPARTMENT}         xpath=(//ul[contains(@class,'list-group')]/li)[4]//span[contains(@class,'text-primary')]
${DETAIL_SPECIALIZATION}     xpath=(//ul[contains(@class,'list-group')]/li)[5]//span[contains(@class,'text-primary')]

&{INPUT_LOCATORS}     
...    username=${USENAME_FIELDS}
...    first_name=${FIRST_NAME_FIELDS}
...    last_name=${LAST_NAME_FIELDS}
...    email=${EMAIL_FIELDS}
...    phone=${PHONE_FIELDS}
...    department=${DEPARTMENT_FIELDS}
...    specialization=${SPECIALIZATION_FIELDS}

&{DETAIL_LOCATORS}
...    fullname=${DETAIL_FULLNAME}
...    username=${DETAIL_USERNAME}
...    email=${DETAIL_EMAIL}
...    phone=${DETAIL_PHONE}
...    department=${DETAIL_DEPARTMENT}
...    specialization=${DETAIL_SPECIALIZATION}

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
    ${profile}=    Create Dictionary
    ...    username=${DEFAULT_USERNAME}
    ...    first_name=${DEFAULT_FIRSTNAME}
    ...    last_name=${DEFAULT_LASTNAME}
    ...    email=${DEFAULT_EMAIL}
    ...    phone=${DEFAULT_PHONE}
    ...    department=${DEFAULT_DEPARTMENT}
    ...    specialization=${DEFAULT_SPECIALIZATION}
    [Return]    ${profile}

Get Profile Data With Empty Username
    ${profile}=    Get Default Profile Data
    Set To Dictionary    ${profile}    username    ${EMPTY}
    [Return]    ${profile}

Get Profile Data With Empty Email
    ${profile}=    Get Default Profile Data
    Set To Dictionary    ${profile}    email    ${EMPTY}
    [Return]    ${profile}

Get Profile Data With Empty Username And Email
    ${profile}=    Get Default Profile Data
    Set To Dictionary    ${profile}    username    ${EMPTY}
    Set To Dictionary    ${profile}    email    ${EMPTY}
    [Return]    ${profile}

Fill Profile Form
    [Arguments]    ${profile_data}
    Wait Until Element Is Visible    ${FIRST_NAME_FIELDS}    10s
    ${keys}=    Get Dictionary Keys    ${profile_data}
    FOR    ${key}    IN    @{keys}
        ${value}=    Get From Dictionary    ${profile_data}    ${key}
        ${locator}=    Get From Dictionary    ${INPUT_LOCATORS}    ${key}
        Clear Element Text    ${locator}
        Run Keyword If    '${value}' != '${EMPTY}'    Input Text    ${locator}    ${value}
    END

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
    ${locator}=    Get From Dictionary    ${ERROR_UPDATE_MESSAGES}    ${field_key}
    Wait Until Element Contains    ${locator}    This field is required    10s
    Element Should Contain    ${locator}    This field is required

Normalize String
    [Arguments]    ${text}
    ${text}=    Replace String Using Regexp    ${text}    [\p{Zs}\s]+    ${SPACE}
    ${text}=    Strip String    ${text}
    [Return]    ${text}

Verify Profile Data In UI
    [Arguments]    ${profile_data}
    
    Wait Until Element Is Visible    ${DETAIL_FULLNAME}    10s
    ${first}=    Get From Dictionary    ${profile_data}    first_name
    ${last}=     Get From Dictionary    ${profile_data}    last_name
    
    ${first}=    Normalize String    ${first}
    ${last}=     Normalize String    ${last}
    
    ${expected_fullname}=    Catenate    SEPARATOR=${SPACE}    ${first}    ${last}
    ${expected_fullname}=    Normalize String    ${expected_fullname}

    ${ui_fullname}=    Get Text    ${DETAIL_FULLNAME}
    ${ui_fullname}=    Normalize String    ${ui_fullname}

    Should Be Equal As Strings    ${ui_fullname}    ${expected_fullname}

    @{fields_to_check}=    Create List    username    email    phone    department    specialization
    FOR    ${key}    IN    @{fields_to_check}
        ${expected}=    Get From Dictionary    ${profile_data}    ${key}
        ${locator}=     Get From Dictionary    ${DETAIL_LOCATORS}    ${key}

        Wait Until Element Is Visible    ${locator}    10s
        ${ui_value}=    Get Text    ${locator}
        ${ui_value}=    Normalize String    ${ui_value}
        ${expected}=    Normalize String    ${expected}

        Should Be Equal As Strings    ${ui_value}    ${expected}
    END