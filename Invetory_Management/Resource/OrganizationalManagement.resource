*** Settings ***
Library    SeleniumLibrary
Resource    ../Resource/HomePage.resource
Resource    ../Resource/Search_Report.resource
Variables    ../Variables/locator.py

*** Keywords ***
#Don vi
Hien thi so ban ghi
    [Arguments]    ${so}
    Wait Until Element Is Visible    ${DROPDOWN_HIENTHI}
    Select From List By Label    ${DROPDOWN_HIENTHI}    ${so}

    ${row_count}=    Get Element Count    //tbody/tr
    Should Be Equal As Integers      ${row_count}    ${so}
Cancel Add Unit 
    Wait Until Element Is Visible    ${BUTTON_ADD_UNIT}    10s
    Click Element                   ${BUTTON_ADD_UNIT}
    Wait Until Element Is Visible    ${INPUT_ID_UNIT}    10s
    Input Text                    ${INPUT_ID_UNIT}    1
    
    Wait Until Element Is Visible    ${INPUT_NAME_UNIT}    10s
    Scroll Element Into View    ${INPUT_NAME_UNIT}
    Input Text                    ${INPUT_NAME_UNIT}    Ban kiểm soát

    Wait Until Element Is Visible    ${BUTTON_CANCEL_ADD_UNIT}    10s
    Scroll Element Into View    ${BUTTON_CANCEL_ADD_UNIT}
    Click Element                   ${BUTTON_CANCEL_ADD_UNIT}

    Wait Until Element Is Visible    Quản lý Đơn vị    10s


Back To List 
    Wait Until Element Is Visible    ${BUTTON_ADD_UNIT}    10s
    Click Element                   ${BUTTON_ADD_UNIT}
    Wait Until Element Is Visible    ${INPUT_ID_UNIT}    10s
    Input Text                    ${INPUT_ID_UNIT}    1
    
    Wait Until Element Is Visible    ${INPUT_NAME_UNIT}    10s
    Scroll Element Into View    ${INPUT_NAME_UNIT}
    Input Text                    ${INPUT_NAME_UNIT}    Ban kiểm soát

    Wait Until Element Is Visible    ${BUTTON_BACK_TO_LIST}    10s
    Scroll Element Into View    ${BUTTON_BACK_TO_LIST}
    Execute Javascript    window.scrollBy(0, -100)
    Click Element                   ${BUTTON_BACK_TO_LIST}

    Wait Until Element Is Visible    Quản lý Đơn vị    10s


 Verify Add To Unit
    Wait Until Element Is Visible    ${BUTTON_ADD_UNIT}    10s
    Click Element                   ${BUTTON_ADD_UNIT}
    Wait Until Element Is Visible    ${INPUT_ID_UNIT}    10s
    Input Text                    ${INPUT_ID_UNIT}    2
    
    Wait Until Element Is Visible    ${INPUT_NAME_UNIT}    10s
    Scroll Element Into View    ${INPUT_NAME_UNIT}
    Input Text                    ${INPUT_NAME_UNIT}    Ban kiểm soát

    Wait Until Element Is Visible    ${BUTTON_SAVE_ADD_UNIT}    10s
    Scroll Element Into View    ${BUTTON_SAVE_ADD_UNIT}
    Click Element                   ${BUTTON_SAVE_ADD_UNIT}

    Wait Until Page Contains    Thêm đơn vị thành công


Edit Unit "Cancel"
    Wait Until Element Is Visible    ${BUTTON_EDIT_UNIT}    10s
    Click Element                   ${BUTTON_EDIT_UNIT}  
    
    Wait Until Element Is Visible    ${INPUT_NAME_UNIT}    10s
    Scroll Element Into View    ${INPUT_NAME_UNIT}
    Clear Element Text            ${INPUT_NAME_UNIT}
    Input Text                    ${INPUT_NAME_UNIT}    Ban kiểm soát chỉnh sửa

    Wait Until Element Is Visible    ${BUTTON_CANCEL_ADD_UNIT}    10s
    Scroll Element Into View    ${BUTTON_CANCEL_ADD_UNIT}
    Click Element                   ${BUTTON_CANCEL_ADD_UNIT}

    Wait Until Element Is Visible    Quản lý Đơn vị    10s


