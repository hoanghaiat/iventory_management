*** Settings ***
Library    SeleniumLibrary
Resource    ../resource/home_page.resource
Resource    ../resource/search_report.resource
Variables    ../variables/locator.py

*** Variables ***

*** Keywords ***
Verify Success Alert
    [Arguments]    ${expected_message}
    Wait Until Element Is Visible    ${MESSAGE_UNIT}    10s
    Element Should Contain    ${MESSAGE_UNIT}    ${expected_message}

Verify Invalid Feedback Unit
    [Arguments]    ${expected_message}
    Wait Until Element Is Visible    ${MESS_INVALID_FEEDBACK_UNIT}    10s
    Element Should Contain    ${MESS_INVALID_FEEDBACK_UNIT}    ${expected_message}

Verify Invalid Feedback Phong
    [Arguments]    ${expected_message}
    Wait Until Element Is Visible    ${MESS_INVALID_FEEDBACK_PHONG}    10s
    Element Should Contain    ${MESS_INVALID_FEEDBACK_PHONG}    ${expected_message}
#Unit
Hien thi so ban ghi
    [Arguments]    ${so}
    Wait Until Element Is Visible    ${DROPDOWN_HIENTHI}
    Select From List By Label    ${DROPDOWN_HIENTHI}    ${so}
    ${row_count}=    Get Element Count    //tbody/tr
    Should Be Equal As Integers      ${row_count}    ${so}

Click Add Unit Form 
    Wait Until Element Is Visible    ${BUTTON_ADD_UNIT}    10s
    Click Element    ${BUTTON_ADD_UNIT}

Fill Unit Form
    [Arguments]    ${id}    ${name}
    Wait Until Element Is Visible    ${INPUT_ID_UNIT}    10s
    Input Text    ${INPUT_ID_UNIT}    ${id}
    Wait Until Element Is Visible    ${INPUT_NAME_UNIT}    10s
    Input Text    ${INPUT_NAME_UNIT}    ${name}

Click Cancel Unit
    Wait Until Element Is Visible    ${BUTTON_CANCEL_ADD_UNIT}    10s
    Scroll Element Into View    ${BUTTON_CANCEL_ADD_UNIT}
    Click Element    ${BUTTON_CANCEL_ADD_UNIT}
    Wait Until Location Is    ${url_unit}

Click Back To List
    Wait Until Element Is Visible    ${BUTTON_BACK_TO_LIST}    10s
    Scroll Element Into View    ${BUTTON_BACK_TO_LIST}
    Execute Javascript    window.scrollBy(0, -100)
    Click Element    ${BUTTON_BACK_TO_LIST}
    Wait Until Location Is    ${url_unit}

Click Save Unit
    Wait Until Element Is Visible    ${BUTTON_SAVE_ADD_UNIT}    10s
    Scroll Element Into View    ${BUTTON_SAVE_ADD_UNIT}
    Click Element    ${BUTTON_SAVE_ADD_UNIT}

Click Edit Unit
    Wait Until Element Is Visible    ${BUTTON_EDIT_UNIT}    10s
    Click Element                   ${BUTTON_EDIT_UNIT}
    
 Click Delete Unit
    Wait Until Element Is Visible    ${BUTTON_DELETE_UNIT}    10s
    Click Element                   ${BUTTON_DELETE_UNIT}

Click Update Unit
    Wait Until Element Is Visible    ${BUTTON_UPDATE_UNIT}    10s
    Scroll Element Into View    ${BUTTON_UPDATE_UNIT}
    Click Element               ${BUTTON_UPDATE_UNIT}

Edit Unit Form
    [Arguments]    ${new_name}
    Wait Until Element Is Visible    ${INPUT_NAME_UNIT}    10s
    Clear Element Text    ${INPUT_NAME_UNIT}
    Input Text    ${INPUT_NAME_UNIT}    ${new_name}

