*** Settings ***
Library    SeleniumLibrary
Resource    ../Resource/HomePage.resource
Resource    ../Resource/Search_Report.resource
Variables    ../Variables/locator.py


*** Keywords ***
#Don vi
Hien thi so ban ghi
    [Arguments]    ${so}
    Wait Until Element Is Visible    ${Dropdown_HienThi}
    Select From List By Label    ${Dropdown_HienThi}    ${so}

    ${row_count}=    Get Element Count    //tbody/tr
    Should Be Equal As Integers      ${row_count}    ${so}
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
    [Arguments]    ${donvi}
    Wait Until Element Is Visible    ${Button_Add_Storage}
    Click Element    ${Button_Add_Storage}
    Wait Until Element Is Visible    ${Dropdown_Name_Unit}    10s
    Select From List By Label    ${Dropdown_Name_Unit}    ${donvi}

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
    [Arguments]    ${phong}
    Wait Until Element Is Visible    ${Dropdown_Phong}    10s
    Select From List By Label    ${Dropdown_Phong}    ${phong}
    Wait Until Element Is Visible    xpath=//table    10s
    Duyet Tung Dong Chua Nhieu Tu Khoa    ${phong}

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
    [Arguments]    ${donvi}    ${phong}
    Wait Until Element Is Visible    ${Button_Add_Mucluc}    10s
    Click Element                    ${Button_Add_Mucluc}
    Wait Until Element Is Visible    ${Input_ID_Mucluc}    10s
    Input Text                       ${Input_ID_Mucluc}    2

    Wait Until Element Is Visible    ${Dropdown_DonVi}    10s
    Select From List By Label    ${Dropdown_DonVi}    ${donvi}

    Wait Until Element Is Visible    ${Dropdown_Phong}    10s
    Wait Until Element Contains    ${Dropdown_Phong}    ${phong}    10s 
    Scroll Element Into View    ${Dropdown_Phong}
    Select From List By Label    ${Dropdown_Phong}    ${phong}

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
    [Arguments]    ${donvi}
    Wait Until Element Is Visible    ${Dropdown_DonViP}    10s
    Select From List By Label    ${Dropdown_DonViP}    ${donvi}   
    Wait Until Page Contains             Chi nhánh TP.HCM

Filter Phong_Donvi2
    [Arguments]    ${donvi}    ${phong}
    Wait Until Element Is Visible    ${Dropdown_DonViP}    10s
    Select From List By Label    ${Dropdown_DonViP}    ${donvi} 

    Wait Until Element Is Visible    ${Dropdown_DVPhong}    10s
    Wait Until Element Contains    ${Dropdown_DVPhong}    ${phong}    10s 
    Select From List By Label    ${Dropdown_DVPhong}    ${phong}

    Wait Until Page Contains    Chi nhánh TP.HCM    10s
    Wait Until Page Contains    Phông Hồ sơ Nhân sự    10s


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
    [Arguments]    ${donvi}
    Wait Until Element Is Visible    ${Button_Add_Storage}    10s
    Click Element                   ${Button_Add_Storage}
    Wait Until Element Is Visible    ${Dropdown_Name_Unit}    10s
    Select From List By Label    ${Dropdown_Name_Unit}    ${donvi}

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
    [Arguments]    ${donvi}    ${phong}
    Wait Until Element Is Visible    ${Button_Add_Mucluc}    10s
    Click Element                   ${Button_Add_Mucluc}

    Wait Until Element Is Visible    ${Input_ID_Mucluc}    10s
    Input Text    ${Input_ID_Mucluc}    01
    Scroll Element Into View    ${Input_Name_Mucluc}
    Input Text    ${Input_ID_Mucluc}    Hồ sơ demo

    Wait Until Element Is Visible    ${Dropdown_DonVi}    10s
    Select From List By Label    ${Dropdown_DonVi}    ${donvi}

    Wait Until Element Is Visible    ${Dropdown_Phong}    10s
    Wait Until Element Contains    ${Dropdown_Phong}    ${phong}    10s 
    Select From List By Label    ${Dropdown_Phong}    ${phong}

    Wait Until Element Is Visible    ${Button_Save_Mucluc}    10s
    Scroll Element Into View    ${Button_Save_Mucluc}
    Click Element                   ${Button_Save_Mucluc}

Verify Field Is Focused
    [Arguments]    ${locator}
    ${focused_element}=    Execute Javascript    return document.activeElement
    ${expected_element}=    Get WebElement    ${locator}
    Should Be Equal    ${focused_element}    ${expected_element}