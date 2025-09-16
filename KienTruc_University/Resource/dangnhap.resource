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
Variables  ../variables/locator.py

*** Variables ***
${BROWSER}    chrome
# Nếu URL chưa có trong locator.py thì mở dòng dưới:
${URL}        https://demo-clo.minds.vn

*** Keywords ***
Login To System
    [Arguments]    ${username}    ${password}
    # Mở trực tiếp trang login EN
    Open Browser    ${URL}/en/accounts/login/?next=/en/    chrome
    Maximize Browser Window

    # Chờ input username xuất hiện
    Wait Until Element Is Visible    ${USERNAME_INPUT}    30s
    Input Text    ${USERNAME_INPUT}    ${username}
    Input Text    ${PASSWORD_INPUT}    ${password}
    Click Button   ${LOGIN_BUTTON}

    # Chờ login thành công bằng nhiều dấu hiệu (aside/nav/sidebar/link Question Bank)
    Wait Until Page Contains Element
    ...    xpath=//aside | //nav | //a[contains(@href, '/questionbank/')] | //*[contains(@class,'sidebar')]
    ...    45s

    # Kiểm tra nếu vẫn ở trang login → fail rõ ràng
    ${still_login}=    Run Keyword And Return Status    Page Should Contain Element    ${USERNAME_INPUT}
    IF    ${still_login}
        Capture Page Screenshot
        Log Location
        Log Source
        Fail    Login failed: Vẫn ở trang login. Kiểm tra username/password hoặc locator.
    END

    # Điều hướng sang trang tạo câu hỏi (nếu cần)
    Go To    ${URL}/en/questionbank/questions/add/
    Wait Until Element Is Visible    ${BUTTON_CREATE_QUESTION}    20s

