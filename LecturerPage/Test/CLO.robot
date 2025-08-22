*** Settings ***
Library         SeleniumLibrary
Resource        ../Resource/CLO.resource
Suite Setup     Suite Init
Suite Teardown  Close All Browsers
Test Teardown   Run Keyword If Test Failed    Capture Page Screenshot
Test Timeout    4 minutes
Documentation   CLO: robust login + điều hướng đa chiến lược + marker linh hoạt.

*** Variables ***
${OWNER}        SIU TOMY
${MODULE}       Interface
${BACKLOG}      CLO Page

*** Keywords ***
Suite Init
    Set Screenshot Directory    ${OUTPUTDIR}${/}screenshots
    Ensure Session

*** Test Cases ***
CLO-01 - Mở CLO ổn định (auto)
    [Documentation]    TC_CLO_01
    [Tags]    SIU TOMY    Interface    CLO Page
    Open CLO
    Wait For CLO Page

CLO-02 - Tìm kiếm (nếu có ô Search)
    [Documentation]    TC_CLO_02
    [Tags]    SIU TOMY    Interface    CLO Page
    Open CLO
    Wait For CLO Page
    CLO Search If Present    test

CLO-03 - Click từng card (nếu có) rồi quay lại
    [Documentation]    TC_CLO_03
    [Tags]    SIU TOMY    Interface    CLO Page
    Open CLO
    Wait For CLO Page
    Open CLO Card    tracking
    Go Back
    Wait Until Document Ready
    Open CLO Card    plo
    Go Back
    Wait Until Document Ready
    Open CLO Card    gap
    Go Back
    Wait Until Document Ready

CLO-04 - My Classes từ trang CLO (nếu có)
    [Documentation]    TC_CLO_04
    [Tags]    SIU TOMY    Interface    CLO Page
    Open CLO
    Wait For CLO Page
    Go To My Classes From CLO    SIU TOMY
