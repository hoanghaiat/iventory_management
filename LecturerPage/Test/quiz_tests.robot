*** Settings ***
Library           SeleniumLibrary
Library           Collections
Library           String
Suite Setup       Setup And Open TestsPage
Suite Teardown    Close All Browsers
Test Teardown     Capture Page Screenshot
Test Timeout      3 minutes

*** Variables ***
${BASE_URL}        https://demo-clo.minds.vn
${LOGIN_URL}       ${BASE_URL}/en/accounts/login/?next=/en/
${BROWSER}         chrome
${USERNAME}        lecturer1
${PASSWORD}        demolecturer
${TO}              25s

# ----- Locators bám đúng chữ có trong ảnh -----
${LOC_INPUT_USER}        //input[@name='username' or @type='text']
${LOC_INPUT_PASS}        //input[@name='password' or @type='password']
${LOC_BTN_LOGIN}         //button[@type='submit']

${LOC_MENU_TESTS}        //a[normalize-space()='Bài kiểm tra' or contains(.,'Bài kiểm tra')]

${LOC_H1_TITLE}          //h1[normalize-space()='Quản lý bài kiểm tra']
${LOC_BREAD_HOME}        //a[normalize-space()='Trang chủ']
${LOC_BREAD_CURR}        //nav//li[normalize-space()='Quản lý bài kiểm tra'] | //ol[contains(@class,'breadcrumb')]//*[normalize-space()='Quản lý bài kiểm tra']
${LOC_BTN_MY_CLASSES}    //a[normalize-space()='My Classes']

${LOC_CARD_HEADER_TESTS}         //*[self::h2 or self::a][normalize-space()='Tests and Assessments']
${LOC_TAB_ALL}                   //a[normalize-space()='All']
${LOC_TAB_MIDTERM}               //a[normalize-space()='Midterm']
${LOC_TAB_FINAL}                 //a[normalize-space()='Final']
${LOC_TAB_QUIZ}                  //a[normalize-space()='Quiz']
${LOC_TAB_ASSIGN}                //a[normalize-space()='Assignment']
${LOC_TAB_PROJECT}               //a[normalize-space()='Project']
${LOC_EMPTY_MSG}                 //*[contains(normalize-space(),'No tests found. Go to one of your classes to create a test.')]

${LOC_HDR_DISTRIBUTION}          //a[normalize-space()='Test Distribution']
${LOC_INNER_DISTRIBUTION_TITLE}  //*[normalize-space()='Test Types Distribution']
${LOC_LEGEND_MIDTERM}            //*[normalize-space()='Midterm']
${LOC_LEGEND_FINAL}              //*[normalize-space()='Final']
${LOC_LEGEND_QUIZ}               //*[normalize-space()='Quiz']
${LOC_LEGEND_ASSIGN}             //*[normalize-space()='Assignment']
${LOC_LEGEND_PROJECT}            //*[normalize-space()='Project']

${LOC_HDR_TIPS}                  //*[self::h2 or self::a][normalize-space()='Test Creation Tips']
${LOC_TIP1}                      //a[normalize-space()='1. Align with CLOs']
${LOC_TIP1_DESC_START}           //*[starts-with(normalize-space(),'Ensure your test questions target specific CLOs')]
${LOC_TIP2}                      //a[normalize-space()='2. Balance Difficulty']
${LOC_TIP2_DESC_START}           //*[starts-with(normalize-space(),'Include a mix of easy, medium, and hard questions')]
${LOC_TIP3}                      //a[normalize-space()='3. Create Effective Rubrics']
${LOC_TIP3_DESC_START}           //*[starts-with(normalize-space(),'Develop detailed rubrics that clearly define')]
${LOC_TIP4}                      //a[normalize-space()='4. Analysis and Improvement']
${LOC_TIP4_DESC_START}           //*[starts-with(normalize-space(),'After grading, generate test analysis reports')]

${LOC_GROUP_TONGQUAN}            //*[normalize-space()='TỔNG QUAN']
${LOC_GROUP_QLHT}                //*[normalize-space()='QUẢN LÝ HỌC THUẬT']
${LOC_GROUP_NHC}                 //*[normalize-space()='NGÂN HÀNG CÂU HỎI']
${LOC_GROUP_DANHGIA}             //*[normalize-space()='ĐÁNH GIÁ']
${LOC_MENU_BAI_KIEM_TRA}         //a[normalize-space()='Bài kiểm tra' or contains(.,'Bài kiểm tra')]

*** Keywords ***
Setup And Open TestsPage
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    0.2 seconds
    Wait Until Element Is Visible    ${LOC_INPUT_USER}    ${TO}
    Input Text    ${LOC_INPUT_USER}    ${USERNAME}
    Input Text    ${LOC_INPUT_PASS}    ${PASSWORD}
    Click Element  ${LOC_BTN_LOGIN}
    Wait Until Keyword Succeeds    10x    1s    Hide Overlays
    # Điều hướng bằng click an toàn (tránh intercept)
    Wait Until Element Is Visible    ${LOC_MENU_TESTS}    ${TO}
    Safe JS Click    ${LOC_MENU_TESTS}
    Wait Until Element Is Visible    ${LOC_H1_TITLE}    ${TO}

