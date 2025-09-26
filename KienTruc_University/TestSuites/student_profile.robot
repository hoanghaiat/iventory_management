*** Settings ***
Library    SeleniumLibrary    run_on_failure=No Operation
Library    Easter
Resource   ../resources/student_profile.resource
Resource   ../resources/common.resource

Suite Setup       Open Browser To Login Page
Test Setup        Open Profile Page
Test Teardown    Go Back Home
Suite Teardown    Close Browser
    
*** Test Cases ***
View Profile Page Successfully
    [Documentation]    TC_PI_01
    [Tags]    Thu Phuong    Interface
    Verify Profile Information

Verify Edit Profile Button Is Visible And Clickable
    [Documentation]    TC_PI_02
    [Tags]    Thu Phuong    Interface
    Click Edit Profile Button
    Page Should Contain Element    ${UPDATE_PROFILE_BUTTON}

Update Profile Successfully With Valid Data
    [Documentation]    TC_PI_03
    [Tags]    Thu Phuong    Edit Profile
    Click Edit Profile Button
    ${profile_data}=    Get Default Profile Data
    Fill Profile Form    ${profile_data}
    Click Update Profile Button
    Verify Success Message

Verify Information Profile Data In UI
    [Documentation]    TC_PI_04
    [Tags]    Thu Phuong    Edit Profile
    Click Edit Profile Button
    ${profile_data}=    Get Default Profile Data
    Fill Profile Form    ${profile_data}
    Click Update Profile Button
    Verify Success Message
    Verify Profile Data In UI    ${profile_data}
   

Update Profile Fails With Empty Username
    [Documentation]    TC_PI_05
    [Tags]    Thu Phuong    Edit Profile
    Click Edit Profile Button
    ${profile_data}=    Get Profile Data With Empty Username
    Fill Profile Form    ${profile_data}
    Click Update Profile Button
    Verify Error Message For Required Fields    username

Update Profile Fails With Empty Email
    [Documentation]    TC_PI_06 
    [Tags]    Thu Phuong    Edit Profile
    Click Edit Profile Button
    ${profile_data}=    Get Profile Data With Empty Email
    Fill Profile Form    ${profile_data}
    Click Update Profile Button
    Verify Error Message For Required Fields    email

Update Profile Fails With Empty Username And Email
    [Documentation]    TC_PI_07 
    [Tags]    Thu Phuong    Edit Profile
    Click Edit Profile Button
    ${profile_data}=    Get Profile Data With Empty Username And Email
    Fill Profile Form    ${profile_data}
    Click Update Profile Button
    Verify Error Message For Required Fields    username
    Verify Error Message For Required Fields    email

Verify Log Out Successfully
    [Documentation]    TC_PL_08
    [Tags]    Thu Phuong    Log out
    [Setup]    NONE 
    [Teardown]    NONE
    Click Log Out Button
    Wait Until Location Contains    ${URL}

Update Profile Successfully With Valid Data
    [Documentation]    TC_PI_09 
    [Tags]    Thu Phuong    Edit Profile
    Click Edit Profile Button
    ${profile_data}=    Get Default Profile Data
    Fill Profile Form    ${profile_data}
    Click Update Profile Button
    Verify Success Message