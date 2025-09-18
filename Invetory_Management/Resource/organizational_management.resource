*** Settings ***
Library    SeleniumLibrary
Resource    ../resource/home_page.resource
Resource    ../resource/search_report.resource
Variables    ../variables/locator.py

*** Variables ***

*** Keywords ***
Verify Success Alert
    [Arguments]    ${expected_message}
    Wait Until Element Is Visible    ${message_unit}    10s
    Element Should Contain    ${message_unit}    ${expected_message}

#Don vi
Hien thi so ban ghi
    [Arguments]    ${so}
    Wait Until Element Is Visible    ${dropdown_hienthi}
    Select From List By Label    ${dropdown_hienthi}    ${so}
    ${row_count}=    Get Element Count    //tbody/tr
    Should Be Equal As Integers      ${row_count}    ${so}

Click Add Unit Form 
    Wait Until Element Is Visible    ${button_add_unit}    10s
    Click Element    ${button_add_unit}

Click Cancel Add Unit
    Wait Until Element Is Visible    ${button_cancel_add_unit}    10s
    Scroll Element Into View    ${button_cancel_add_unit}
    Click Element    ${button_cancel_add_unit}
    Wait Until Location Is    ${url_unit}

Click Back To List
    Wait Until Element Is Visible    ${button_back_to_list}    10s
    Scroll Element Into View    ${button_back_to_list}
    Execute Javascript    window.scrollBy(0, -100)
    Click Element    ${button_back_to_list}
    Wait Until Location Is    ${url_unit}

Click Save Unit
    Wait Until Element Is Visible    ${button_save_add_unit}    10s
    Scroll Element Into View    ${button_save_add_unit}
    Click Element    ${button_save_add_unit}

Click Edit Unit
    Wait Until Element Is Visible    ${button_edit_unit}    10s
    Click Element                   ${button_edit_unit}
    
 Click Delete Unit
    Wait Until Element Is Visible    ${button_delete_unit}    10s
    Click Element                   ${button_delete_unit}
    Wait Until Page Contains             Xoá đơn vị thành công!

Click Update Unit
    Wait Until Element Is Visible    ${button_update_unit}    10s
    Scroll Element Into View    ${button_update_unit}
    Click Element               ${button_update_unit}
Fill Unit Form
    [Arguments]    ${id}    ${name}
    Wait Until Element Is Visible    ${input_id_unit}    10s
    Input Text    ${input_id_unit}    ${id}
    Wait Until Element Is Visible    ${input_name_unit}    10s
    Input Text    ${input_name_unit}    ${name}

Edit Unit Form
    [Arguments]    ${new_name}
    Wait Until Element Is Visible    ${input_name_unit}    10s
    Clear Element Text    ${input_name_unit}
    Input Text    ${input_name_unit}    ${new_name}

#Phong luu tru
Back To Phong
    Wait Until Element Is Visible    ${button_add_phong}    10s
    Click Element                   ${button_add_phong}

    Wait Until Element Is Visible    ${button_back_to_phong}    10s
    Click Element                   ${button_back_to_phong}

    Wait Until Element Is Visible    Quản lý Phông Lưu trữ    10s

Cancel Add Phong
    Wait Until Element Is Visible    ${button_add_phong}    10s
    Click Element                   ${button_add_phong}

    Wait Until Element Is Visible    ${button_cancel_add_phong}    10s
    Scroll Element Into View    ${button_cancel_add_phong}
    Click Element                   ${button_cancel_add_phong}

    Wait Until Element Is Visible    Quản lý Phông Lưu trữ    10s

Verify Add To Phong
    [Arguments]    ${donvi}
    Wait Until Element Is Visible    ${button_add_phong}
    Click Element    ${button_add_phong}
    Wait Until Element Is Visible    ${dropdown_name_unit}    10s
    Select From List By Label    ${dropdown_name_unit}    ${donvi}

    Input Text    ${input_name_phong}    Tài liệu demo
    
    Wait Until Element Is Visible    ${button_save_phong}
    Scroll Element Into View    ${button_save_phong}
    Click Element    ${button_save_phong}
    Wait Until Page Contains             Thêm phông lưu trữ thành công!

Edit Phong
    Wait Until Element Is Visible    ${button_edit_phong}    10s
    Scroll Element Into View    ${button_edit_phong}
    Click Element                   ${button_edit_phong}

    Wait Until Element Is Visible    ${input_name_phong}    10s
    Clear Element Text             ${input_name_phong}
    Input Text                    ${input_name_phong}        Tài liệu

    Wait Until Element Is Visible    ${button_update_phong}    10s
    Scroll Element Into View    ${button_update_phong}
    Click Element               ${button_update_phong}

    Wait Until Page Contains             Cập nhật phông lưu trữ thành công!

Edit Phong "Cancel"
    Wait Until Element Is Visible    ${button_edit_phong}    10s
    Scroll Element Into View    ${button_edit_phong}
    Click Element                   ${button_edit_phong}  

    Wait Until Element Is Visible    ${button_cancel_add_phong}    10s
    Scroll Element Into View    ${button_cancel_add_phong}
    Click Element                   ${button_cancel_add_phong}

    Wait Until Element Is Visible    Quản lý Phông Lưu trữ    10s

