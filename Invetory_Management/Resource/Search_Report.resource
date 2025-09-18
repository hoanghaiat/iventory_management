*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource    ../resource/home_page.resource
Resource    ../resource/organizational_management.resource
Variables    ../variables/locator.py

*** Keywords ***
Duyet Tung Dong Bang Chua Tu Khoa
    [Arguments]    ${keyword}
    ${tables}=    Get WebElements    xpath=//table
    ${found}=    Set Variable    False
    FOR    ${table}    IN    @{tables}
        ${table_text}=    Get Text    ${table}
        IF    $keyword in $table_text
            ${found}=    Set Variable    True
            Duyet Tung Dong Ket Qua    ${table}    ${keyword}
            Exit For Loop
        END
    END
    Run Keyword Unless    ${found}    Fail    Không tìm thấy bảng chứa từ khóa "${keyword}"

Duyet Tung Dong Ket Qua
    [Arguments]    ${table_xpath}    ${keyword}
    ${rows} =    Get WebElements    xpath=//table//tbody//tr
    FOR    ${row}    IN    @{rows}
        ${text}=    Get Text    ${row}
        Log    Nội dung dòng: ${text}
        Should Contain    ${text}    ${keyword}    Dòng không chứa từ khóa "${keyword}"
    END

Duyet Tung Dong Chua Nhieu Tu Khoa
    [Arguments]    @{keywords}
    ${pattern}=    Catenate    SEPARATOR=|    @{keywords}
    ${rows}=    Get WebElements    xpath=//table//tbody//tr
    FOR    ${row}    IN    @{rows}
        ${text}=    Get Text    ${row}
        Log    Nội dung dòng: ${text}
        Should Match Regexp    ${text}    (?i).*(${pattern}).*
    END

Do Search
    [Arguments]    ${keyword}
    Click Element    ${Search_Textbox}
    Input Text    ${Search_Textbox}    ${keyword}
    Wait Until Element Is Visible    ${button_search}    10s
    Scroll Element Into View         ${button_search}
    Click Button    ${button_search}

Verify Search Error 
    Wait Until Page Contains    Không tìm thấy kết quả nào


Search Textbox Blank
    Wait Until Element Is Visible    ${button_search}    10s
    Scroll Element Into View         ${button_search}
    Click Button    ${button_search}
    Wait Until Page Contains    Không tìm thấy kết quả nào

Search DonVi
    [Arguments]    ${don_vi}
    Wait Until Element Is Visible    ${dropdown_donvi}    10s
    Select From List By Label    ${dropdown_donvi}    ${don_vi}

    Wait Until Element Is Visible    ${button_search}    10s
    Scroll Element Into View    ${button_search}
    Click Button    ${button_search}

    Wait Until Element Is Visible    xpath=//table    10s
    Duyet Tung Dong Bang Chua Tu Khoa    ${don_vi}

Search DonVi and Phong 
    [Arguments]    ${donvi}    ${phong}
    Wait Until Element Is Visible    ${dropdown_donvi}    10s
    Select From List By Label    ${dropdown_donvi}    ${donvi}
    Wait Until Element Is Visible    ${dropdown_phong}    10s
    Wait Until Element Contains    ${dropdown_phong}    ${phong}    10s 
    Scroll Element Into View    ${dropdown_phong}
    Select From List By Label    ${dropdown_phong}    ${phong}

    Wait Until Element Is Visible    ${button_search}    10s
    Scroll Element Into View    ${button_search}
    Click Button    ${button_search}

    Wait Until Element Is Visible    xpath=//table    10s
    Scroll Element Into View    xpath=//table
    Duyet Tung Dong Chua Nhieu Tu Khoa    ${donvi}    ${phong}

Search Kho
    [Arguments]    ${kho}
    Wait Until Element Is Visible    ${dropdown_kho}    10s
    Scroll Element Into View    ${dropdown_kho}
    Select From List By Label    ${dropdown_kho}    ${kho}

    Wait Until Element Is Visible    ${button_search}    10s
    Scroll Element Into View    ${button_search}
    Click Button    ${button_search}

    Wait Until Element Is Visible    xpath=//table    10s
    Duyet Tung Dong Bang Chua Tu Khoa    ${kho}
Search Gia        
    [Arguments]    ${donvi}    ${phong}    ${kho}    ${gia}
    Wait Until Element Is Visible    ${dropdown_donvi}    10s
    Select From List By Label    ${dropdown_donvi}    ${donvi}

    Wait Until Element Is Visible    ${dropdown_phong}    10s
    Wait Until Element Contains    ${dropdown_phong}    ${phong}    10s 
    Scroll Element Into View    ${dropdown_phong}
    Select From List By Label    ${dropdown_phong}    ${phong}

    Wait Until Element Is Visible    ${dropdown_kho}    10s
    Wait Until Element Contains    ${dropdown_kho}    ${kho}    10s
    Select From List By Label    ${dropdown_kho}    ${kho}

    Wait Until Element Is Visible    ${dropdown_gia}    10s
    Wait Until Element Contains    ${dropdown_gia}    ${gia}    10s
    Select From List By Label    ${dropdown_gia}    ${gia}

    Wait Until Element Is Visible    ${button_search}    10s
    Scroll Element Into View    ${button_search}
    Click Button    ${button_search}

    Wait Until Element Is Visible    xpath=//table    10s
    Duyet Tung Dong Chua Nhieu Tu Khoa    ${donvi}    ${phong}    ${kho}    ${gia}