Edit Unit "Back to list"
    Wait Until Element Is Visible    ${BUTTON_EDIT_UNIT}    10s
    Click Element                   ${BUTTON_EDIT_UNIT}  
    
    Wait Until Element Is Visible    ${INPUT_NAME_UNIT}    10s
    Scroll Element Into View    ${INPUT_NAME_UNIT}
    Clear Element Text            ${INPUT_NAME_UNIT}
    Input Text                    ${INPUT_NAME_UNIT}    Ban kiểm soát chỉnh sửa

    Wait Until Element Is Visible    ${BUTTON_BACK_TO_LIST}    10s
    Scroll Element Into View    ${BUTTON_BACK_TO_LIST}
    Execute Javascript    window.scrollBy(0, -100)
    Click Element                   ${BUTTON_BACK_TO_LIST}

    Wait Until Element Is Visible    Quản lý Đơn vị    10s

Edit Unit
    Wait Until Element Is Visible    ${BUTTON_EDIT_UNIT}    10s
    Click Element                   ${BUTTON_EDIT_UNIT}

    Wait Until Element Is Visible    ${INPUT_NAME_UNIT}    10s
    Clear Element Text             ${INPUT_NAME_UNIT}
    Input Text                    ${INPUT_NAME_UNIT}    Ban kiểm soát chỉnh sửa

    Wait Until Element Is Visible    ${BUTTON_UPDATE_UNIT}    10s
    Scroll Element Into View    ${BUTTON_UPDATE_UNIT}
    Click Element               ${BUTTON_UPDATE_UNIT}
    Wait Until Page Contains             Cập nhật đơn vị thành công!

Delete Unit
    Wait Until Element Is Visible    ${BUTTON_DELETE_UNIT}    10s
    Click Element                   ${BUTTON_DELETE_UNIT}
    Wait Until Page Contains             Xoá đơn vị thành công!

#Phong luu tru
Back To Phong
    Wait Until Element Is Visible    ${BUTTON_ADD_STORAGE}    10s
    Click Element                   ${BUTTON_ADD_STORAGE}

    Wait Until Element Is Visible    ${BUTTON_BACK_TO_STORAGE}    10s
    Click Element                   ${BUTTON_BACK_TO_STORAGE}

    Wait Until Element Is Visible    Quản lý Phông Lưu trữ    10s

Cancel Add Phong
    Wait Until Element Is Visible    ${BUTTON_ADD_STORAGE}    10s
    Click Element                   ${BUTTON_ADD_STORAGE}

    Wait Until Element Is Visible    ${BUTTON_CANCEL_ADD_PHONG}    10s
    Scroll Element Into View    ${BUTTON_CANCEL_ADD_PHONG}
    Click Element                   ${BUTTON_CANCEL_ADD_PHONG}

    Wait Until Element Is Visible    Quản lý Phông Lưu trữ    10s

Verify Add To Phong
    [Arguments]    ${donvi}
    Wait Until Element Is Visible    ${BUTTON_ADD_STORAGE}
    Click Element    ${BUTTON_ADD_STORAGE}
    Wait Until Element Is Visible    ${DROPDOWN_NAME_UNIT}    10s
    Select From List By Label    ${DROPDOWN_NAME_UNIT}    ${donvi}

    Input Text    ${INPUT_NAME_PHONG}    Tài liệu demo
    
    Wait Until Element Is Visible    ${BUTTON_SAVE_PHONG}
    Scroll Element Into View    ${BUTTON_SAVE_PHONG}
    Click Element    ${BUTTON_SAVE_PHONG}
    Wait Until Page Contains             Thêm phông lưu trữ thành công!

Edit Phong
    Wait Until Element Is Visible    ${BUTTON_EDIT_PHONG}    10s
    Scroll Element Into View    ${BUTTON_EDIT_PHONG}
    Click Element                   ${BUTTON_EDIT_PHONG}

    Wait Until Element Is Visible    ${INPUT_NAME_PHONG}    10s
    Clear Element Text             ${INPUT_NAME_PHONG}
    Input Text                    ${INPUT_NAME_PHONG}        Tài liệu

    Wait Until Element Is Visible    ${BUTTON_UPDATE_PHONG}    10s
    Scroll Element Into View    ${BUTTON_UPDATE_PHONG}
    Click Element               ${BUTTON_UPDATE_PHONG}

    Wait Until Page Contains             Cập nhật phông lưu trữ thành công!

