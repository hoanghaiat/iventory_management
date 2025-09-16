*** Comments ***
# Ghi chú tổng quan về quy trình chạy test (không cần sửa).

*** Settings ***
Library    SeleniumLibrary
# Import thư viện SeleniumLibrary để thao tác với trình duyệt.

*** Variables ***
${BASE_URL}     https://demo-clo.minds.vn
# Địa chỉ trang web cần test.
${BROWSER}      chrome
# Loại trình duyệt sử dụng.
${USERNAME}     lecturer1
${PASSWORD}     demolecturer
# Tài khoản đăng nhập.

# ====== Locators ======
# Định nghĩa các locator (vị trí phần tử trên giao diện) để sử dụng cho các thao tác.
${MENU_QB}                 xpath=//a[contains(@href,'/questionbank/questions/')]
${COURSE}                  xpath=(//div[contains(@class,'filter') or contains(.,'Filter Options')]//select)[1]
# ... các locator khác dùng cho bộ lọc, input, nút, v.v.

*** Keywords ***
Open Browser And Login
    Open Browser    ${BASE_URL}/en/accounts/login/?next=/en/    ${BROWSER}
    # Mở trình duyệt và truy cập trang đăng nhập.
    Maximize Browser Window
    # Phóng to cửa sổ trình duyệt.
    Wait Until Element Is Visible    xpath=//input[@id='id_username']    20s
    # Đợi đến khi ô nhập username xuất hiện.
    Input Text    xpath=//input[@id='id_username']    ${USERNAME}
    # Nhập username.
    Input Text    xpath=//input[@id='id_password']    ${PASSWORD}
    # Nhập password.
    Click Button   xpath=//button[normalize-space()='Đăng nhập']
    # Click nút đăng nhập.
    Wait Until Element Is Visible    ${MENU_QB}    30s
    # Đợi đến khi menu Question Bank xuất hiện.

Go To Question Bank
    Click Element    ${MENU_QB}
    # Click vào menu Question Bank.
    Wait Until Element Is Visible    ${BTN_APPLY}    20s
    # Đợi nút Apply Filters xuất hiện.
    Run Keyword And Ignore Error     Close Debug Overlay
    # Đóng overlay debug nếu có.

Close Debug Overlay
    # Keyword helper để đóng overlay debug nếu xuất hiện.
    ${overlay}=    Set Variable    css=.StaticFilesPanel, #djDebug, .djDebug
    ${exists}=     Run Keyword And Return Status    Execute Javascript    return document.querySelector(arguments[0])!==null;    ${overlay}
    IF    ${exists}
        Execute Javascript    document.querySelectorAll(arguments[0]).forEach(e=>e.style.display='none');    ${overlay}
    END

Normalize Text
    [Arguments]    ${text}
    # Chuẩn hóa text: bỏ dấu, chuyển về chữ thường, loại bỏ khoảng trắng.
    ${norm}=    Evaluate    import unicodedata; ''.join(c for c in unicodedata.normalize('NFKD', """${text}""") if not unicodedata.combining(c)).lower().strip()
    [Return]    ${norm}

Select Option Smart
    [Arguments]    ${select_locator}    ${desired_label}
    # Chọn option trong dropdown theo label, không phân biệt hoa-thường, có thể contains.
    Wait Until Element Is Visible    ${select_locator}    10s
    ${items}=    Get List Items      ${select_locator}
    Log    Options in ${select_locator}: ${items}
    ${norm_desired}=    Normalize Text    ${desired_label}
    ${selected}=        Set Variable    ${False}
    FOR    ${index}    ${label}    IN ENUMERATE    @{items}
        ${norm_label}=       Normalize Text    ${label}
        ${match_exact}=      Run Keyword And Return Status    Should Be Equal    ${norm_label}    ${norm_desired}
        ${match_contains}=   Run Keyword And Return Status    Should Contain     ${norm_label}    ${norm_desired}
        IF    ${match_exact} or ${match_contains}
            Select From List By Index    ${select_locator}    ${index}
            ${selected}=    Set Variable    ${True}
            Exit For Loop
        END
    END
    Run Keyword If    not ${selected}    Fail    Option '${desired_label}' not found. Available: ${items}

# Các keyword Set Course, Set CLO, ... dùng Select Option Smart để chọn giá trị cho từng bộ lọc.
Set Course
    [Arguments]    ${label}
    Select Option Smart    ${COURSE}    ${label}

# ... các keyword Set CLO, Set Question Type, ... tương tự.

Set Search Query
    [Arguments]    ${text}
    # Đặt giá trị cho ô tìm kiếm.
    Clear Element Text    ${SEARCH_INPUT}
    Input Text            ${SEARCH_INPUT}    ${text}

Toggle My Questions
    [Arguments]    ${should_check}=True
    # Bật/tắt checkbox 'Show only my questions'.
    ${is_checked}=    Run Keyword And Return Status    Checkbox Should Be Selected    ${MY_QUESTIONS_CHECK}
    Run Keyword If    ${should_check} and not ${is_checked}    Click Element    ${MY_QUESTIONS_CHECK}
    ...    ELSE IF    not ${should_check} and ${is_checked}    Click Element    ${MY_QUESTIONS_CHECK}

Apply Filters
    # Thực hiện thao tác Apply Filters, có chống overlay và fallback JS nếu click thường không được.
    Wait Until Element Is Visible    ${BTN_APPLY}    15s
    Scroll Element Into View         ${BTN_APPLY}
    Sleep    0.3s
    Run Keyword And Ignore Error     Close Debug Overlay
    ${clicked}=    Run Keyword And Return Status    Click Element    ${BTN_APPLY}
    IF    not ${clicked}
        ${js_clicked}=    Run Keyword And Return Status    Execute Javascript    arguments[0].click();    ${BTN_APPLY}
        IF    not ${js_clicked}
            Execute Javascript    (function(b){var f=b.closest('form'); if(f){f.submit();}})(arguments[0]);    ${BTN_APPLY}
        END
    END
    Wait Until Any Elements Visible    ${ROWS}    ${NO_DATA}    15s

Clear Filters
    Click Element    ${BTN_CLEAR}
    Wait Until Element Is Visible    ${BTN_APPLY}    10s

Should Have Data
    # Kiểm tra có dữ liệu hiển thị trên bảng.
    Run Keyword And Expect Error    *    Element Should Not Be Visible    ${NO_DATA}
    Page Should Contain Element     ${ROWS}

Should Show No Data
    # Kiểm tra trạng thái không có dữ liệu.
    Element Should Be Visible       ${NO_DATA}

Wait Until Any Elements Visible
    [Arguments]    ${locator1}    ${locator2}    ${timeout}=15s
    # Đợi cho đến khi một trong hai locator xuất hiện.
    ${ok}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${locator1}    ${timeout}
    Return From Keyword If    ${ok}
    Wait Until Element Is Visible    ${locator2}    ${timeout}