Search key and Unit
    [Arguments]    ${keyword}    ${donvi}
    Click Element    ${search_textbox}
    Input Text    ${search_textbox}    ${keyword}

    Wait Until Element Is Visible    ${dropdown_donvi}    10s
    Select From List By Label    ${dropdown_donvi}    ${donvi}  

    Wait Until Element Is Visible    ${button_search}    10s
    Scroll Element Into View         ${button_search}
    Click Button    ${button_search}

    Wait Until Element Is Visible    xpath=//table    10s
    Duyet Tung Dong Chua Nhieu Tu Khoa    ${keyword}    ${donvi}

Search key and Unit and Phong
    [Arguments]    ${keyword}    ${donvi}    ${phong}
    Click Element    ${search_textbox}
    Input Text    ${search_textbox}    ${keyword}

    Wait Until Element Is Visible    ${dropdown_donvi}    10s
    Select From List By Label    ${dropdown_donvi}    ${donvi}  

    Wait Until Element Is Visible    ${dropdown_phong}    10s
    Wait Until Element Contains    ${dropdown_phong}    ${phong}    10s 
    Scroll Element Into View    ${dropdown_phong}
    Select From List By Label    ${dropdown_phong}    ${phong}

    Wait Until Element Is Visible    ${button_search}    10s
    Scroll Element Into View         ${button_search}
    Click Button    ${button_search}

    Wait Until Element Is Visible    xpath=//table    10s
    Duyet Tung Dong Chua Nhieu Tu Khoa    ${keyword}    ${donvi}    ${phong}

Search key and Kho
    [Arguments]    ${keyword}    ${kho}
    Click Element    ${search_textbox}
    Input Text    ${search_textbox}    ${keyword}

    Wait Until Element Is Visible    ${dropdown_kho}    10s
    Select From List By Label    ${dropdown_kho}    ${kho}  

    Wait Until Element Is Visible    ${button_search}    10s
    Scroll Element Into View         ${button_search}
    Click Button    ${button_search}

    Wait Until Element Is Visible    xpath=//table    10s
    Duyet Tung Dong Chua Nhieu Tu Khoa    ${keyword}    ${kho}

Search key and Gia
    [Arguments]    ${keyword}    ${kho}    ${gia}
    Click Element    ${search_textbox}
    Input Text    ${search_textbox}    ${keyword}

    Wait Until Element Is Visible    ${dropdown_kho}    10s
    Select From List By Label    ${dropdown_kho}    ${kho}  

    Wait Until Element Is Visible    ${dropdown_gia}    10s
    Wait Until Element Contains    ${dropdown_gia}    ${gia}    10s
    Select From List By Label    ${dropdown_gia}    ${gia}

    Wait Until Element Is Visible    ${button_search}    10s
    Scroll Element Into View         ${button_search}
    Click Button    ${button_search}

    Wait Until Element Is Visible    xpath=//table    10s
    Duyet Tung Dong Chua Nhieu Tu Khoa    ${keyword}    ${kho}    ${gia}

Search All
    [Arguments]    ${keyword}    ${donvi}    ${phong}    ${kho}    ${gia}
    Click Element    ${search_textbox}
    Input Text    ${search_textbox}    ${keyword}

    Wait Until Element Is Visible    ${dropdown_donvi}    10s
    Select From List By Label    ${dropdown_donvi}    ${donvi}  

    Wait Until Element Is Visible    ${dropdown_phong}    10s
    Wait Until Element Contains    ${dropdown_phong}    ${phong}    10s 
    Scroll Element Into View    ${dropdown_phong}
    Select From List By Label    ${dropdown_phong}    ${phong}

    Wait Until Element Is Visible    ${dropdown_kho}    10s
    Select From List By Label    ${dropdown_kho}    ${kho}  

    Wait Until Element Is Visible    ${dropdown_gia}    10s
    Wait Until Element Contains    ${dropdown_gia}    ${gia}    10s
    Select From List By Label    ${dropdown_gia}    ${gia}

    Wait Until Element Is Visible    ${button_search}    10s
    Scroll Element Into View         ${button_search}
    Click Button    ${button_search}

    Wait Until Element Is Visible    xpath=//table    10s
    Duyet Tung Dong Chua Nhieu Tu Khoa    ${keyword}    ${donvi}    ${phong}    ${kho}    ${gia}

Clear Filter
    Wait Until Element Is Visible    ${button_clear_filter}    10s
    Scroll Element Into View         ${button_clear_filter}
    Click Element                   ${button_clear_filter}
    Wait Until Page Contains    Tìm kiếm thông tin trong hệ thống