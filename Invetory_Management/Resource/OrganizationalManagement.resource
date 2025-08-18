*** Settings ***
*** Settings ***
Library    SeleniumLibrary
Resource    ../Resource/HomePage.resource

*** Variables ***
${Button_Add_Unit}            //a[contains(@href, "/don-vi/add") and contains(normalize-space(.), "Thêm đơn vị mới")]
${Button_Cancel_Add_Unit}     //a[contains(@class, "btn-secondary") and contains(normalize-space(.), "Hủy bỏ")]
${Button_Save_Add_Unit}       //button[@type="submit" and contains(@class, "btn-primary") and contains(normalize-space(.), "Lưu đơn vị")]
${Button_Back_To_List}        //a[contains(@class, "btn-secondary") and contains(normalize-space(.), "Quay lại danh sách")]
${Button_Edit_Unit}           //a[contains(@href, "/don-vi/edit/7") and contains(@class, "btn-outline-primary") and @title="Chỉnh sửa"]
${Button_Update_Unit}         //button[@type="submit" and contains(@class, "btn-primary") and contains(normalize-space(.), "Cập nhật đơn vị")]
${Button_Delete_Unit}         //button[@type="submit" and contains(@class, "btn-outline-danger") and @title="Xóa"]

${Button_Add_Storage}         //a[contains(@href, "/phong/add") and contains(normalize-space(.), "Thêm phông mới")]
${Button_Back_To_storage}     //a[contains(@href, "/phong") and contains(@class, "btn-outline-secondary") and contains(normalize-space(.), "Quay lại")]
${Button_Cancel_Add_Phong}    //a[contains(@href, "/phong") and contains(@class, "btn-secondary") and contains(normalize-space(.), "Hủy bỏ")]
${Button_Save_Phong}          //button[@type="submit" and contains(., "Lưu phông lưu trữ")]
${Button_Edit_Phong}          //a[@title="Chỉnh sửa phông"]
${Button_Update_Phong}        //button[contains(@class,"btn-primary") and normalize-space()="Cập nhật phông"]
${Button_Delete_Phong}        //button[@type="submit" and contains(@class, "btn-outline-danger") and @title="Xóa phông"]

${Button_Add_Mucluc}          //a[contains(@href, "/muc-luc/add") and contains(normalize-space(.), "Thêm mục lục mới")]
${Button_Cancel_Mucluc}       //a[contains(@href, "/muc-luc") and contains(@class, "btn-secondary") and contains(normalize-space(.), "Hủy bỏ")]
${Button_Back_To_Mucluc}      //a[contains(@href, "/muc-luc") and contains(@class, "btn-outline-secondary") and contains(normalize-space(.), "Quay lại")]
${Button_Save_Mucluc}         //button[@type="submit" and contains(., "Lưu mục lục")]
${Button_Edit_Mucluc}         //a[@title="Chỉnh sửa"]
${Button_Update_Mucluc}       //button[contains(@class,"btn-primary") and normalize-space()="Cập nhật mục lục"]
${Button_Delete_Mucluc}       //button[@type="submit" and contains(@class, "btn-outline-danger") and @title="Xóa"]

${Input_ID_Unit}        //input[@id="ma_don_vi"]
${Input_Name_Unit}      //input[@id="ten_don_vi"]
${Input_Name_Phong}     //input[@id="ten_phong"]
${Input_ID_Mucluc}      //input[@id="ma_muc_luc"]
${Input_Name_Mucluc}    //input[@id="ten_muc_luc"]

${Dropdown_Name_Unit}             //select[@id="don_vi_id"]
${Option_Don_Vi_Ban_Kiem_Soat}    //select[@id="don_vi_id"]/option[@value="6"]
${Dropdown_Phong}                 //select[@id="don-vi-filter"]
${Option_Phong}                   //select[@id="don-vi-filter"]/option[normalize-space(.)="Ban kiểm soát chỉnh sửa"]
${Dropdown_Mucluc}                //select[@id="don_vi_select"]
${Option_Mucluc}                  //select[@id="don_vi_select"]/option[@value="6"]
${Dropdown_MuclucP}               //select[@id="phong_select"]
${Option_MuclucP}                 //select[@id="phong_select"]/option[@value="5"]
${Dropdown_DonViP}                //select[@id="don-vi-filter"]
${Option_DonViP}                  //select[@id="don-vi-filter"]/option[@value="7"]
${Dropdown_DVPhong}               //select[@id="phong-filter"]
${Option_DVPhong}                 //select[@id="phong-filter"]/option[normalize-space(.)="Phông Tài liệu Kế toán"]


