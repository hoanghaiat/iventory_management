*** Settings ***
Resource    core.resource
Library     SeleniumLibrary

*** Variables ***
${URL_TESTS}             ${BASE_URL}/en/assessments/tests/
${BANNER_EMPTY_TEXT}     No tests found. Go to one of your classes to create a test.

# Nhận diện phần tử ổn định
${H_TESTS}               xpath=//h1|//h2[normalize-space()='Tests' or contains(normalize-space(.),'Bài kiểm tra')]
${BANNER_EMPTY}          xpath=//div[contains(@class,'alert') and contains(.,'No tests found')]
${LINK_IN_BANNER}        xpath=//div[contains(@class,'alert')]//a[contains(.,'class') or contains(.,'lớp')]
${LOC_MY_CLASSES}        xpath=//a[contains(.,'My Classes') or contains(.,'Lớp của tôi')]

# Tabs (union nhiều thẻ)
${TAB_ALL}               xpath=(//button|//a|//li|//span)[normalize-space()='All' or normalize-space()='ALL']
${TAB_MIDTERM}           xpath=(//button|//a|//li|//span)[normalize-space()='Midterm']
${TAB_FINAL}             xpath=(//button|//a|//li|//span)[normalize-space()='Final']
${TAB_QUIZ}              xpath=(//button|//a|//li|//span)[normalize-space()='Quiz']
${TAB_ASSIGNMENT}        xpath=(//button|//a|//li|//span)[normalize-space()='Assignment']
${TAB_PROJECT}           xpath=(//button|//a|//li|//span)[normalize-space()='Project']

# Widgets
${CARD_DISTRIBUTION}     xpath=//div[.//text()[normalize-space()='Test Distribution'] or .//h3[normalize-space()='Test Distribution']]
# Tips box có thể thay đổi heading → bắt theo heading HOẶC theo nội dung bullet bên trong
${BOX_TIPS_HEAD}         xpath=//*[self::h3 or self::h2 or self::div][contains(normalize-space(.),'Test Creation Tips') or contains(normalize-space(.),'Tips for Creating Tests')]
${BOX_TIPS_BULLETS}      xpath=//*[contains(.,'Align with CLOs') or contains(.,'Balance Difficulty') or contains(.,'Effective Rubrics')]

# Login form (cho TC chưa login)
${LOGIN_USER}            xpath=//input[@name='username' or @id='id_username']
${LOGIN_PASS}            xpath=//input[@name='password' or @id='id_password']

*** Keywords ***
Open Tests Page
    Go To    ${URL_TESTS}
    Wait Until Document Ready

Expect Tests Page Loaded
    ${k1}=    Run Keyword And Return Status    Page Should Contain Element    ${BANNER_EMPTY}
    ${k2}=    Run Keyword And Return Status    Page Should Contain Element    ${TAB_ALL}
    ${k3}=    Run Keyword And Return Status    Page Should Contain Element    ${CARD_DISTRIBUTION}
    ${k4}=    Run Keyword And Return Status    Page Should Contain Element    ${H_TESTS}
    ${k5}=    Run Keyword And Return Status    Page Should Contain Element    ${LOC_MY_CLASSES}
    ${ok}=    Evaluate    ${k1} or ${k2} or ${k3} or ${k4} or ${k5}
    Should Be True    ${ok}

Click Tab
    [Arguments]    ${tab}
    ${locator}=    Set Variable If
    ...    '${tab}'=='All'         ${TAB_ALL}
    ...    '${tab}'=='Midterm'     ${TAB_MIDTERM}
    ...    '${tab}'=='Final'       ${TAB_FINAL}
    ...    '${tab}'=='Quiz'        ${TAB_QUIZ}
    ...    '${tab}'=='Assignment'  ${TAB_ASSIGNMENT}
    ...    '${tab}'=='Project'     ${TAB_PROJECT}
    Safe Click    ${locator}
    Wait Until Document Ready

Expect Empty Banner
    Page Should Contain Element    ${BANNER_EMPTY}
    Page Should Contain            ${BANNER_EMPTY_TEXT}

Expect Distribution Card
    Page Should Contain Element    ${CARD_DISTRIBUTION}

Expect Tips Box
    ${by_head}=    Run Keyword And Return Status    Page Should Contain Element    ${BOX_TIPS_HEAD}
    ${by_bullet}=  Run Keyword And Return Status    Page Should Contain Element    ${BOX_TIPS_BULLETS}
    ${ok}=    Evaluate    ${by_head} or ${by_bullet}
    Should Be True    ${ok}

Go To My Classes
    Safe Click    ${LOC_MY_CLASSES}
    Wait Until Document Ready
