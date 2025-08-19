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
    Wait Until Element Is Visible    ${Button_Search}    10s
    Scroll Element Into View         ${Button_Search}
    Click Button    ${Button_Search}

Verify Search Error 
    Wait Until Page Contains    Không tìm thấy kết quả nào


Search Textbox Blank
    Wait Until Element Is Visible    ${Button_Search}    10s
    Scroll Element Into View         ${Button_Search}
    Click Button    ${Button_Search}
    Wait Until Page Contains    Không tìm thấy kết quả nào

Search DonVi
    [Arguments]    ${don_vi}
    Wait Until Element Is Visible    ${Dropdown_DonVi}    10s
    Select From List By Label    ${Dropdown_DonVi}    ${don_vi}

    Wait Until Element Is Visible    ${Button_Search}    10s
    Scroll Element Into View    ${Button_Search}
    Click Button    ${Button_Search}

    Wait Until Element Is Visible    xpath=//table    10s
    Duyet Tung Dong Bang Chua Tu Khoa    ${don_vi}

Search DonVi and Phong 
    [Arguments]    ${DV}    ${phong}
    Wait Until Element Is Visible    ${Dropdown_DonVi}    10s
    Select From List By Label    ${Dropdown_DonVi}    ${DV}
    Wait Until Element Is Visible    ${Dropdown_Phong}    10s
    Wait Until Element Contains    ${Dropdown_Phong}    ${phong}    10s 
    Scroll Element Into View    ${Dropdown_Phong}
    Select From List By Label    ${Dropdown_Phong}    ${phong}

    Wait Until Element Is Visible    ${Button_Search}    10s
    Scroll Element Into View    ${Button_Search}
    Click Button    ${Button_Search}

    Wait Until Element Is Visible    xpath=//table    10s
    Scroll Element Into View    xpath=//table
    Duyet Tung Dong Chua Nhieu Tu Khoa    ${DV}    ${phong}

Search Kho
    [Arguments]    ${kho}
    Wait Until Element Is Visible    ${Dropdown_Kho}    10s
    Scroll Element Into View    ${Dropdown_Kho}
    Select From List By Label    ${Dropdown_Kho}    ${kho}

    Wait Until Element Is Visible    ${Button_Search}    10s
    Scroll Element Into View    ${Button_Search}
    Click Button    ${Button_Search}

    Wait Until Element Is Visible    xpath=//table    10s
    Duyet Tung Dong Bang Chua Tu Khoa    ${kho}
Search Gia        
    [Arguments]    ${donvi}    ${phong}    ${kho}    ${gia}
    Wait Until Element Is Visible    ${Dropdown_DonVi}    10s
    Select From List By Label    ${Dropdown_DonVi}    ${donvi}

    Wait Until Element Is Visible    ${Dropdown_Phong}    10s
    Wait Until Element Contains    ${Dropdown_Phong}    ${phong}    10s 
    Scroll Element Into View    ${Dropdown_Phong}
    Select From List By Label    ${Dropdown_Phong}    ${phong}

    Wait Until Element Is Visible    ${Dropdown_Kho}    10s
    Wait Until Element Contains    ${Dropdown_Kho}    ${kho}    10s
    Select From List By Label    ${Dropdown_Kho}    ${kho}

    Wait Until Element Is Visible    ${Dropdown_Gia}    10s
    Wait Until Element Contains    ${Dropdown_Gia}    ${gia}    10s
    Select From List By Label    ${Dropdown_Gia}    ${gia}

    Wait Until Element Is Visible    ${Button_Search}    10s
    Scroll Element Into View    ${Button_Search}
    Click Button    ${Button_Search}

    Wait Until Element Is Visible    xpath=//table    10s
    Duyet Tung Dong Chua Nhieu Tu Khoa    ${donvi}    ${phong}    ${kho}    ${gia}

Search key and Unit
    [Arguments]    ${keyword}    ${donvi}
    Click Element    ${Search_Textbox}
    Input Text    ${Search_Textbox}    ${keyword}

    Wait Until Element Is Visible    ${Dropdown_DonVi}    10s
    Select From List By Label    ${Dropdown_DonVi}    ${donvi}  

    Wait Until Element Is Visible    ${Button_Search}    10s
    Scroll Element Into View         ${Button_Search}
    Click Button    ${Button_Search}

    Wait Until Element Is Visible    xpath=//table    10s
    Duyet Tung Dong Chua Nhieu Tu Khoa    ${keyword}    ${donvi}

