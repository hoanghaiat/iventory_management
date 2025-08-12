*** Settings ***
Resource    ../resources/student_profile.resource

Test Setup       Open Browser To Login Page
Test Teardown    Close Browser
Suite Teardown   Close Browser

*** Test Cases ***
TC_PI_01 View Profile Page Successfully
    [Tags]    Profile    Interface    Positive
    Login As Student
    Open Profile Page
    Verify Profile Information

TC_PL_02 Verify Edit Profile Button Visibility And Clickability 
    [Tags]    Profile    Interface    Positive
    Login As Student
    Open Profile Page
    Click Edit Profile Button
    Page Should Contain Element    ${UPDATE_PROFILE_BUTTON}

TC_PE_03 Update profile successfully with valid data 
    [Tags]    Profile   Edit    Positive 
    Login As Student
    Open Profile Page
    Click Edit Profile Button
    Fill Profile With Valid Data   student1   Nguyễn Văn    A     student@student.university.edu.vn   0905475265    Khoa Công Nghệ Thông Tin    Software Engineer
    Click Update Profile Button 
    Verify Success Message And Profile Update  

TC_PE_04 Verify Update Profile With Empty Username Fields 
    [Tags]    Profile   Edit   Negative 
    Login As Student
    Open Profile Page
    Click Edit Profile Button
    Fill Profile Form With Empty Username Fields
    Click Update Profile Button
    Verify Error Message For Required Fields    username

TC_PE_05 Verify Update Profile With Empty Email Fields 
    [Tags]   Profile    Edit   Negative 
    Login As Student
    Open Profile Page 
    Click Edit Profile Button
    Fill Profile Form With Empty Email
    Click Update Profile Button
    Verify Error Message For Required Fields     email

TC_PE_06 Verify Update Profile With Valid Username & Email
    [Tags]  Profile    Edit   Positive 
    Login As Student
    Open Profile Page 
    Click Edit Profile Button 
    Fill Profile Form With Valid Username & Email 
    Click Update Profile Button
    Verify Success Message And Profile Update 

TC_PL_08 Verify Log Out Successfully 
    [Tags]  Log out    Positive 
    Login As Student
    Click Log Out Button
