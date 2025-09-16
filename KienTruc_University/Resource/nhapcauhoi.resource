*** Comments ***
Ghi chú quy trình chạy file test Robot Framework:
1. Kiểm tra cấu trúc file test, đảm bảo đã import resource và library cần thiết.
2. Chuẩn bị môi trường: cài đặt Python, Robot Framework, SeleniumLibrary, ChromeDriver.
3. Đóng hết các trình duyệt Chrome đang mở để tránh lỗi session.
4. Chạy file test bằng lệnh: robot đường_dẫn_đến_file.robot (hoặc đường dẫn file mong muốn).
5. Theo dõi quá trình chạy, kiểm tra log và report trong thư mục kết quả (results).
6. Sau khi chạy xong, các keyword teardown sẽ tự động đóng trình duyệt.
7. Nếu có lỗi, kiểm tra lại locator, resource, version ChromeDriver.
8. Kết quả chi tiết nằm ở log.html, report.html trong thư mục results.
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BASE_URL}     https://demo-clo.minds.vn
${BROWSER}      chrome
${USERNAME}     lecturer1
${PASSWORD}     demolecturer

# ---- Locators ổn định (EN/VN) ----
${H_LOGIN}            xpath=//form//input[@id="id_username"]
${P_LOGIN}            xpath=//form//input[@id="id_password"]
${BTN_LOGIN}          xpath=//button[normalize-space(.)="Đăng nhập" or normalize-space(.)="Login"]

${QB_PAGE_MARKER}     xpath=//h1[contains(., "Question Bank") or contains(., "Ngân hàng câu hỏi")]
${BTN_ACTIONS}        xpath=//button[contains(., "Actions") or contains(., "Thao tác")]
${LNK_IMPORT}         xpath=//a[contains(@href,"/questionbank/questions/import") or contains(., "Import Questions") or contains(., "Nhập câu hỏi")]

${IMPORT_INPUT}       css:input[type="file"]
${BTN_UPLOAD}         xpath=//button[.//span[normalize-space(.)="Upload"] or contains(., "Tải lên") or @type="submit"]

# Toast / alert (tuỳ theme – để rộng)
${TOAST_SUCCESS}      xpath=//*[contains(@class,"alert") or contains(@class,"toast")][contains(., "success") or contains(., "thành công") or contains(., "Success")]
${TOAST_ERROR}        xpath=//*[contains(@class,"alert") or contains(@class,"toast")][contains(., "error") or contains(., "thất bại") or contains(., "Invalid") or contains(., "lỗi")]

# Manage Tags
${LNK_MANAGE_TAGS}    xpath=//a[contains(@href,"/taxonomy") or contains(., "Manage Tags") or contains(., "Quản lý tag")]
${TAG_PAGE_MARKER}    xpath=//*[contains(., "Tag") and (self::h1 or self::h2 or contains(@class,"page-title"))]

# Filters (có thể cần chỉnh theo DOM thực tế)
${FILTER_CONTAINER}   xpath=//form[.//button or .//select][contains(., "Filter") or contains(., "Bộ lọc") or contains(@class,"filter")]
${SEL_COURSE}         xpath=(//select)[1]
${SEL_DIFFICULTY}     xpath=(//select)[2]
${BTN_CLEAR_FILTERS}  xpath=//a[contains(., "Clear Filters") or contains(., "Xóa bộ lọc") or contains(@href,"clear")]

# URL login candidate (nếu cần mở trực tiếp)
@{LOGIN_CANDIDATES}   /en/accounts/login/    /accounts/login/    /en/admin/login/

*** Keywords ***
Open Browser And Login
    [Documentation]    Mở site, để hệ thống tự redirect login tại trang Question Bank, đăng nhập và chờ trang ổn định.
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Go To    ${BASE_URL}/en/questionbank/questions/
    Wait Until Element Is Visible    ${H_LOGIN}    15s
    Input Text    ${H_LOGIN}    ${USERNAME}
    Input Text    ${P_LOGIN}    ${PASSWORD}
    Click Button  ${BTN_LOGIN}
    Wait For QB Landed

Go To Question Bank
    Go To    ${BASE_URL}/en/questionbank/questions/
    Wait For QB Landed

Wait For QB Landed
    Wait Until Element Is Visible    ${QB_PAGE_MARKER}    20s
    # Đợi spinner tắt (tránh InvalidSelector: KHÔNG dùng dấu phẩy gộp locator)
    Run Keyword And Ignore Error    Wait Until Page Does Not Contain Element    css:.spinner    5s
    Run Keyword And Ignore Error    Wait Until Page Does Not Contain Element    css:[aria-busy="true"]    5s
    # Đảm bảo DOM đã sẵn sàng
    Wait Until Keyword Succeeds    5x    1s    Execute Javascript    return document.readyState === "complete"

Open Import Dialog
    Go To Question Bank
    ${has_actions}=    Run Keyword And Return Status    Page Should Contain Element    ${BTN_ACTIONS}
    IF    ${has_actions}
        Click Element    ${BTN_ACTIONS}
    END
    Wait Until Element Is Visible    ${LNK_IMPORT}    10s
    Click Element    ${LNK_IMPORT}
    Wait Until Keyword Succeeds    3x    1s    Ensure File Input Visible

Ensure File Input Visible
    ${visible}=    Run Keyword And Return Status    Element Should Be Visible    ${IMPORT_INPUT}
    IF    not ${visible}
        Execute Javascript    const el=document.querySelector('input[type="file"]'); if(el){el.style.display='block'; el.classList.remove('d-none','hidden'); el.removeAttribute('hidden');}
    END
    Page Should Contain Element    ${IMPORT_INPUT}

Import File And Submit
    [Arguments]    ${path}
    Choose File    ${IMPORT_INPUT}    ${path}
    ${has_upload}=    Run Keyword And Return Status    Page Should Contain Element    ${BTN_UPLOAD}
    IF    ${has_upload}
        Click Element    ${BTN_UPLOAD}
    ELSE
        Sleep    0.5s
    END

Toast Should Be Success
    Wait Until Element Is Visible    ${TOAST_SUCCESS}    15s

Toast Should Be Error
    Wait Until Element Is Visible    ${TOAST_ERROR}    15s

Go To Manage Tags
    Go To Question Bank
    ${has_actions}=    Run Keyword And Return Status    Page Should Contain Element    ${BTN_ACTIONS}
    IF    ${has_actions}
        Click Element    ${BTN_ACTIONS}
    END
    Wait Until Element Is Visible    ${LNK_MANAGE_TAGS}    10s
    Click Element    ${LNK_MANAGE_TAGS}

Tag Page Should Open
    Wait Until Element Is Visible    ${TAG_PAGE_MARKER}    15s

Select Filter Values
    [Arguments]    ${course_label}    ${difficulty_label}
    Go To Question Bank
    Scroll Element Into View    ${QB_PAGE_MARKER}
    Select From List By Label    ${SEL_COURSE}       ${course_label}
    Select From List By Label    ${SEL_DIFFICULTY}   ${difficulty_label}

Clear All Filters
    Click Element    ${BTN_CLEAR_FILTERS}

Filters Should Reset
    ${course}=    Get Selected List Label    ${SEL_COURSE}
    ${diff}=      Get Selected List Label    ${SEL_DIFFICULTY}
    Should Be True    '${course}'=='' or 'select' in '${course}'.lower()
    Should Be True    '${diff}'=='' or 'select' in '${diff}'.lower()