Hide Overlays
    # Ẩn Django Debug Toolbar & rails của Perfect Scrollbar nếu có
    Run Keyword And Ignore Error    Execute JavaScript    const e=document.getElementById('djDebug'); if(e){e.style.display='none';}
    Run Keyword And Ignore Error    Execute JavaScript    document.querySelectorAll('.ps__rail-y,.ps__rail-x').forEach(el=>el.style.pointerEvents='none');
    Run Keyword And Ignore Error    Execute JavaScript    document.querySelectorAll('.modal-backdrop,.toast,.tooltip,.popover').forEach(el=>el.style.display='none');

Safe JS Click
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    ${TO}
    Run Keyword And Ignore Error    Scroll Element Into View    ${locator}
    ${status}=    Run Keyword And Return Status    Click Element    ${locator}
    Run Keyword If    not ${status}    Click By JS    ${locator}

Click By JS
    [Arguments]    ${locator}
    ${el}=    Get WebElement    ${locator}
    Execute JavaScript    arguments[0].click();    ${el}

Click Tab And Verify Empty
    [Arguments]    ${TAB_LOCATOR}
    Safe JS Click    ${TAB_LOCATOR}
    Wait Until Element Is Visible    ${LOC_EMPTY_MSG}    ${TO}

*** Test Cases ***
QZ01 - Tiêu đề trang đúng như ảnh
    Page Should Contain Element    ${LOC_H1_TITLE}

QZ02 - Breadcrumb đúng như ảnh
    Page Should Contain Element    ${LOC_BREAD_HOME}
    Page Should Contain Element    ${LOC_BREAD_CURR}

QZ03 - Có nút "My Classes"
    Page Should Contain Element    ${LOC_BTN_MY_CLASSES}

QZ04 - Có header "Tests and Assessments"
    Page Should Contain Element    ${LOC_CARD_HEADER_TESTS}

QZ05 - Có đủ các tab đúng chữ
    Page Should Contain Element    ${LOC_TAB_ALL}
    Page Should Contain Element    ${LOC_TAB_MIDTERM}
    Page Should Contain Element    ${LOC_TAB_FINAL}
    Page Should Contain Element    ${LOC_TAB_QUIZ}
    Page Should Contain Element    ${LOC_TAB_ASSIGN}
    Page Should Contain Element    ${LOC_TAB_PROJECT}

QZ06 - Tab All hiển thị thông báo rỗng đúng chữ
    Click Tab And Verify Empty    ${LOC_TAB_ALL}

QZ07 - Tab Midterm hiển thị thông báo rỗng đúng chữ
    Click Tab And Verify Empty    ${LOC_TAB_MIDTERM}

QZ08 - Tab Final hiển thị thông báo rỗng đúng chữ
    Click Tab And Verify Empty    ${LOC_TAB_FINAL}

QZ09 - Tab Quiz hiển thị thông báo rỗng đúng chữ
    Click Tab And Verify Empty    ${LOC_TAB_QUIZ}

QZ10 - Tab Assignment hiển thị thông báo rỗng đúng chữ
    Click Tab And Verify Empty    ${LOC_TAB_ASSIGN}

QZ11 - Tab Project hiển thị thông báo rỗng đúng chữ
    Click Tab And Verify Empty    ${LOC_TAB_PROJECT}

QZ12 - Card "Test Distribution" & tiêu đề biểu đồ đúng chữ
    Page Should Contain Element    ${LOC_HDR_DISTRIBUTION}
    Page Should Contain Element    ${LOC_INNER_DISTRIBUTION_TITLE}

QZ13 - Legend biểu đồ có đủ 5 nhãn đúng chữ
    Page Should Contain Element    ${LOC_LEGEND_MIDTERM}
    Page Should Contain Element    ${LOC_LEGEND_FINAL}
    Page Should Contain Element    ${LOC_LEGEND_QUIZ}
    Page Should Contain Element    ${LOC_LEGEND_ASSIGN}
    Page Should Contain Element    ${LOC_LEGEND_PROJECT}

QZ14 - Card "Test Creation Tips" đúng chữ & đủ 4 mục
    Page Should Contain Element    ${LOC_HDR_TIPS}
    Page Should Contain Element    ${LOC_TIP1}
    Page Should Contain Element    ${LOC_TIP2}
    Page Should Contain Element    ${LOC_TIP3}
    Page Should Contain Element    ${LOC_TIP4}

QZ15 - Nội dung mô tả từng tip bắt đầu đúng như ảnh
    Page Should Contain Element    ${LOC_TIP1_DESC_START}
    Page Should Contain Element    ${LOC_TIP2_DESC_START}
    Page Should Contain Element    ${LOC_TIP3_DESC_START}
    Page Should Contain Element    ${LOC_TIP4_DESC_START}

QZ16 - Nhãn nhóm menu trái đúng chữ trong ảnh
    Page Should Contain Element    ${LOC_GROUP_TONGQUAN}
    Page Should Contain Element    ${LOC_GROUP_QLHT}
    Page Should Contain Element    ${LOC_GROUP_NHC}
    Page Should Contain Element    ${LOC_GROUP_DANHGIA}
    Page Should Contain Element    ${LOC_MENU_BAI_KIEM_TRA}