Edit Back To Phong
    Wait Until Element Is Visible    ${button_edit_phong}    10s
    Scroll Element Into View    ${button_edit_phong}
    Click Element                   ${button_edit_phong}  

    Wait Until Element Is Visible    ${button_back_to_phong}    10s
    Click Element                   ${button_back_to_phong}

    Wait Until Element Is Visible    Quản lý Phông Lưu trữ    10s

Delete Phong
    Wait Until Element Is Visible    ${button_delete_phong}    10s
    Click Element                   ${button_delete_phong}
    Wait Until Page Contains             Xoá phông lưu trữ thành công!

Filter Phong
    [Arguments]    ${phong}
    Wait Until Element Is Visible    ${dropdown_phong}    10s
    Select From List By Label    ${dropdown_phong}    ${phong}
    Wait Until Element Is Visible    xpath=//table    10s
    Duyet Tung Dong Chua Nhieu Tu Khoa    ${phong}

#Muc luc ho so
Back To Mucluc
    Wait Until Element Is Visible    ${button_add_index}    10s
    Click Element                   ${button_add_index}

    Wait Until Element Is Visible    ${button_back_to_index}    10s
    Click Element                   ${button_back_to_index}

    Wait Until Element Is Visible    Quản lý Mục lục hồ sơ    10s

Cancel Add Mucluc
    Wait Until Element Is Visible    ${button_add_index}    10s
    Click Element                   ${button_add_index}

    Wait Until Element Is Visible    ${button_cancel_index}    10s
    Scroll Element Into View    ${button_cancel_index}
    Click Element                   ${button_cancel_index}

    Wait Until Element Is Visible    Quản lý Mục lục hồ sơ    10s

Verify Add To Mucluc
    [Arguments]    ${donvi}    ${phong}
    Wait Until Element Is Visible    ${button_add_index}    10s
    Click Element                    ${button_add_index}
    Wait Until Element Is Visible    ${input_id_index}    10s
    Input Text                       ${input_id_index}    2

    Wait Until Element Is Visible    ${dropdown_donvi}    10s
    Select From List By Label    ${dropdown_donvi}    ${donvi}

    Wait Until Element Is Visible    ${dropdown_phong}    10s
    Wait Until Element Contains    ${dropdown_phong}    ${phong}    10s 
    Scroll Element Into View    ${dropdown_phong}
    Select From List By Label    ${dropdown_phong}    ${phong}

    Wait Until Element Is Visible    ${input_name_index}    10s
    Input Text                       ${input_name_index}    Tài liệu demo

    Wait Until Element Is Visible    ${button_save_index}    10s
    Scroll Element Into View         ${button_save_index}
    Click Element                    ${button_save_index}

    Wait Until Page Contains              Thêm mục lục hồ sơ thành công!

Edit Mucluc
    Wait Until Element Is Visible    ${button_edit_index}    10s
    Scroll Element Into View    ${button_edit_index}
    Click Element                   ${button_edit_index}
    
    Wait Until Element Is Visible    ${input_name_index}    10s
    Clear Element Text             ${input_name_index}
    Input Text                       ${input_name_index}    Tài liệu demo1
    
    Wait Until Element Is Visible    ${button_update_index}    10s
    Scroll Element Into View    ${button_update_index}
    Click Element               ${button_update_index}

    Wait Until Page Contains             Cập nhật mục lục hồ sơ thành công!

Edit Mucluc "Cancel"
    Wait Until Element Is Visible    ${button_edit_index}    10s
    Scroll Element Into View    ${button_edit_index}
    Click Element                   ${button_edit_index}  

    Wait Until Element Is Visible    ${input_name_index}    10s
    Clear Element Text             ${input_name_index}
    Input Text                       ${input_name_index}    Tài liệu demo1

    Wait Until Element Is Visible    ${button_cancel_index}    10s
    Scroll Element Into View    ${button_cancel_index}
    Click Element                   ${button_cancel_index}

    Wait Until Element Is Visible    Quản lý Mục lục hồ sơ    10s

Edit Back To Mucluc
    Wait Until Element Is Visible    ${button_edit_index}    10s
    Scroll Element Into View    ${button_edit_index}
    Click Element                   ${button_edit_index}

    Wait Until Element Is Visible    ${input_name_index}    10s
    Scroll Element Into View    ${input_name_index}
    Clear Element Text             ${input_name_index}
    Input Text                       ${input_name_index}    Tài liệu demo1  

    Wait Until Element Is Visible    ${button_back_to_index}    10s
    Press Keys    None    PAGE_UP
    Click Element                   ${button_back_to_index}

    Wait Until Element Is Visible    Quản lý Mục lục hồ sơ    10s

Delete Mucluc
    Wait Until Element Is Visible    ${button_delete_index}    10s
    Scroll Element Into View    ${button_delete_index}
    Click Element                   ${button_delete_index}
    Wait Until Page Contains             Xoá mục lục hồ sơ thành công!

