*** Settings ***
Library    SeleniumLibrary
Resource    ../Resource/HomePage.resource

*** Variables ***
${Search_Textbox}            //input[@id="keyword"]

${Button_Search}            //button[@type="submit" and contains(normalize-space(.),"Tìm kiếm")]
${Button_Clear_Filter}      //button[contains(@class, "btn-secondary") and contains(normalize-space(.), "Xóa bộ lọc")]

${DonVi_Dropdown}    //select[@id="don_vi_id"]
${Phong_Dropdown}    //select[@id="phong_id"]
${Kho_Dropdown}      //select[@id="kho_id"]
${Gia_Dropdown}      //select[@id="gia_id"]

${DonVi_Option}      //select[@id='don_vi_id']/option[@value='6']
${Phong_Option}      //select[@id='phong_id']/option[@value='5']
${Kho_Option}        //select[@id='kho_id']/option[@value='1']
${Gia_Option}        //select[@id='gia_id']/option[@value='1']

${KQDonVi}           //strong[normalize-space()='Ban kiểm soát']

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

Search Textbox Blank
    Wait Until Element Is Visible    ${Button_Search}    10s
    Scroll Element Into View         ${Button_Search}
    Click Button    ${Button_Search}
    Wait Until Element Is Visible    ${Error_Message}    10s
    Scroll Element Into View         ${Error_Message}

Search DonVi
    Wait Until Element Is Visible    ${DonVi_Dropdown}    10s
    Click Element    ${DonVi_Dropdown}
    Wait Until Element Is Visible    ${DonVi_Option}    10s
    Click Element    ${DonVi_Option}

    Wait Until Element Is Visible    ${Button_Search}    10s
    Scroll Element Into View    ${Button_Search}
    Click Button    ${Button_Search}

    Wait Until Element Is Visible    ${KQDonVi}    10s
    Scroll Element Into View    ${KQDonVi}

Search Phong 
    Wait Until Element Is Visible    ${Phong_Dropdown}    10s
    Click Element    ${Phong_Dropdown}
    Wait Until Element Is Visible    ${Phong_Option}    10s
    Click Element    ${Phong_Option}

    Wait Until Element Is Visible    ${Button_Search}    10s
    Scroll Element Into View    ${Button_Search}
    Click Button    ${Button_Search}

    Wait Until Element Is Visible    ${KQDonVi}    10s
    Scroll Element Into View    ${KQDonVi}  

Search Kho
    Wait Until Element Is Visible    ${Kho_Dropdown}    10s
    Click Element    ${Kho_Dropdown}
    Wait Until Element Is Visible    ${Kho_Option}    10s
    Click Element    ${Kho_Option}

    Wait Until Element Is Visible    ${Button_Search}    10s
    Scroll Element Into View    ${Button_Search}
    Click Button    ${Button_Search}

    Wait Until Element Is Visible    ${KQDonVi}    10s
    Scroll Element Into View    ${KQDonVi}     

Search Gia
    Wait Until Element Is Visible    ${Gia_Dropdown}    10s
    Click Element    ${Gia_Dropdown}
    Wait Until Element Is Visible    ${Gia_Option}    10s
    Click Element    ${Gia_Option}

    Wait Until Element Is Visible    ${Button_Search}    10s
    Scroll Element Into View    ${Button_Search}
    Click Button    ${Button_Search}

    Wait Until Element Is Visible    ${KQDonVi}    10s
    Scroll Element Into View    ${KQDonVi} 
Clear Filter
    Wait Until Element Is Visible    ${Button_Clear_Filter}    10s
    Scroll Element Into View         ${Button_Clear_Filter}
    Click Element                   ${Button_Clear_Filter}
    Wait Until Element Is Visible    ${Message}    10s