Edit Phong "Cancel"
    Wait Until Element Is Visible    ${BUTTON_EDIT_PHONG}    10s
    Scroll Element Into View    ${BUTTON_EDIT_PHONG}
    Click Element                   ${BUTTON_EDIT_PHONG}  

    Wait Until Element Is Visible    ${BUTTON_CANCEL_ADD_PHONG}    10s
    Scroll Element Into View    ${BUTTON_CANCEL_ADD_PHONG}
    Click Element                   ${BUTTON_CANCEL_ADD_PHONG}

    Wait Until Element Is Visible    Quản lý Phông Lưu trữ    10s

Edit Back To Phong
    Wait Until Element Is Visible    ${BUTTON_EDIT_PHONG}    10s
    Scroll Element Into View    ${BUTTON_EDIT_PHONG}
    Click Element                   ${BUTTON_EDIT_PHONG}  

    Wait Until Element Is Visible    ${BUTTON_BACK_TO_STORAGE}    10s
    Click Element                   ${BUTTON_BACK_TO_STORAGE}

    Wait Until Element Is Visible    Quản lý Phông Lưu trữ    10s

Delete Phong
    Wait Until Element Is Visible    ${BUTTON_DELETE_PHONG}    10s
    Click Element                   ${BUTTON_DELETE_PHONG}
    Wait Until Page Contains             Xoá phông lưu trữ thành công!

Filter Phong
    [Arguments]    ${phong}
    Wait Until Element Is Visible    ${DROPDOWN_PHONG}    10s
    Select From List By Label    ${DROPDOWN_PHONG}    ${phong}
    Wait Until Element Is Visible    xpath=//table    10s
    Duyet Tung Dong Chua Nhieu Tu Khoa    ${phong}

#Muc luc ho so
Back To Mucluc
    Wait Until Element Is Visible    ${BUTTON_ADD_MUCLUC}    10s
    Click Element                   ${BUTTON_ADD_MUCLUC}

    Wait Until Element Is Visible    ${BUTTON_BACK_TO_MUCLUC}    10s
    Click Element                   ${BUTTON_BACK_TO_MUCLUC}

    Wait Until Element Is Visible    Quản lý Mục lục hồ sơ    10s

Cancel Add Mucluc
    Wait Until Element Is Visible    ${BUTTON_ADD_MUCLUC}    10s
    Click Element                   ${BUTTON_ADD_MUCLUC}

    Wait Until Element Is Visible    ${BUTTON_CANCEL_MUCLUC}    10s
    Scroll Element Into View    ${BUTTON_CANCEL_MUCLUC}
    Click Element                   ${BUTTON_CANCEL_MUCLUC}

    Wait Until Element Is Visible    Quản lý Mục lục hồ sơ    10s

Verify Add To Mucluc
    [Arguments]    ${DONVI}    ${PHONG}
    Wait Until Element Is Visible    ${BUTTON_ADD_MUCLUC}    10s
    Click Element                    ${BUTTON_ADD_MUCLUC}
    Wait Until Element Is Visible    ${INPUT_ID_MUCLUC}    10s
    Input Text                       ${INPUT_ID_MUCLUC}    2

    Wait Until Element Is Visible    ${DROPDOWN_DONVI}    10s
    Select From List By Label    ${DROPDOWN_DONVI}    ${DONVI}

    Wait Until Element Is Visible    ${DROPDOWN_PHONG}    10s
    Wait Until Element Contains    ${DROPDOWN_PHONG}    ${PHONG}    10s 
    Scroll Element Into View    ${DROPDOWN_PHONG}
    Select From List By Label    ${DROPDOWN_PHONG}    ${PHONG}

    Wait Until Element Is Visible    ${INPUT_NAME_MUCLUC}    10s
    Input Text                       ${INPUT_NAME_MUCLUC}    Tài liệu demo

    Wait Until Element Is Visible    ${BUTTON_SAVE_MUCLUC}    10s
    Scroll Element Into View         ${BUTTON_SAVE_MUCLUC}
    Click Element                    ${BUTTON_SAVE_MUCLUC}

    Wait Until Page Contains              Thêm mục lục hồ sơ thành công!

Edit Mucluc
    Wait Until Element Is Visible    ${BUTTON_EDIT_MUCLUC}    10s
    Scroll Element Into View    ${BUTTON_EDIT_MUCLUC}
    Click Element                   ${BUTTON_EDIT_MUCLUC}
    
    Wait Until Element Is Visible    ${INPUT_NAME_MUCLUC}    10s
    Clear Element Text             ${INPUT_NAME_MUCLUC}
    Input Text                       ${INPUT_NAME_MUCLUC}    Tài liệu demo1
    
    Wait Until Element Is Visible    ${BUTTON_UPDATE_MUCLUC}    10s
    Scroll Element Into View    ${BUTTON_UPDATE_MUCLUC}
    Click Element               ${BUTTON_UPDATE_MUCLUC}

    Wait Until Page Contains             Cập nhật mục lục hồ sơ thành công!