*** Keywords ***
#Don vi
Cancel Add Unit 
    Wait Until Element Is Visible    ${Button_Add_Unit}    10s
    Click Element                   ${Button_Add_Unit}
    Wait Until Element Is Visible    ${Input_ID_Unit}    10s
    Input Text                    ${Input_ID_Unit}    1
    
    Wait Until Element Is Visible    ${Input_Name_Unit}    10s
    Scroll Element Into View    ${Input_Name_Unit}
    Input Text                    ${Input_Name_Unit}    Ban kiểm soát

    Wait Until Element Is Visible    ${Button_Cancel_Add_Unit}    10s
    Scroll Element Into View    ${Button_Cancel_Add_Unit}
    Click Element                   ${Button_Cancel_Add_Unit}

    Wait Until Element Is Visible    Quản lý Đơn vị    10s


Back To List 
    Wait Until Element Is Visible    ${Button_Add_Unit}    10s
    Click Element                   ${Button_Add_Unit}
    Wait Until Element Is Visible    ${Input_ID_Unit}    10s
    Input Text                    ${Input_ID_Unit}    1
    
    Wait Until Element Is Visible    ${Input_Name_Unit}    10s
    Scroll Element Into View    ${Input_Name_Unit}
    Input Text                    ${Input_Name_Unit}    Ban kiểm soát

    Wait Until Element Is Visible    ${Button_Back_To_List}    10s
    Scroll Element Into View    ${Button_Back_To_List}
    Execute Javascript    window.scrollBy(0, -100)
    Click Element                   ${Button_Back_To_List}

    Wait Until Element Is Visible    Quản lý Đơn vị    10s


 Verify Add To Unit
    Wait Until Element Is Visible    ${Button_Add_Unit}    10s
    Click Element                   ${Button_Add_Unit}
    Wait Until Element Is Visible    ${Input_ID_Unit}    10s
    Input Text                    ${Input_ID_Unit}    2
    
    Wait Until Element Is Visible    ${Input_Name_Unit}    10s
    Scroll Element Into View    ${Input_Name_Unit}
    Input Text                    ${Input_Name_Unit}    Ban kiểm soát

    Wait Until Element Is Visible    ${Button_Save_Add_Unit}    10s
    Scroll Element Into View    ${Button_Save_Add_Unit}
    Click Element                   ${Button_Save_Add_Unit}

    Wait Until Page Contains    Thêm đơn vị thành công


Edit Unit "Cancel"
    Wait Until Element Is Visible    ${Button_Edit_Unit}    10s
    Click Element                   ${Button_Edit_Unit}  
    
    Wait Until Element Is Visible    ${Input_Name_Unit}    10s
    Scroll Element Into View    ${Input_Name_Unit}
    Clear Element Text            ${Input_Name_Unit}
    Input Text                    ${Input_Name_Unit}    Ban kiểm soát chỉnh sửa

    Wait Until Element Is Visible    ${Button_Cancel_Add_Unit}    10s
    Scroll Element Into View    ${Button_Cancel_Add_Unit}
    Click Element                   ${Button_Cancel_Add_Unit}

    Wait Until Element Is Visible    Quản lý Đơn vị    10s


Edit Unit "Back to list"
    Wait Until Element Is Visible    ${Button_Edit_Unit}    10s
    Click Element                   ${Button_Edit_Unit}  
    
    Wait Until Element Is Visible    ${Input_Name_Unit}    10s
    Scroll Element Into View    ${Input_Name_Unit}
    Clear Element Text            ${Input_Name_Unit}
    Input Text                    ${Input_Name_Unit}    Ban kiểm soát chỉnh sửa

    Wait Until Element Is Visible    ${Button_Back_To_List}    10s
    Scroll Element Into View    ${Button_Back_To_List}
    Execute Javascript    window.scrollBy(0, -100)
    Click Element                   ${Button_Back_To_List}

    Wait Until Element Is Visible    Quản lý Đơn vị    10s

Edit Unit
    Wait Until Element Is Visible    ${Button_Edit_Unit}    10s
    Click Element                   ${Button_Edit_Unit}

    Wait Until Element Is Visible    ${Input_Name_Unit}    10s
    Clear Element Text             ${Input_Name_Unit}
    Input Text                    ${Input_Name_Unit}    Ban kiểm soát chỉnh sửa

    Wait Until Element Is Visible    ${Button_Update_Unit}    10s
    Scroll Element Into View    ${Button_Update_Unit}
    Click Element               ${Button_Update_Unit}
    Wait Until Page Contains             Cập nhật đơn vị thành công!

