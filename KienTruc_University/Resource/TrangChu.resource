*** Settings ***
Library    SeleniumLibrary    run_on_failure=Nothing
Resource    ../Resource/DangNhap.resource
Variables    ../locator.py

*** Variables ***
${EXPECTED_QUICK_OPERATION}    403 Forbidden

*** Keywords ***
Login To System Success
    Open Applications
    Enter Credential    truongkhoa1    demotruongkhoa
    Click Login Button
    Verify Login Successful

Handle Advertise
    Wait Until Element Is Visible    ${BOX_ADVERTISE}    30s
    Click Element    ${LINK_HANDLE}

Wait And Click Quick Operation
    Handle Advertise
    
    Wait Until Element Is Visible    ${LINK_QUICK_OPERATION}    30s
    Scroll Element Into View    ${LINK_QUICK_OPERATION}
    Wait Until Keyword Succeeds    30s    1s    Click Element    ${LINK_QUICK_OPERATION}
Verify Quick Operation Success
   
    Wait Until Element Is Visible    ${ACTUAL_QUICK_OPERATION}
    ${message_actual}=    Get Text    ${ACTUAL_QUICK_OPERATION}
    Should Be Equal    ${message_actual}    ${EXPECTED_QUICK_OPERATION}
    