#Phong
Click Add Phong Form
    Wait Until Element Is Visible    ${BUTTON_ADD_PHONG}    10s
    Click Element    ${BUTTON_ADD_PHONG}

Fill Phong Form
    [Arguments]    ${donvi}
    Wait Until Element Is Visible    ${DROPDOWN_NAME_UNIT}    10s
    Select From List By Label    ${DROPDOWN_NAME_UNIT}    ${donvi}
    Input Text    ${INPUT_NAME_PHONG}    Tài liệu demo

Click Cancel Phong
    Wait Until Element Is Visible    ${BUTTON_CANCEL_ADD_PHONG}    10s
    Scroll Element Into View    ${BUTTON_CANCEL_ADD_PHONG}
    Click Element    ${BUTTON_CANCEL_ADD_PHONG}
    Wait Until Location Is    ${url_phong}

Click Back To Phong
    Wait Until Element Is Visible    ${BUTTON_BACK_TO_PHONG}    10s
    Click Element    ${BUTTON_BACK_TO_PHONG}
    Wait Until Location Is    ${url_phong}

Click Save Phong
    Wait Until Element Is Visible    ${BUTTON_SAVE_PHONG}    10s
    Scroll Element Into View    ${BUTTON_SAVE_PHONG}
    Click Element    ${BUTTON_SAVE_PHONG}

Click Edit Phong
    Wait Until Element Is Visible    ${BUTTON_EDIT_PHONG}    10s
    Click Element                   ${BUTTON_EDIT_PHONG}
    
Edit Phong Form
    [Arguments]    ${new_name}
    Wait Until Element Is Visible    ${INPUT_NAME_PHONG}    10s
    Clear Element Text    ${INPUT_NAME_PHONG}
    Input Text    ${INPUT_NAME_PHONG}    ${new_name}

 Click Delete Phong
    Wait Until Element Is Visible    ${BUTTON_DELETE_PHONG}    10s
    Click Element                   ${BUTTON_DELETE_PHONG}

Click Update Phong
    Wait Until Element Is Visible    ${BUTTON_UPDATE_PHONG}    10s
    Scroll Element Into View    ${BUTTON_UPDATE_PHONG}
    Click Element               ${BUTTON_UPDATE_PHONG}

Filter Phong
    [Arguments]    ${phong}
    Wait Until Element Is Visible    ${DROPDOWN_PHONG}    10s
    Select From List By Label    ${DROPDOWN_PHONG}    ${phong}
    Wait Until Element Is Visible    xpath=//table    10s
    Duyet Tung Dong Chua Nhieu Tu Khoa    ${phong}

#index
Click Add Index Form
    Wait Until Element Is Visible    ${BUTTON_ADD_INDEX}    10s
    Click Element    ${BUTTON_ADD_INDEX}

Fill Index Form
    [Arguments]    ${donvi}    ${phong}
    Wait Until Element Is Visible    ${BUTTON_ADD_INDEX}    10s
    Click Element                    ${BUTTON_ADD_INDEX}
    Wait Until Element Is Visible    ${INPUT_ID_INDEX}    10s
    Input Text                       ${INPUT_ID_INDEX}    2

    Wait Until Element Is Visible    ${DROPDOWN_DONVI}    10s
    Select From List By Label    ${DROPDOWN_DONVI}    ${donvi}

    Wait Until Element Is Visible    ${DROPDOWN_PHONG}    10s
    Wait Until Element Contains    ${DROPDOWN_PHONG}    ${phong}    10s 
    Scroll Element Into View    ${DROPDOWN_PHONG}
    Select From List By Label    ${DROPDOWN_PHONG}    ${phong}

    Wait Until Element Is Visible    ${INPUT_NAME_INDEX}    10s
    Input Text                       ${INPUT_NAME_INDEX}    Tài liệu demo

Click Cancel Index
    Wait Until Element Is Visible    ${BUTTON_CANCEL_INDEX}    10s
    Scroll Element Into View    ${BUTTON_CANCEL_INDEX}
    Click Element    ${BUTTON_CANCEL_INDEX}
    Wait Until Location Is    ${url_index}

