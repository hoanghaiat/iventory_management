*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource    ../Resource/HomePage.resource
Resource    ../Resource/OrganizationalManagement.resource
Variables    ../Variables/locator.py

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
    Wait Until Element Is Visible    ${BUTTON_SEARCH}    10s
    Scroll Element Into View         ${BUTTON_SEARCH}
    Click Button    ${BUTTON_SEARCH}

Verify Search Error 
    Wait Until Page Contains    Không tìm thấy kết quả nào


Search Textbox Blank
    Wait Until Element Is Visible    ${BUTTON_SEARCH}    10s
    Scroll Element Into View         ${BUTTON_SEARCH}
    Click Button    ${BUTTON_SEARCH}
    Wait Until Page Contains    Không tìm thấy kết quả nào

Search DonVi
    [Arguments]    ${don_vi}
    Wait Until Element Is Visible    ${DROPDOWN_DONVI}    10s
    Select From List By Label    ${DROPDOWN_DONVI}    ${don_vi}

    Wait Until Element Is Visible    ${BUTTON_SEARCH}    10s
    Scroll Element Into View    ${BUTTON_SEARCH}
    Click Button    ${BUTTON_SEARCH}

    Wait Until Element Is Visible    xpath=//table    10s
    Duyet Tung Dong Bang Chua Tu Khoa    ${don_vi}

Search DonVi and Phong 
    [Arguments]    ${DV}    ${phong}
    Wait Until Element Is Visible    ${DROPDOWN_DONVI}    10s
    Select From List By Label    ${DROPDOWN_DONVI}    ${DV}
    Wait Until Element Is Visible    ${DROPDOWN_PHONG}    10s
    Wait Until Element Contains    ${DROPDOWN_PHONG}    ${phong}    10s 
    Scroll Element Into View    ${DROPDOWN_PHONG}
    Select From List By Label    ${DROPDOWN_PHONG}    ${phong}

    Wait Until Element Is Visible    ${BUTTON_SEARCH}    10s
    Scroll Element Into View    ${BUTTON_SEARCH}
    Click Button    ${BUTTON_SEARCH}

    Wait Until Element Is Visible    xpath=//table    10s
    Scroll Element Into View    xpath=//table
    Duyet Tung Dong Chua Nhieu Tu Khoa    ${DV}    ${phong}

Search Kho
    [Arguments]    ${kho}
    Wait Until Element Is Visible    ${DROPDOWN_KHO}    10s
    Scroll Element Into View    ${DROPDOWN_KHO}
    Select From List By Label    ${DROPDOWN_KHO}    ${kho}

    Wait Until Element Is Visible    ${BUTTON_SEARCH}    10s
    Scroll Element Into View    ${BUTTON_SEARCH}
    Click Button    ${BUTTON_SEARCH}

    Wait Until Element Is Visible    xpath=//table    10s
    Duyet Tung Dong Bang Chua Tu Khoa    ${kho}
Search Gia        
    [Arguments]    ${donvi}    ${phong}    ${kho}    ${gia}
    Wait Until Element Is Visible    ${DROPDOWN_DONVI}    10s
    Select From List By Label    ${DROPDOWN_DONVI}    ${donvi}

    Wait Until Element Is Visible    ${DROPDOWN_PHONG}    10s
    Wait Until Element Contains    ${DROPDOWN_PHONG}    ${phong}    10s 
    Scroll Element Into View    ${DROPDOWN_PHONG}
    Select From List By Label    ${DROPDOWN_PHONG}    ${phong}

    Wait Until Element Is Visible    ${DROPDOWN_KHO}    10s
    Wait Until Element Contains    ${DROPDOWN_KHO}    ${kho}    10s
    Select From List By Label    ${DROPDOWN_KHO}    ${kho}

    Wait Until Element Is Visible    ${DROPDOWN_GIA}    10s
    Wait Until Element Contains    ${DROPDOWN_GIA}    ${gia}    10s
    Select From List By Label    ${DROPDOWN_GIA}    ${gia}

    Wait Until Element Is Visible    ${BUTTON_SEARCH}    10s
    Scroll Element Into View    ${BUTTON_SEARCH}
    Click Button    ${BUTTON_SEARCH}

    Wait Until Element Is Visible    xpath=//table    10s
    Duyet Tung Dong Chua Nhieu Tu Khoa    ${donvi}    ${phong}    ${kho}    ${gia}

Search key and Unit
    [Arguments]    ${keyword}    ${donvi}
    Click Element    ${SEARCH_TEXTBOX}
    Input Text    ${SEARCH_TEXTBOX}    ${keyword}

    Wait Until Element Is Visible    ${DROPDOWN_DONVI}    10s
    Select From List By Label    ${DROPDOWN_DONVI}    ${donvi}  

    Wait Until Element Is Visible    ${BUTTON_SEARCH}    10s
    Scroll Element Into View         ${BUTTON_SEARCH}
    Click Button    ${BUTTON_SEARCH}

    Wait Until Element Is Visible    xpath=//table    10s
    Duyet Tung Dong Chua Nhieu Tu Khoa    ${keyword}    ${donvi}