Delete Unit
    Wait Until Element Is Visible    ${Button_Delete_Unit}    10s
    Click Element                   ${Button_Delete_Unit}
    Wait Until Page Contains             Xoá đơn vị thành công!

#Phong luu tru
Back To Phong
    Wait Until Element Is Visible    ${Button_Add_Storage}    10s
    Click Element                   ${Button_Add_Storage}

    Wait Until Element Is Visible    ${Button_Back_To_storage}    10s
    Click Element                   ${Button_Back_To_storage}

    Wait Until Element Is Visible    Quản lý Phông Lưu trữ    10s

Cancel Add Phong
    Wait Until Element Is Visible    ${Button_Add_Storage}    10s
    Click Element                   ${Button_Add_Storage}

    Wait Until Element Is Visible    ${Button_Cancel_Add_Phong}    10s
    Scroll Element Into View    ${Button_Cancel_Add_Phong}
    Click Element                   ${Button_Cancel_Add_Phong}

    Wait Until Element Is Visible    Quản lý Phông Lưu trữ    10s

 Verify Add To Phong
    Wait Until Element Is Visible    ${Button_Add_Storage}
    Click Element    ${Button_Add_Storage}
    Click Element    ${Dropdown_Name_Unit}
    Click Element    ${Option_Don_Vi_Ban_Kiem_Soat}
    Input Text    ${Input_Name_Phong}    Tài liệu demo
    
    Wait Until Element Is Visible    ${Button_Save_Phong}
    Scroll Element Into View    ${Button_Save_Phong}
    Click Element    ${Button_Save_Phong}
    Wait Until Page Contains             Thêm phông lưu trữ thành công!

Edit Phong
    Wait Until Element Is Visible    ${Button_Edit_Phong}    10s
    Scroll Element Into View    ${Button_Edit_Phong}
    Click Element                   ${Button_Edit_Phong}

    Wait Until Element Is Visible    ${Input_Name_Phong}    10s
    Clear Element Text             ${Input_Name_Phong}
    Input Text                    ${Input_Name_Phong}        Tài liệu

    Wait Until Element Is Visible    ${Button_Update_Phong}    10s
    Scroll Element Into View    ${Button_Update_Phong}
    Click Element               ${Button_Update_Phong}

    Wait Until Page Contains             Cập nhật phông lưu trữ thành công!

Edit Phong "Cancel"
    Wait Until Element Is Visible    ${Button_Edit_Phong}    10s
    Scroll Element Into View    ${Button_Edit_Phong}
    Click Element                   ${Button_Edit_Phong}  

    Wait Until Element Is Visible    ${Button_Cancel_Add_Phong}    10s
    Scroll Element Into View    ${Button_Cancel_Add_Phong}
    Click Element                   ${Button_Cancel_Add_Phong}

    Wait Until Element Is Visible    Quản lý Phông Lưu trữ    10s

Edit Back To Phong
    Wait Until Element Is Visible    ${Button_Edit_Phong}    10s
    Scroll Element Into View    ${Button_Edit_Phong}
    Click Element                   ${Button_Edit_Phong}  

    Wait Until Element Is Visible    ${Button_Back_To_storage}    10s
    Click Element                   ${Button_Back_To_storage}

    Wait Until Element Is Visible    Quản lý Phông Lưu trữ    10s

Delete Phong
    Wait Until Element Is Visible    ${Button_Delete_Phong}    10s
    Click Element                   ${Button_Delete_Phong}
    Wait Until Page Contains             Xoá phông lưu trữ thành công!

Filter Phong
    Wait Until Element Is Visible    ${Dropdown_Phong}
    Click Element    ${Dropdown_Phong}
    Click Element    ${Option_Phong}
    Wait Until Page Contains             Ban kiểm soát chỉnh sửa

#Muc luc ho so
Back To Mucluc
    Wait Until Element Is Visible    ${Button_Add_Mucluc}    10s
    Click Element                   ${Button_Add_Mucluc}

    Wait Until Element Is Visible    ${Button_Back_To_Mucluc}    10s
    Click Element                   ${Button_Back_To_Mucluc}

    Wait Until Element Is Visible    Quản lý Mục lục hồ sơ    10s

Cancel Add Mucluc
    Wait Until Element Is Visible    ${Button_Add_Mucluc}    10s
    Click Element                   ${Button_Add_Mucluc}

    Wait Until Element Is Visible    ${Button_Cancel_Mucluc}    10s
    Scroll Element Into View    ${Button_Cancel_Mucluc}
    Click Element                   ${Button_Cancel_Mucluc}

    Wait Until Element Is Visible    Quản lý Mục lục hồ sơ    10s

