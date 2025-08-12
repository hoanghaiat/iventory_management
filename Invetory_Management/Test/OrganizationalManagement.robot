*** Settings ***
Library    SeleniumLibrary
Resource    ../Resource/HomePage.resource
Test Setup    Login To System
Test Teardown    Close Browser
*** Variables ***

*** Test Cases ***