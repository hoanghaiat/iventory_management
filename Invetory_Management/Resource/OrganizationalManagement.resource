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
${Option_Mucluc}                 //select[@id="don_vi_select"]/option[@value="6"]
${Dropdown_MuclucP}              //select[@id="phong_select_edit"]
${Option_MuclucP}                //select[@id="phong_select_edit"]/option[@value="5"]


${Message_Unit}           //div[contains(@class, "alert-success") and contains(normalize-space(.), "Thêm đơn vị thành công")]
${Message_Update_Unit}    //div[contains(@class, "alert-success") and contains(normalize-space(.), "Cập nhật đơn vị thành công!")]
${Message_Delete_Unit}    //div[contains(@class, "alert-success") and contains(normalize-space(.), "Xoá đơn vị thành công!")]
${Message_Phong}          //div[contains(@class, "alert-success") and contains(normalize-space(.), "Thêm phông lưu trữ thành công!")]
${Message_Update_Phong}    //div[contains(@class, "alert-success") and contains(normalize-space(.), "Cập nhật phông lưu trữ thành công!")]
${Message_Delete_Phong}    //div[contains(@class, "alert-success") and contains(normalize-space(.), "Xoá phông lưu trữ thành công!")]
${Message_Mucluc}          //div[contains(@class, "alert-success") and contains(normalize-space(.), "Thêm mục lục hồ sơ thành công!")]

${KQ}                    //span[contains(@class,"badge") and normalize-space(text())="Ban kiểm soát chỉnh sửa"]


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

    Wait Until Element Is Visible    ${Page_Unit}    10s


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

    Wait Until Element Is Visible    ${Page_Unit}    10s


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

    Wait Until Element Is Visible    ${Message_Unit}    10s


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

    Wait Until Element Is Visible    ${Page_Unit}    10s


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

    Wait Until Element Is Visible    ${Page_Unit}    10s


Edit Unit
    Wait Until Element Is Visible    ${Button_Edit_Unit}    10s
    Click Element                   ${Button_Edit_Unit}

    Wait Until Element Is Visible    ${Input_Name_Unit}    10s
    Clear Element Text             ${Input_Name_Unit}
    Input Text                    ${Input_Name_Unit}    Ban kiểm soát chỉnh sửa

    Wait Until Element Is Visible    ${Button_Update_Unit}    10s
    Scroll Element Into View    ${Button_Update_Unit}
    Click Element               ${Button_Update_Unit}


    Wait Until Element Is Visible    ${Message_Update_Unit}    10s
    Page Should Contain             Cập nhật đơn vị thành công!


Delete Unit
    Wait Until Element Is Visible    ${Button_Delete_Unit}    10s
    Click Element                   ${Button_Delete_Unit}
    Wait Until Element Is Visible    ${Message_Delete_Unit}    10s
    Page Should Contain             Xoá đơn vị thành công!

#Phong luu tru
Back To Phong
    Wait Until Element Is Visible    ${Button_Add_Storage}    10s
    Click Element                   ${Button_Add_Storage}

    Wait Until Element Is Visible    ${Button_Back_To_storage}    10s
    Click Element                   ${Button_Back_To_storage}

    Wait Until Element Is Visible    ${Page_Storage_Room}    10s

Cancel Add Phong
    Wait Until Element Is Visible    ${Button_Add_Storage}    10s
    Click Element                   ${Button_Add_Storage}

    Wait Until Element Is Visible    ${Button_Cancel_Add_Phong}    10s
    Scroll Element Into View    ${Button_Cancel_Add_Phong}
    Click Element                   ${Button_Cancel_Add_Phong}

    Wait Until Element Is Visible    ${Page_Storage_Room}    10s

 Verify Add To Phong
    Wait Until Element Is Visible    ${Button_Add_Storage}
    Click Element    ${Button_Add_Storage}
    Click Element    ${Dropdown_Name_Unit}
    Click Element    ${Option_Don_Vi_Ban_Kiem_Soat}
    Input Text    ${Input_Name_Phong}    Tài liệu demo
    
    Wait Until Element Is Visible    ${Button_Save_Phong}
    Scroll Element Into View    ${Button_Save_Phong}
    Click Element    ${Button_Save_Phong}

    Wait Until Element Is Visible    ${Message_Phong}    10s
    Page Should Contain             Thêm phông lưu trữ thành công!

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


    Wait Until Element Is Visible    ${Message_Update_Phong}    10s
    Page Should Contain             Cập nhật phông lưu trữ thành công!

