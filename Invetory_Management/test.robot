*** Settings ***
Library    SeleniumLibrary
Resource    resource.resource

*** Variables ***

*** Test Cases ***
Login
    Login To System    xpath_username    xpath_password    xpath_button