Search key and Unit and Phong
    [Arguments]    ${keyword}    ${donvi}    ${phong}
    Click Element    ${Search_Textbox}
    Input Text    ${Search_Textbox}    ${keyword}

    Wait Until Element Is Visible    ${DROPDOWN_DONVI}    10s
    Select From List By Label    ${DROPDOWN_DONVI}    ${donvi}  

    Wait Until Element Is Visible    ${DROPDOWN_PHONG}    10s
    Wait Until Element Contains    ${DROPDOWN_PHONG}    ${phong}    10s 
    Scroll Element Into View    ${DROPDOWN_PHONG}
    Select From List By Label    ${DROPDOWN_PHONG}    ${phong}

    Wait Until Element Is Visible    ${BUTTON_SEARCH}    10s
    Scroll Element Into View         ${BUTTON_SEARCH}
    Click Button    ${BUTTON_SEARCH}

    Wait Until Element Is Visible    xpath=//table    10s
    Duyet Tung Dong Chua Nhieu Tu Khoa    ${keyword}    ${donvi}    ${phong}

Search key and Kho
    [Arguments]    ${keyword}    ${kho}
    Click Element    ${SEARCH_TEXTBOX}
    Input Text    ${SEARCH_TEXTBOX}    ${keyword}

    Wait Until Element Is Visible    ${DROPDOWN_KHO}    10s
    Select From List By Label    ${DROPDOWN_KHO}    ${kho}  

    Wait Until Element Is Visible    ${BUTTON_SEARCH}    10s
    Scroll Element Into View         ${BUTTON_SEARCH}
    Click Button    ${BUTTON_SEARCH}

    Wait Until Element Is Visible    xpath=//table    10s
    Duyet Tung Dong Chua Nhieu Tu Khoa    ${keyword}    ${kho}

Search key and Gia
    [Arguments]    ${keyword}    ${kho}    ${gia}
    Click Element    ${SEARCH_TEXTBOX}
    Input Text    ${SEARCH_TEXTBOX}    ${keyword}

    Wait Until Element Is Visible    ${DROPDOWN_KHO}    10s
    Select From List By Label    ${DROPDOWN_KHO}    ${kho}  

    Wait Until Element Is Visible    ${DROPDOWN_GIA}    10s
    Wait Until Element Contains    ${DROPDOWN_GIA}    ${gia}    10s
    Select From List By Label    ${DROPDOWN_GIA}    ${gia}

    Wait Until Element Is Visible    ${BUTTON_SEARCH}    10s
    Scroll Element Into View         ${BUTTON_SEARCH}
    Click Button    ${BUTTON_SEARCH}

    Wait Until Element Is Visible    xpath=//table    10s
    Duyet Tung Dong Chua Nhieu Tu Khoa    ${keyword}    ${kho}    ${gia}

Search All
    [Arguments]    ${keyword}    ${donvi}    ${phong}    ${kho}    ${gia}
    Click Element    ${SEARCH_TEXTBOX}
    Input Text    ${SEARCH_TEXTBOX}    ${keyword}

    Wait Until Element Is Visible    ${DROPDOWN_DONVI}    10s
    Select From List By Label    ${DROPDOWN_DONVI}    ${donvi}  

    Wait Until Element Is Visible    ${DROPDOWN_PHONG}    10s
    Wait Until Element Contains    ${DROPDOWN_PHONG}    ${phong}    10s 
    Scroll Element Into View    ${DROPDOWN_PHONG}
    Select From List By Label    ${DROPDOWN_PHONG}    ${phong}

    Wait Until Element Is Visible    ${DROPDOWN_KHO}    10s
    Select From List By Label    ${DROPDOWN_KHO}    ${kho}  

    Wait Until Element Is Visible    ${DROPDOWN_GIA}    10s
    Wait Until Element Contains    ${DROPDOWN_GIA}    ${gia}    10s
    Select From List By Label    ${DROPDOWN_GIA}    ${gia}

    Wait Until Element Is Visible    ${BUTTON_SEARCH}    10s
    Scroll Element Into View         ${BUTTON_SEARCH}
    Click Button    ${BUTTON_SEARCH}

    Wait Until Element Is Visible    xpath=//table    10s
    Duyet Tung Dong Chua Nhieu Tu Khoa    ${keyword}    ${donvi}    ${phong}    ${kho}    ${gia}

Clear Filter
    Wait Until Element Is Visible    ${BUTTON_CLEAR_FILTER}    10s
    Scroll Element Into View         ${BUTTON_CLEAR_FILTER}
    Click Element                   ${BUTTON_CLEAR_FILTER}
    Wait Until Page Contains    Tìm kiếm thông tin trong hệ thống