Verify Add To Mucluc
    Wait Until Element Is Visible    ${Button_Add_Mucluc}    10s
    Click Element                    ${Button_Add_Mucluc}
    Wait Until Element Is Visible    ${Input_ID_Mucluc}    10s
    Input Text                       ${Input_ID_Mucluc}    2

    Wait Until Page Contains Element    ${Dropdown_Mucluc}    10s
    Select From List By Value           ${Dropdown_Mucluc}    6

    Click Element    ${Dropdown_MuclucP}
    Wait Until Element Is Visible    ${Option_MuclucP}    15s
    Select From List By Value        ${Dropdown_MuclucP}    5

    Wait Until Element Is Visible    ${Input_Name_Mucluc}    10s
    Input Text                       ${Input_Name_Mucluc}    Tài liệu demo

    Wait Until Element Is Visible    ${Button_Save_Mucluc}    10s
    Scroll Element Into View         ${Button_Save_Mucluc}
    Click Element                    ${Button_Save_Mucluc}

    Wait Until Page Contains              Thêm mục lục hồ sơ thành công!

Edit Mucluc
    Wait Until Element Is Visible    ${Button_Edit_Mucluc}    10s
    Scroll Element Into View    ${Button_Edit_Mucluc}
    Click Element                   ${Button_Edit_Mucluc}
    
    Wait Until Element Is Visible    ${Input_Name_Mucluc}    10s
    Clear Element Text             ${Input_Name_Mucluc}
    Input Text                       ${Input_Name_Mucluc}    Tài liệu demo1
    
    Wait Until Element Is Visible    ${Button_Update_Mucluc}    10s
    Scroll Element Into View    ${Button_Update_Mucluc}
    Click Element               ${Button_Update_Mucluc}

    Wait Until Page Contains             Cập nhật mục lục hồ sơ thành công!

Edit Mucluc "Cancel"
    Wait Until Element Is Visible    ${Button_Edit_Mucluc}    10s
    Scroll Element Into View    ${Button_Edit_Mucluc}
    Click Element                   ${Button_Edit_Mucluc}  

    Wait Until Element Is Visible    ${Input_Name_Mucluc}    10s
    Clear Element Text             ${Input_Name_Mucluc}
    Input Text                       ${Input_Name_Mucluc}    Tài liệu demo1

    Wait Until Element Is Visible    ${Button_Cancel_Mucluc}    10s
    Scroll Element Into View    ${Button_Cancel_Mucluc}
    Click Element                   ${Button_Cancel_Mucluc}

    Wait Until Element Is Visible    Quản lý Mục lục hồ sơ    10s

Edit Back To Mucluc
    Wait Until Element Is Visible    ${Button_Edit_Mucluc}    10s
    Scroll Element Into View    ${Button_Edit_Mucluc}
    Click Element                   ${Button_Edit_Mucluc}

    Wait Until Element Is Visible    ${Input_Name_Mucluc}    10s
    Scroll Element Into View    ${Input_Name_Mucluc}
    Clear Element Text             ${Input_Name_Mucluc}
    Input Text                       ${Input_Name_Mucluc}    Tài liệu demo1  

    Wait Until Element Is Visible    ${Button_Back_To_Mucluc}    10s
    Press Keys    None    PAGE_UP
    Click Element                   ${Button_Back_To_Mucluc}

    Wait Until Element Is Visible    Quản lý Mục lục hồ sơ    10s

Delete Mucluc
    Wait Until Element Is Visible    ${Button_Delete_Mucluc}    10s
    Scroll Element Into View    ${Button_Delete_Mucluc}
    Click Element                   ${Button_Delete_Mucluc}
    Wait Until Page Contains             Xoá mục lục hồ sơ thành công!

Filter Phong_Donvi
    Wait Until Element Is Visible    ${Dropdown_DonViP}    10s
    Click Element    ${Dropdown_DonViP}
    Click Element    ${Option_DonViP}
    Wait Until Page Contains             Ban kiểm soát chỉnh sửa

Filter Phong_Donvi2
    Wait Until Element Is Visible    ${Dropdown_DonViP}    10s
    Click Element    ${Dropdown_DonViP}
    Click Element    ${Option_DonViP}

    Wait Until Element Is Visible    ${Dropdown_DVPhong}    10s
    Click Element    ${Dropdown_DVPhong}
    Click Element    ${Option_DVPhong}

    Wait Until Page Contains           Ban kiểm soát chỉnh sửa

