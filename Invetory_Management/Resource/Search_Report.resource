*** Settings ***
Library    SeleniumLibrary
Resource    ../Resource/HomePage.resource

*** Variables ***
${Search_Textbox}            //input[@id="keyword"]

${Button_Search}            //button[@type="submit" and contains(normalize-space(.),"Tìm kiếm")]
${Button_Clear_Filter}      //button[contains(@class, "btn-secondary") and contains(normalize-space(.), "Xóa bộ lọc")]

${Message}                  //h3[normalize-space(.)="Tìm kiếm thông tin trong hệ thống"]
${Error_Message}            //h5[contains(normalize-space(.), "Không tìm thấy kết quả nào")]
*** Keywords ***
Search Textbox 
    Wait Until Element Is Visible    ${Search_Textbox}    10s
    Click Element    ${Search_Textbox}
    Input Text    ${Search_Textbox}    Tài liệu
    Wait Until Element Is Visible    ${Button_Search}    10s
    Scroll Element Into View    ${Button_Search}
    Click Button    ${Button_Search}
    Wait Until Page Contains    Tài liệu    10s

Search Wrong Keyword
    Wait Until Element Is Visible    ${Search_Textbox}    10s
    Click Element                   ${Search_Textbox}
    Input Text                     ${Search_Textbox}    abc123
    Wait Until Element Is Visible    ${Button_Search}    10s
    Scroll Element Into View         ${Button_Search}
    Click Button    ${Button_Search}
    Wait Until Element Is Visible    ${Error_Message}    10s
    Scroll Element Into View         ${Error_Message}
    Capture Page Screenshot        ket_qua_tim_kiem_khong_ton_tai.png

Search Textbox Blank
    Wait Until Element Is Visible    ${Button_Search}    10s
    Scroll Element Into View         ${Button_Search}
    Click Button    ${Button_Search}
    Wait Until Element Is Visible    ${Error_Message}    10s
    Scroll Element Into View         ${Error_Message}

Clear Filter
    Wait Until Element Is Visible    ${Button_Clear_Filter}    10s
    Scroll Element Into View         ${Button_Clear_Filter}
    Click Element                   ${Button_Clear_Filter}
    Wait Until Element Is Visible    ${Message}    10s