Edit Mucluc "Cancel"
    Wait Until Element Is Visible    ${BUTTON_EDIT_MUCLUC}    10s
    Scroll Element Into View    ${BUTTON_EDIT_MUCLUC}
    Click Element                   ${BUTTON_EDIT_MUCLUC}  

    Wait Until Element Is Visible    ${INPUT_NAME_MUCLUC}    10s
    Clear Element Text             ${INPUT_NAME_MUCLUC}
    Input Text                       ${INPUT_NAME_MUCLUC}    Tài liệu demo1

    Wait Until Element Is Visible    ${BUTTON_CANCEL_MUCLUC}    10s
    Scroll Element Into View    ${BUTTON_CANCEL_MUCLUC}
    Click Element                   ${BUTTON_CANCEL_MUCLUC}

    Wait Until Element Is Visible    Quản lý Mục lục hồ sơ    10s

Edit Back To Mucluc
    Wait Until Element Is Visible    ${BUTTON_EDIT_MUCLUC}    10s
    Scroll Element Into View    ${BUTTON_EDIT_MUCLUC}
    Click Element                   ${BUTTON_EDIT_MUCLUC}

    Wait Until Element Is Visible    ${INPUT_NAME_MUCLUC}    10s
    Scroll Element Into View    ${INPUT_NAME_MUCLUC}
    Clear Element Text             ${INPUT_NAME_MUCLUC}
    Input Text                       ${INPUT_NAME_MUCLUC}    Tài liệu demo1  

    Wait Until Element Is Visible    ${BUTTON_BACK_TO_MUCLUC}    10s
    Press Keys    None    PAGE_UP
    Click Element                   ${BUTTON_BACK_TO_MUCLUC}

    Wait Until Element Is Visible    Quản lý Mục lục hồ sơ    10s

Delete Mucluc
    Wait Until Element Is Visible    ${BUTTON_DELETE_MUCLUC}    10s
    Scroll Element Into View    ${BUTTON_DELETE_MUCLUC}
    Click Element                   ${BUTTON_DELETE_MUCLUC}
    Wait Until Page Contains             Xoá mục lục hồ sơ thành công!

Filter Phong_Donvi
    [Arguments]    ${donvi}
    Wait Until Element Is Visible    ${DROPDOWN_DONVIP}    10s
    Select From List By Label    ${DROPDOWN_DONVIP}    ${donvi}   
    Wait Until Page Contains             Chi nhánh TP.HCM

Filter Phong_Donvi2
    [Arguments]    ${donvi}    ${phong}
    Wait Until Element Is Visible    ${DROPDOWN_DONVIP}    10s
    Select From List By Label    ${DROPDOWN_DONVIP}    ${donvi} 

    Wait Until Element Is Visible    ${DROPDOWN_DVPHONG}    10s
    Wait Until Element Contains    ${DROPDOWN_DVPHONG}    ${phong}    10s 
    Select From List By Label    ${DROPDOWN_DVPHONG}    ${phong}

    Wait Until Page Contains    Chi nhánh TP.HCM    10s
    Wait Until Page Contains    Phông Hồ sơ Nhân sự    10s

Add Unit and Name Unit Blank 
    Wait Until Element Is Visible    ${BUTTON_ADD_UNIT}    10s
    Click Element                   ${BUTTON_ADD_UNIT}

    Wait Until Element Is Visible    ${INPUT_ID_UNIT}    10s
    Scroll Element Into View    ${INPUT_ID_UNIT}
    Input Text                    ${INPUT_ID_UNIT}    01

    Wait Until Element Is Visible    ${BUTTON_SAVE_ADD_UNIT}    10s
    Scroll Element Into View    ${BUTTON_SAVE_ADD_UNIT}
    Click Element                   ${BUTTON_SAVE_ADD_UNIT}

    Wait Until Page Contains    Tên đơn vị không được để trống