Filter Phong_Donvi
    [Arguments]    ${donvi}
    Wait Until Element Is Visible    ${dropdown_donvip}    10s
    Select From List By Label    ${dropdown_donvip}    ${donvi}   
    Wait Until Page Contains             Chi nhánh TP.HCM

Filter Phong_Donvi2
    [Arguments]    ${donvi}    ${phong}
    Wait Until Element Is Visible    ${dropdown_donvip}    10s
    Select From List By Label    ${dropdown_donvip}    ${donvi} 

    Wait Until Element Is Visible    ${dropdown_dvphong}    10s
    Wait Until Element Contains    ${dropdown_dvphong}    ${phong}    10s 
    Select From List By Label    ${dropdown_dvphong}    ${phong}

    Wait Until Page Contains    Chi nhánh TP.HCM    10s
    Wait Until Page Contains    Phông Hồ sơ Nhân sự    10s

Add Unit and Name Unit Blank 
    Wait Until Element Is Visible    ${button_add_unit}    10s
    Click Element                   ${button_add_unit}

    Wait Until Element Is Visible    ${input_id_unit}    10s
    Scroll Element Into View    ${input_id_unit}
    Input Text                    ${input_id_unit}    01

    Wait Until Element Is Visible    ${button_save_add_unit}    10s
    Scroll Element Into View    ${button_save_add_unit}
    Click Element                   ${button_save_add_unit}

    Wait Until Page Contains    Tên đơn vị không được để trống

Add Unit and ID_Name Unit Blank
    Wait Until Element Is Visible    ${button_add_unit}    10s
    Click Element                   ${button_add_unit}

    Wait Until Element Is Visible    ${button_save_add_unit}    10s
    Scroll Element Into View    ${button_save_add_unit}
    Click Element                   ${button_save_add_unit}
    Wait Until Page Contains    Mã đơn vị không được để trống
    Wait Until Page Contains    Tên đơn vị không được để trống    

Add Phong but Name Phong Blank
    [Arguments]    ${donvi}
    Wait Until Element Is Visible    ${button_add_phong}    10s
    Click Element                   ${button_add_phong}
    Wait Until Element Is Visible    ${dropdown_name_unit}    10s
    Select From List By Label    ${dropdown_name_unit}    ${donvi}

    Wait Until Element Is Visible    ${button_save_phong}    10s
    Scroll Element Into View    ${button_save_phong}
    Click Element                   ${button_save_phong}

Add Phong but Unit Blank
    Wait Until Element Is Visible    ${button_add_phong}    10s
    Click Element                   ${button_add_phong}

    Wait Until Element Is Visible    ${input_name_phong}    10s
    Scroll Element Into View    ${input_name_phong}
    Input Text    ${input_name_phong}    tài liệu

    Wait Until Element Is Visible    ${button_save_phong}    10s
    Scroll Element Into View    ${button_save_phong}
    Click Element                   ${button_save_phong}
    Wait Until Page Contains    Vui lòng chọn đơn vị

Add Mucluc Blank All 
    Wait Until Element Is Visible    ${button_add_index}    10s
    Click Element                   ${button_add_index}

    Wait Until Element Is Visible    ${button_save_index}    10s
    Scroll Element Into View    ${button_save_index}
    Click Element                   ${button_save_index}

Add Mucluc Unit Blank 
    Wait Until Element Is Visible    ${button_add_index}    10s
    Click Element                   ${button_add_index}

    Wait Until Element Is Visible    ${input_id_index}    10s
    Input Text    ${input_id_index}    01
    Scroll Element Into View    ${input_name_index}
    Input Text    ${input_name_index}    Hồ sơ demo

    Wait Until Element Is Visible    ${button_save_index}    10s
    Scroll Element Into View    ${button_save_index}
    Click Element                   ${button_save_index}

Add Mucluc but Name MucLuc Blank 
    [Arguments]    ${donvi}    ${phong}
    Wait Until Element Is Visible    ${button_add_index}    10s
    Click Element                   ${button_add_index}

    Wait Until Element Is Visible    ${input_id_index}    10s
    Input Text    ${input_id_index}    01
    Scroll Element Into View    ${input_name_index}
    Input Text    ${input_name_index}    Hồ sơ demo

    Wait Until Element Is Visible    ${dropdown_donvi}    10s
    Select From List By Label    ${dropdown_donvi}    ${donvi}

    Wait Until Element Is Visible    ${dropdown_phong}    10s
    Wait Until Element Contains    ${dropdown_phong}    ${phong}    10s 
    Select From List By Label    ${dropdown_phong}    ${phong}

    Wait Until Element Is Visible    ${button_save_index}    10s
    Scroll Element Into View    ${button_save_index}
    Click Element                   ${button_save_index}

Verify Field Is Focused
    [Arguments]    ${locator}
    ${focused_element}=    Execute Javascript    return document.activeElement
    ${expected_element}=    Get WebElement    ${locator}
    Should Be Equal    ${focused_element}    ${expected_element}