Click Back To Index
    Wait Until Element Is Visible    ${BUTTON_BACK_TO_INDEX}    10s
    Click Element    ${BUTTON_BACK_TO_INDEX}
    Wait Until Location Is    ${url_index}

Click Save Index
    Wait Until Element Is Visible    ${BUTTON_SAVE_PHONG}    10s
    Scroll Element Into View    ${BUTTON_SAVE_PHONG}
    Click Element    ${BUTTON_SAVE_PHONG}

Click Edit Index
    Wait Until Element Is Visible    ${BUTTON_EDIT_INDEX}    10s
    Click Element                   ${BUTTON_EDIT_INDEX}

Edit Index Form
    [Arguments]    ${new_name}
    Wait Until Element Is Visible    ${INPUT_NAME_INDEX}    10s
    Clear Element Text    ${INPUT_NAME_INDEX}
    Input Text    ${INPUT_NAME_INDEX}    ${new_name}

 Click Delete Index
    Wait Until Element Is Visible    ${BUTTON_DELETE_INDEX}    10s
    Click Element                   ${BUTTON_DELETE_INDEX}

Click Update Index
    Wait Until Element Is Visible    ${BUTTON_UPDATE_INDEX}    10s
    Scroll Element Into View    ${BUTTON_UPDATE_INDEX}
    Click Element               ${BUTTON_UPDATE_INDEX}

Filter Phong
    [Arguments]    ${phong}
    Wait Until Element Is Visible    ${DROPDOWN_PHONG}    10s
    Select From List By Label    ${DROPDOWN_PHONG}    ${phong}
    Wait Until Element Is Visible    xpath=//table    10s
    Duyet Tung Dong Chua Nhieu Tu Khoa    ${phong}

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
    Wait Until Element Is Visible    ${INPUT_ID_UNIT}    10s
    Scroll Element Into View    ${INPUT_ID_UNIT}
    Input Text                    ${INPUT_ID_UNIT}    01 

Add Phong but Name Phong Blank
    [Arguments]    ${donvi}
    Wait Until Element Is Visible    ${DROPDOWN_NAME_UNIT}    10s
    Select From List By Label    ${DROPDOWN_NAME_UNIT}    ${donvi}

Add Phong but Unit Blank
    Wait Until Element Is Visible    ${INPUT_NAME_PHONG}    10s
    Scroll Element Into View    ${INPUT_NAME_PHONG}
    Input Text    ${INPUT_NAME_PHONG}    tài liệu

Add Mucluc Unit Blank 
    Wait Until Element Is Visible    ${INPUT_ID_INDEX}    10s
    Input Text    ${INPUT_ID_INDEX}    01
    Scroll Element Into View    ${INPUT_NAME_INDEX}
    Input Text    ${INPUT_NAME_INDEX}    Hồ sơ demo

Add Mucluc but Name MucLuc Blank 
    [Arguments]    ${donvi}    ${phong}
    Wait Until Element Is Visible    ${INPUT_ID_INDEX}    10s
    Input Text    ${INPUT_ID_INDEX}    01
    Scroll Element Into View    ${INPUT_NAME_INDEX}
    Input Text    ${INPUT_NAME_INDEX}    Hồ sơ demo

    Wait Until Element Is Visible    ${DROPDOWN_DONVI}    10s
    Select From List By Label    ${DROPDOWN_DONVI}    ${donvi}

    Wait Until Element Is Visible    ${DROPDOWN_PHONG}    10s
    Wait Until Element Contains    ${DROPDOWN_PHONG}    ${phong}    10s 
    Select From List By Label    ${DROPDOWN_PHONG}    ${phong}

Verify Field Is Focused
    [Arguments]    ${locator}
    ${focused_element}=    Execute Javascript    return document.activeElement
    ${expected_element}=    Get WebElement    ${locator}
    Should Be Equal    ${focused_element}    ${expected_element}