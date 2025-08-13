*** Settings ***
Library    SeleniumLibrary
Resource    ../Resource/Trangchu.resource

*** Variables ***

*** Test Cases ***
Login
    Login To System    lecturer1    demolecturer
TC_001
    [Documentation]    Thao tac nhanh
    Go To Course Management
    Go To Home Page
    Go To Course Test
    Go To Home Page
    Go to Question Bank
    Sleep    5s
    [Teardown]    Close Browser