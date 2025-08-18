*** Settings ***
Library    SeleniumLibrary
Resource    ../Resource/HomePage.resource

*** Variables ***
${Search_Textbox}            //input[@id="keyword"]

${Button_Search}            //button[@type="submit" and contains(normalize-space(.),"Tìm kiếm")]
${Button_Clear_Filter}      //button[contains(@class, "btn-secondary") and contains(normalize-space(.), "Xóa bộ lọc")]

${DonVi_Dropdown}    //select[@id="don_vi_select"]
${Phong_Dropdown}    //select[@id="phong_select"]
${Kho_Dropdown}      //select[@id="kho_select"]
${Gia_Dropdown}      //select[@id="gia_id"]


*** Keywords ***
*** Settings ***
Library    SeleniumLibrary

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

Duyet Tung Dong Bang Chua Nhieu Tu Khoa
    [Arguments]    ${keyword1}    ${keyword2}
    ${rows}=    Get WebElements    xpath=//table//tbody//tr
    FOR    ${row}    IN    @{rows}
        ${text}=    Get Text    ${row}
        Log    Nội dung dòng: ${text}
        Should Contain    ${text}    ${keyword1}    Dòng không chứa từ khóa "${keyword1}"
        Should Contain    ${text}    ${keyword2}    Dòng không chứa từ khóa "${keyword2}"
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
    Wait Until Element Is Visible    ${DonVi_Dropdown}    10s
    Select From List By Label    ${DonVi_Dropdown}    ${don_vi}

    Wait Until Element Is Visible    ${Button_Search}    10s
    Scroll Element Into View    ${Button_Search}
    Click Button    ${Button_Search}

    Wait Until Element Is Visible    xpath=//table    10s
    Duyet Tung Dong Bang Chua Tu Khoa    ${don_vi}

Search DonVi and Phong 
    [Arguments]    ${DV}    ${phong}
    Wait Until Element Is Visible    ${DonVi_Dropdown}    10s
    Select From List By Label    ${DonVi_Dropdown}    ${DV}
    Wait Until Element Is Visible    ${Phong_Dropdown}    10s
    Wait Until Element Contains    ${Phong_Dropdown}    ${phong}    10s 
    Scroll Element Into View    ${Phong_Dropdown}
    Select From List By Label    ${Phong_Dropdown}    ${phong}

    Wait Until Element Is Visible    ${Button_Search}    10s
    Scroll Element Into View    ${Button_Search}
    Click Button    ${Button_Search}

    Wait Until Element Is Visible    xpath=//table    10s
    Scroll Element Into View    xpath=//table
    Duyet Tung Dong Bang Chua Nhieu Tu Khoa    ${DV}    ${phong}

Search Kho
    [Arguments]    ${kho}
    Wait Until Element Is Visible    ${Kho_Dropdown}    10s
    Scroll Element Into View    ${Kho_Dropdown}
    Select From List By Label    ${Kho_Dropdown}    ${kho}

    Wait Until Element Is Visible    ${Button_Search}    10s
    Scroll Element Into View    ${Button_Search}
    Click Button    ${Button_Search}

    Wait Until Element Is Visible    xpath=//table    10s
    Duyet Tung Dong Bang Chua Tu Khoa    ${kho}
Search Gia        
    [Arguments]    ${gia}
    Wait Until Element Is Visible    ${Gia_Dropdown}    10s
    Scroll Element Into View    ${Gia_Dropdown}
    Select From List By Label    ${Gia_Dropdown}    ${gia}

    Wait Until Element Is Visible    ${Button_Search}    10s
    Scroll Element Into View    ${Button_Search}
    Click Button    ${Button_Search}

    Wait Until Element Is Visible    xpath=//table    10s
    Duyet Tung Dong Bang Chua Tu Khoa    ${gia}
     
Clear Filter
    Wait Until Element Is Visible    ${Button_Clear_Filter}    10s
    Scroll Element Into View         ${Button_Clear_Filter}
    Click Element                   ${Button_Clear_Filter}
    Wait Until Page Contains    Tìm kiếm thông tin trong hệ thống