Search key and Unit and Phong
    [Arguments]    ${keyword}    ${donvi}    ${phong}
    Click Element    ${Search_Textbox}
    Input Text    ${Search_Textbox}    ${keyword}

    Wait Until Element Is Visible    ${Dropdown_DonVi}    10s
    Select From List By Label    ${Dropdown_DonVi}    ${donvi}  

    Wait Until Element Is Visible    ${Dropdown_Phong}    10s
    Wait Until Element Contains    ${Dropdown_Phong}    ${phong}    10s 
    Scroll Element Into View    ${Dropdown_Phong}
    Select From List By Label    ${Dropdown_Phong}    ${phong}

    Wait Until Element Is Visible    ${Button_Search}    10s
    Scroll Element Into View         ${Button_Search}
    Click Button    ${Button_Search}

    Wait Until Element Is Visible    xpath=//table    10s
    Duyet Tung Dong Chua Nhieu Tu Khoa    ${keyword}    ${donvi}    ${phong}

Search key and Kho
    [Arguments]    ${keyword}    ${kho}
    Click Element    ${Search_Textbox}
    Input Text    ${Search_Textbox}    ${keyword}

    Wait Until Element Is Visible    ${Dropdown_Kho}    10s
    Select From List By Label    ${Dropdown_Kho}    ${kho}  

    Wait Until Element Is Visible    ${Button_Search}    10s
    Scroll Element Into View         ${Button_Search}
    Click Button    ${Button_Search}

    Wait Until Element Is Visible    xpath=//table    10s
    Duyet Tung Dong Chua Nhieu Tu Khoa    ${keyword}    ${kho}

Search key and Gia
    [Arguments]    ${keyword}    ${kho}    ${gia}
    Click Element    ${Search_Textbox}
    Input Text    ${Search_Textbox}    ${keyword}

    Wait Until Element Is Visible    ${Dropdown_Kho}    10s
    Select From List By Label    ${Dropdown_Kho}    ${kho}  

    Wait Until Element Is Visible    ${Dropdown_Gia}    10s
    Wait Until Element Contains    ${Dropdown_Gia}    ${gia}    10s
    Select From List By Label    ${Dropdown_Gia}    ${gia}

    Wait Until Element Is Visible    ${Button_Search}    10s
    Scroll Element Into View         ${Button_Search}
    Click Button    ${Button_Search}

    Wait Until Element Is Visible    xpath=//table    10s
    Duyet Tung Dong Chua Nhieu Tu Khoa    ${keyword}    ${kho}    ${gia}

Search All
    [Arguments]    ${keyword}    ${donvi}    ${phong}    ${kho}    ${gia}
    Click Element    ${Search_Textbox}
    Input Text    ${Search_Textbox}    ${keyword}

    Wait Until Element Is Visible    ${Dropdown_DonVi}    10s
    Select From List By Label    ${Dropdown_DonVi}    ${donvi}  

    Wait Until Element Is Visible    ${Dropdown_Phong}    10s
    Wait Until Element Contains    ${Dropdown_Phong}    ${phong}    10s 
    Scroll Element Into View    ${Dropdown_Phong}
    Select From List By Label    ${Dropdown_Phong}    ${phong}

    Wait Until Element Is Visible    ${Dropdown_Kho}    10s
    Select From List By Label    ${Dropdown_Kho}    ${kho}  

    Wait Until Element Is Visible    ${Dropdown_Gia}    10s
    Wait Until Element Contains    ${Dropdown_Gia}    ${gia}    10s
    Select From List By Label    ${Dropdown_Gia}    ${gia}

    Wait Until Element Is Visible    ${Button_Search}    10s
    Scroll Element Into View         ${Button_Search}
    Click Button    ${Button_Search}

    Wait Until Element Is Visible    xpath=//table    10s
    Duyet Tung Dong Chua Nhieu Tu Khoa    ${keyword}    ${donvi}    ${phong}    ${kho}    ${gia}

Clear Filter
    Wait Until Element Is Visible    ${Button_Clear_Filter}    10s
    Scroll Element Into View         ${Button_Clear_Filter}
    Click Element                   ${Button_Clear_Filter}
    Wait Until Page Contains    Tìm kiếm thông tin trong hệ thống