Add Unit and Name Unit Blank 
    Wait Until Element Is Visible    ${Button_Add_Unit}    10s
    Click Element                   ${Button_Add_Unit}

    
    Wait Until Element Is Visible    ${Input_ID_Unit}    10s
    Scroll Element Into View    ${Input_ID_Unit}
    Input Text                    ${Input_ID_Unit}    01

    Wait Until Element Is Visible    ${Button_Save_Add_Unit}    10s
    Scroll Element Into View    ${Button_Save_Add_Unit}
    Click Element                   ${Button_Save_Add_Unit}

    Wait Until Page Contains    Tên đơn vị không được để trống

Add Unit and ID_Name Unit Blank
    Wait Until Element Is Visible    ${Button_Add_Unit}    10s
    Click Element                   ${Button_Add_Unit}

    Wait Until Element Is Visible    ${Button_Save_Add_Unit}    10s
    Scroll Element Into View    ${Button_Save_Add_Unit}
    Click Element                   ${Button_Save_Add_Unit}
    Wait Until Page Contains    Mã đơn vị không được để trống
    Wait Until Page Contains    Tên đơn vị không được để trống    

Add Phong but Name Phong Blank
    Wait Until Element Is Visible    ${Button_Add_Storage}    10s
    Click Element                   ${Button_Add_Storage}

    Wait Until Element Is Visible    ${Dropdown_Name_Unit}    10s
    Click Element    ${Dropdown_Name_Unit}
    Click Element    ${Option_Don_Vi_Ban_Kiem_Soat}

    Wait Until Element Is Visible    ${Button_Save_Phong}    10s
    Scroll Element Into View    ${Button_Save_Phong}
    Click Element                   ${Button_Save_Phong}

Add Phong but Unit Blank
    Wait Until Element Is Visible    ${Button_Add_Storage}    10s
    Click Element                   ${Button_Add_Storage}

    Wait Until Element Is Visible    ${Input_Name_Phong}    10s
    Scroll Element Into View    ${Input_Name_Phong}
    Input Text    ${Input_Name_Phong}    tài liệu

    Wait Until Element Is Visible    ${Button_Save_Phong}    10s
    Scroll Element Into View    ${Button_Save_Phong}
    Click Element                   ${Button_Save_Phong}
    Wait Until Page Contains    Vui lòng chọn đơn vị

Add Mucluc Blank All 
    Wait Until Element Is Visible    ${Button_Add_Mucluc}    10s
    Click Element                   ${Button_Add_Mucluc}

    Wait Until Element Is Visible    ${Button_Save_Mucluc}    10s
    Scroll Element Into View    ${Button_Save_Mucluc}
    Click Element                   ${Button_Save_Mucluc}

Add Mucluc Unit Blank 
    Wait Until Element Is Visible    ${Button_Add_Mucluc}    10s
    Click Element                   ${Button_Add_Mucluc}

    Wait Until Element Is Visible    ${Input_ID_Mucluc}    10s
    Input Text    ${Input_ID_Mucluc}    01
    Scroll Element Into View    ${Input_Name_Mucluc}
    Input Text    ${Input_ID_Mucluc}    Hồ sơ demo
    

    Wait Until Element Is Visible    ${Button_Save_Mucluc}    10s
    Scroll Element Into View    ${Button_Save_Mucluc}
    Click Element                   ${Button_Save_Mucluc}

Add Mucluc but Name MucLuc Blank 
    Wait Until Element Is Visible    ${Button_Add_Mucluc}    10s
    Click Element                   ${Button_Add_Mucluc}

    Wait Until Element Is Visible    ${Input_ID_Mucluc}    10s
    Input Text    ${Input_ID_Mucluc}    01
    Scroll Element Into View    ${Input_Name_Mucluc}
    Input Text    ${Input_ID_Mucluc}    Hồ sơ demo
    
    Wait Until Element Is Visible    ${Dropdown_Mucluc}    10s
    Click Element    ${Dropdown_Mucluc}
    Click Element    ${Option_Mucluc}

    Wait Until Element Is Visible    ${Dropdown_MuclucP}    10s
    Click Element    ${Dropdown_MuclucP}
    Click Element    ${Option_MuclucP}

    Wait Until Element Is Visible    ${Button_Save_Mucluc}    10s
    Scroll Element Into View    ${Button_Save_Mucluc}
    Click Element                   ${Button_Save_Mucluc}

Verify Field Is Focused
    [Arguments]    ${locator}
    ${focused_element}=    Execute Javascript    return document.activeElement
    ${expected_element}=    Get WebElement    ${locator}
    Should Be Equal    ${focused_element}    ${expected_element}