*** Settings ***
Library    SeleniumLibrary    timeout=15    run_on_failure=Capture Page Screenshot

*** Variables ***
${BASE_URL}         https://demo-clo.minds.vn
${BROWSER}          chrome
${USERNAME}         lecturer1
${PASSWORD}         demolecturer

${QB_URL_EN}        ${BASE_URL}/en/questionbank/questions/
${QB_URL_PLAIN}     ${BASE_URL}/questionbank/questions/

${INP_USERNAME}     xpath=//input[@id='id_username']
${INP_PASSWORD}     xpath=//input[@id='id_password']
${BTN_LOGIN}        xpath=//button[normalize-space(.)='Đăng nhập']

${BTN_HIDE_DEBUG}   xpath=//a[@id='djHideToolBarButton']

${FORM_FILTER}      xpath=//form[.//input[@id='my_questions']]
${CHECK_MYQ}        xpath=//input[@id='my_questions']
${LBL_MYQ}          xpath=//label[@for='my_questions' or contains(.,'Câu hỏi của tôi') or contains(translate(.,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'),'my questions')]

${BTN_APPLY}        xpath=//button[@type='submit' and contains(@class,'btn')]
${BTN_CLEAR}        xpath=(//a[contains(@class,'btn') and contains(@class,'btn-secondary')][contains(.,'Clear') or contains(.,'Xóa')])[1]

${QUESTION_CARD}    xpath=//div[contains(@class,'question-card')]
${EMPTY_STATE}      xpath=//div[contains(@class,'alert')]

${INPUT_SEARCH}     xpath=//input[@id='q']

*** Keywords ***
Open Browser And Login
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    ${INP_USERNAME}
    Input Text    ${INP_USERNAME}    ${USERNAME}
    Input Text    ${INP_PASSWORD}    ${PASSWORD}
    Click Button    ${BTN_LOGIN}
    Wait Until Page Contains Element    //body

Open Question Bank
    # Tránh click menu bị intercept → đi thẳng URL
    Go To    ${QB_URL_EN}
    Maybe Hide Debug Toolbar
    ${ok}=    Run Keyword And Return Status    Wait Until Page Contains Element    ${CHECK_MYQ}    7s
    Return From Keyword If    ${ok}
    Go To    ${QB_URL_PLAIN}
    Maybe Hide Debug Toolbar
    Wait Until Page Contains Element    ${CHECK_MYQ}    10s

Maybe Hide Debug Toolbar
    ${has}=    Run Keyword And Return Status    Page Should Contain Element    ${BTN_HIDE_DEBUG}
    IF    ${has}
        Click Element    ${BTN_HIDE_DEBUG}
        Sleep    0.2s
    END

Clear All Filters
    # 1) thử nút Clear; 2) nếu không có thì reset form bằng JS
    ${has_clear}=    Run Keyword And Return Status    Page Should Contain Element    ${BTN_CLEAR}
    IF    ${has_clear}
        Safe Click    ${BTN_CLEAR}
    ELSE
        Execute Javascript    var f=document.evaluate("//form[.//input[@id='my_questions']]",document,null,XPathResult.FIRST_ORDERED_NODE_TYPE,null).singleNodeValue;if(f){f.reset();}
    END
    Wait For Results Or Empty

Toggle My Questions
    [Arguments]    ${state}=on
    Wait Until Element Is Visible    ${CHECK_MYQ}    10s
    ${is_selected}=    Run Keyword And Return Status    Checkbox Should Be Selected    ${CHECK_MYQ}
    Run Keyword If    '${state}'=='on' and not ${is_selected}    Click Element    ${CHECK_MYQ}
    Run Keyword If    '${state}'!='on' and ${is_selected}    Click Element    ${CHECK_MYQ}
    Sleep    0.2s

Set Search Query
    [Arguments]    ${text}
    Wait Until Element Is Visible    ${INPUT_SEARCH}    5s
    Wait Until Element Is Enabled    ${INPUT_SEARCH}    5s
    Input Text    ${INPUT_SEARCH}    ${text}
    Sleep    0.2s

Apply Filters
    Wait Until Element Is Visible    ${BTN_APPLY}    5s
    Click Element    ${BTN_APPLY}
    Wait For Results Or Empty

Wait For Results Or Empty
    ${ok}=    Run Keyword And Return Status    Wait Until Page Contains Element    ${QUESTION_CARD}    10s
    Return From Keyword If    ${ok}
    ${empty}=    Run Keyword And Return Status    Wait Until Page Contains Element    ${EMPTY_STATE}    5s
    Return From Keyword If    ${empty}
    ${n}=    Get Element Count    ${QUESTION_CARD}
    Return From Keyword If    ${n} == 0
    Sleep    0.5s

Safe Click
    [Arguments]    ${locator}
    ${ok}=    Run Keyword And Return Status    Click Element    ${locator}
    Return From Keyword If    ${ok}
    Run Keyword And Ignore Error    Scroll Element Into View    ${locator}
    Wait Until Element Is Visible    ${locator}    5s
    Wait Until Element Is Enabled    ${locator}    5s
    Click Element    ${locator}