Add Unit and ID_Name Unit Blank
    Wait Until Element Is Visible    ${BUTTON_ADD_UNIT}    10s
    Click Element                   ${BUTTON_ADD_UNIT}

    Wait Until Element Is Visible    ${BUTTON_SAVE_ADD_UNIT}    10s
    Scroll Element Into View    ${BUTTON_SAVE_ADD_UNIT}
    Click Element                   ${BUTTON_SAVE_ADD_UNIT}
    Wait Until Page Contains    Mã đơn vị không được để trống
    Wait Until Page Contains    Tên đơn vị không được để trống    

Add Phong but Name Phong Blank
    [Arguments]    ${donvi}
    Wait Until Element Is Visible    ${BUTTON_ADD_STORAGE}    10s
    Click Element                   ${BUTTON_ADD_STORAGE}
    Wait Until Element Is Visible    ${DROPDOWN_NAME_UNIT}    10s
    Select From List By Label    ${DROPDOWN_NAME_UNIT}    ${donvi}

    Wait Until Element Is Visible    ${BUTTON_SAVE_PHONG}    10s
    Scroll Element Into View    ${BUTTON_SAVE_PHONG}
    Click Element                   ${BUTTON_SAVE_PHONG}

Add Phong but Unit Blank
    Wait Until Element Is Visible    ${BUTTON_ADD_STORAGE}    10s
    Click Element                   ${BUTTON_ADD_STORAGE}

    Wait Until Element Is Visible    ${INPUT_NAME_PHONG}    10s
    Scroll Element Into View    ${INPUT_NAME_PHONG}
    Input Text    ${INPUT_NAME_PHONG}    tài liệu

    Wait Until Element Is Visible    ${BUTTON_SAVE_PHONG}    10s
    Scroll Element Into View    ${BUTTON_SAVE_PHONG}
    Click Element                   ${BUTTON_SAVE_PHONG}
    Wait Until Page Contains    Vui lòng chọn đơn vị

Add Mucluc Blank All 
    Wait Until Element Is Visible    ${BUTTON_ADD_MUCLUC}    10s
    Click Element                   ${BUTTON_ADD_MUCLUC}

    Wait Until Element Is Visible    ${BUTTON_SAVE_MUCLUC}    10s
    Scroll Element Into View    ${BUTTON_SAVE_MUCLUC}
    Click Element                   ${BUTTON_SAVE_MUCLUC}

Add Mucluc Unit Blank 
    Wait Until Element Is Visible    ${BUTTON_ADD_MUCLUC}    10s
    Click Element                   ${BUTTON_ADD_MUCLUC}

    Wait Until Element Is Visible    ${INPUT_ID_MUCLUC}    10s
    Input Text    ${INPUT_ID_MUCLUC}    01
    Scroll Element Into View    ${INPUT_NAME_MUCLUC}
    Input Text    ${INPUT_ID_MUCLUC}    Hồ sơ demo

    Wait Until Element Is Visible    ${BUTTON_SAVE_MUCLUC}    10s
    Scroll Element Into View    ${BUTTON_SAVE_MUCLUC}
    Click Element                   ${BUTTON_SAVE_MUCLUC}

Add Mucluc but Name MucLuc Blank 
    [Arguments]    ${donvi}    ${phong}
    Wait Until Element Is Visible    ${BUTTON_ADD_MUCLUC}    10s
    Click Element                   ${BUTTON_ADD_MUCLUC}

    Wait Until Element Is Visible    ${INPUT_ID_MUCLUC}    10s
    Input Text    ${INPUT_ID_MUCLUC}    01
    Scroll Element Into View    ${INPUT_NAME_MUCLUC}
    Input Text    ${INPUT_ID_MUCLUC}    Hồ sơ demo

    Wait Until Element Is Visible    ${DROPDOWN_DONVI}    10s
    Select From List By Label    ${DROPDOWN_DONVI}    ${donvi}

    Wait Until Element Is Visible    ${DROPDOWN_PHONG}    10s
    Wait Until Element Contains    ${DROPDOWN_PHONG}    ${phong}    10s 
    Select From List By Label    ${DROPDOWN_PHONG}    ${phong}

    Wait Until Element Is Visible    ${BUTTON_SAVE_MUCLUC}    10s
    Scroll Element Into View    ${BUTTON_SAVE_MUCLUC}
    Click Element                   ${BUTTON_SAVE_MUCLUC}

Verify Field Is Focused
    [Arguments]    ${locator}
    ${focused_element}=    Execute Javascript    return document.activeElement
    ${expected_element}=    Get WebElement    ${locator}
    Should Be Equal    ${focused_element}    ${expected_element}