Edit Phong "Cancel"
    Wait Until Element Is Visible    ${Button_Edit_Phong}    10s
    Scroll Element Into View    ${Button_Edit_Phong}
    Click Element                   ${Button_Edit_Phong}  

    Wait Until Element Is Visible    ${Button_Cancel_Add_Phong}    10s
    Scroll Element Into View    ${Button_Cancel_Add_Phong}
    Click Element                   ${Button_Cancel_Add_Phong}

    Wait Until Element Is Visible    ${Page_Storage_Room}    10s

Edit Back To Phong
    Wait Until Element Is Visible    ${Button_Edit_Phong}    10s
    Scroll Element Into View    ${Button_Edit_Phong}
    Click Element                   ${Button_Edit_Phong}  

    Wait Until Element Is Visible    ${Button_Back_To_storage}    10s
    Click Element                   ${Button_Back_To_storage}

    Wait Until Element Is Visible    ${Page_Storage_Room}    10s

Delete Phong
    Wait Until Element Is Visible    ${Button_Delete_Phong}    10s
    Click Element                   ${Button_Delete_Phong}
    Wait Until Element Is Visible    ${Message_Delete_Phong}    10s
    Page Should Contain             Xoá phông lưu trữ thành công!

Filter Phong
    Wait Until Element Is Visible    ${Dropdown_Phong}
    Click Element    ${Dropdown_Phong}
    Click Element    ${Option_Phong}
    Wait Until Element Is Visible    ${KQ}    10s
    Scroll Element Into View    ${KQ}
    Page Should Contain             Ban kiểm soát chỉnh sửa

#Muc luc ho so
Back To Mucluc
    Wait Until Element Is Visible    ${Button_Add_Mucluc}    10s
    Click Element                   ${Button_Add_Mucluc}

    Wait Until Element Is Visible    ${Button_Back_To_Mucluc}    10s
    Click Element                   ${Button_Back_To_Mucluc}

    Wait Until Element Is Visible    ${Page_Profile_Table_Contents}    10s

Cancel Add Mucluc
    Wait Until Element Is Visible    ${Button_Add_Mucluc}    10s
    Click Element                   ${Button_Add_Mucluc}

    Wait Until Element Is Visible    ${Button_Cancel_Mucluc}    10s
    Scroll Element Into View    ${Button_Cancel_Mucluc}
    Click Element                   ${Button_Cancel_Mucluc}

    Wait Until Element Is Visible    ${Page_Profile_Table_Contents}    10s

Verify Add To Mucluc
    Wait Until Element Is Visible    ${Button_Add_Mucluc}    10s
    Click Element                    ${Button_Add_Mucluc}
    Wait Until Element Is Visible    ${Input_ID_Mucluc}    10s
    Input Text                       ${Input_ID_Mucluc}    2
    Wait Until Element Is Visible    ${Dropdown_Mucluc}    10s
    Select From List By Value        ${Dropdown_Mucluc}    7   
    Wait Until Element Is Visible    ${Dropdown_MuclucP}    10s
    Select From List By Value        ${Dropdown_MuclucP}    5    # 6 = Tài liệu demo

    Wait Until Element Is Visible    ${Input_Name_Mucluc}    10s
    Input Text                       ${Input_Name_Mucluc}    Tài liệu demo

    Wait Until Element Is Visible    ${Button_Save_Mucluc}    10s
    Scroll Element Into View         ${Button_Save_Mucluc}
    Click Element                    ${Button_Save_Mucluc}

    Wait Until Element Is Visible    ${Message_Mucluc}    10s
    Page Should Contain              Thêm mục lục hồ sơ thành công!

