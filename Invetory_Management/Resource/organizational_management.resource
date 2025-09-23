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

Verify Invalid Feedback Unit
    [Arguments]    ${expected_message}
    Wait Until Element Is Visible    ${mess_invalid_feedback_unit}    10s
    Element Should Contain    ${mess_invalid_feedback_unit}    ${expected_message}

Verify Invalid Feedback Phong
    [Arguments]    ${expected_message}
    Wait Until Element Is Visible    ${mess_invalid_feedback_phong}    10s
    Element Should Contain    ${mess_invalid_feedback_phong}    ${expected_message}
#Unit
Hien thi so ban ghi
    [Arguments]    ${so}
    Wait Until Element Is Visible    ${dropdown_hienthi}
    Select From List By Label    ${dropdown_hienthi}    ${so}
    ${row_count}=    Get Element Count    //tbody/tr
    Should Be Equal As Integers      ${row_count}    ${so}

Click Add Unit Form 
    Wait Until Element Is Visible    ${button_add_unit}    10s
    Click Element    ${button_add_unit}

Fill Unit Form
    [Arguments]    ${id}    ${name}
    Wait Until Element Is Visible    ${input_id_unit}    10s
    Input Text    ${input_id_unit}    ${id}
    Wait Until Element Is Visible    ${input_name_unit}    10s
    Input Text    ${input_name_unit}    ${name}

Click Cancel Unit
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

Click Update Unit
    Wait Until Element Is Visible    ${button_update_unit}    10s
    Scroll Element Into View    ${button_update_unit}
    Click Element               ${button_update_unit}

Edit Unit Form
    [Arguments]    ${new_name}
    Wait Until Element Is Visible    ${input_name_unit}    10s
    Clear Element Text    ${input_name_unit}
    Input Text    ${input_name_unit}    ${new_name}

#Phong
Click Add Phong Form
    Wait Until Element Is Visible    ${button_add_phong}    10s
    Click Element    ${button_add_phong}
Fill Phong Form
    [Arguments]    ${donvi}
    Wait Until Element Is Visible    ${dropdown_name_unit}    10s
    Select From List By Label    ${dropdown_name_unit}    ${donvi}
    Input Text    ${input_name_phong}    Tài liệu demo

Click Cancel Phong
    Wait Until Element Is Visible    ${button_cancel_add_phong}    10s
    Scroll Element Into View    ${button_cancel_add_phong}
    Click Element    ${button_cancel_add_phong}
    Wait Until Location Is    ${url_phong}

Click Back To Phong
    Wait Until Element Is Visible    ${button_back_to_phong}    10s
    Click Element    ${button_back_to_phong}
    Wait Until Location Is    ${url_phong}

Click Save Phong
    Wait Until Element Is Visible    ${button_save_phong}    10s
    Scroll Element Into View    ${button_save_phong}
    Click Element    ${button_save_phong}

Click Edit Phong
    Wait Until Element Is Visible    ${button_edit_phong}    10s
    Click Element                   ${button_edit_phong}
    
Edit Phong Form
    [Arguments]    ${new_name}
    Wait Until Element Is Visible    ${input_name_phong}    10s
    Clear Element Text    ${input_name_phong}
    Input Text    ${input_name_phong}    ${new_name}

 Click Delete Phong
    Wait Until Element Is Visible    ${button_delete_phong}    10s
    Click Element                   ${button_delete_phong}

Click Update Phong
    Wait Until Element Is Visible    ${button_update_phong}    10s
    Scroll Element Into View    ${button_update_phong}
    Click Element               ${button_update_phong}

Filter Phong
    [Arguments]    ${phong}
    Wait Until Element Is Visible    ${dropdown_phong}    10s
    Select From List By Label    ${dropdown_phong}    ${phong}
    Wait Until Element Is Visible    xpath=//table    10s
    Duyet Tung Dong Chua Nhieu Tu Khoa    ${phong}

#index
Click Add Index Form
    Wait Until Element Is Visible    ${button_add_index}    10s
    Click Element    ${button_add_index}

Fill Index Form
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

Click Cancel Index
    Wait Until Element Is Visible    ${button_cancel_index}    10s
    Scroll Element Into View    ${button_cancel_index}
    Click Element    ${button_cancel_index}
    Wait Until Location Is    ${url_index}

Click Back To Index
    Wait Until Element Is Visible    ${button_back_to_index}    10s
    Click Element    ${button_back_to_index}
    Wait Until Location Is    ${url_index}

Click Save Index
    Wait Until Element Is Visible    ${button_save_phong}    10s
    Scroll Element Into View    ${button_save_phong}
    Click Element    ${button_save_phong}

Click Edit Index
    Wait Until Element Is Visible    ${button_edit_index}    10s
    Click Element                   ${button_edit_index}

Edit Index Form
    [Arguments]    ${new_name}
    Wait Until Element Is Visible    ${input_name_index}    10s
    Clear Element Text    ${input_name_index}
    Input Text    ${input_name_index}    ${new_name}

 Click Delete Index
    Wait Until Element Is Visible    ${button_delete_index}    10s
    Click Element                   ${button_delete_index}

Click Update Index
    Wait Until Element Is Visible    ${button_update_index}    10s
    Scroll Element Into View    ${button_update_index}
    Click Element               ${button_update_index}

Filter Phong
    [Arguments]    ${phong}
    Wait Until Element Is Visible    ${dropdown_phong}    10s
    Select From List By Label    ${dropdown_phong}    ${phong}
    Wait Until Element Is Visible    xpath=//table    10s
    Duyet Tung Dong Chua Nhieu Tu Khoa    ${phong}

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
    Wait Until Element Is Visible    ${input_id_unit}    10s
    Scroll Element Into View    ${input_id_unit}
    Input Text                    ${input_id_unit}    01 

Add Phong but Name Phong Blank
    [Arguments]    ${donvi}
    Wait Until Element Is Visible    ${dropdown_name_unit}    10s
    Select From List By Label    ${dropdown_name_unit}    ${donvi}

Add Phong but Unit Blank
    Wait Until Element Is Visible    ${input_name_phong}    10s
    Scroll Element Into View    ${input_name_phong}
    Input Text    ${input_name_phong}    tài liệu

Add Mucluc Unit Blank 
    Wait Until Element Is Visible    ${input_id_index}    10s
    Input Text    ${input_id_index}    01
    Scroll Element Into View    ${input_name_index}
    Input Text    ${input_name_index}    Hồ sơ demo

Add Mucluc but Name MucLuc Blank 
    [Arguments]    ${donvi}    ${phong}
    Wait Until Element Is Visible    ${input_id_index}    10s
    Input Text    ${input_id_index}    01
    Scroll Element Into View    ${input_name_index}
    Input Text    ${input_name_index}    Hồ sơ demo

    Wait Until Element Is Visible    ${dropdown_donvi}    10s
    Select From List By Label    ${dropdown_donvi}    ${donvi}

    Wait Until Element Is Visible    ${dropdown_phong}    10s
    Wait Until Element Contains    ${dropdown_phong}    ${phong}    10s 
    Select From List By Label    ${dropdown_phong}    ${phong}

Verify Field Is Focused
    [Arguments]    ${locator}
    ${focused_element}=    Execute Javascript    return document.activeElement
    ${expected_element}=    Get WebElement    ${locator}
    Should Be Equal    ${focused_element}    ${expected_element}