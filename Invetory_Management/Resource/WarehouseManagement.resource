*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    DateTime
Library    XML
Library    Collections

*** Variables ***
# Warehouse Storage
${warehouse_storage}            xpath=//a[@href='/kho' and contains(@class, 'nav-item')]
${add_storage_button}           xpath=//a[@href="/kho/add" and contains(.,'Thêm kho mới')]
${storage_code_input}           xpath=//input[@id='ma_kho']
${storage_name_input}           xpath=//input[@id='ten_kho']
${storage_address_input}        xpath=//input[@id='dia_chi']
${storage_area_input}           xpath=//input[@id='dien_tich']
${storage_capacity_input}       xpath=//input[@id='suc_chua']
${save_button}                  xpath=//button[@type='submit' and contains(.,'Lưu kho')]
${cancel_button}                xpath=//a[@href="/kho" and contains(@class, 'btn btn-secondary')]
${back_button}                  xpath=//a[@href="/kho" and contains(@class, 'btn btn-outline-secondary')]

${edit_icon}                    xpath=//a[@href="/kho/edit/4" and contains(@class, 'btn btn-outline-primary btn-sm')]
${storage_name_input}           xpath=//input[@id='ten_kho' and @name='ten_kho']
${update_button}                xpath=//button[@type='submit' and contains(.,'Cập nhật')]
${back_update_btn}              xpath=//a[@href="/kho" and contains(@class, 'btn btn-secondary')]

${storage_delete_button}        xpath=//button[@title='Xóa' and @data-item-name='Kho F - Lưu trữ phụ']
${storage_export_button}        xpath=//a[@href="/reports/export/kho" and contains(@class, 'btn btn-success')]
${download_dir}              C:/Users/ADMIN/Downloads
${file_prefix}              Bao_cao_kho_luu_tru

#Rack
${rack_storage}                xpath=//a[@href='/gia' and contains(@class, 'nav-item')]
${add_rack_button}             xpath=//a[@href="/gia/add" and contains(.,'Thêm giá mới')]
${rack_code_input}             xpath=//input[@id='ma_gia']
${rack_name_input}             xpath=//input[@id='ten_gia']
${rack_warehouse_select}       xpath=//select[@id='kho_id']
${rack_floor_input}            xpath=//input[@id='so_tang']
${rack_size_input}             xpath=//input[@id='kich_thuoc']
${rack_save_button}            xpath=//button[@type='submit' and contains(.,'Lưu giá kệ')]
${rack_cancel_button}          xpath=//a[@href="/gia" and contains(@class, 'btn btn-secondary')]
${back_rack_button}            xpath=//a[@href="/gia" and contains(@class, 'btn btn-outline-secondary')]

${rack_delete_button}          xpath=//button[@title='Xóa' and @data-item-name='Giá 1 - Kho D - Chi nhánh']
${rack_export_button}          xpath=//a[@href="/reports/export/gia" and contains(@class, 'btn btn-success')]
${file_rack_prefix}            Bao_cao_gia_ke

${edit_rack_icon}              xpath=//a[@href="/gia/edit/10" and contains(@class, 'btn btn-outline-primary')]
${update_rack_button}          xpath=//button[@type='submit' and contains(.,'Lưu thay đổi')]
${cancel_update_btn}           xpath=//a[@href="/gia" and contains(@class, 'btn btn-secondary')]
${back_update_rack_btn}        xpath=//a[@href="/gia" and contains(@class, 'btn btn-secondary')]
${view_boxes_button_0}         xpath=//a[@href="/hop?gia_id=10" and contains(@class, 'btn btn-outline-info btn-sm')]
${view_container_button}       xpath=//a[@href="/kho/edit/4" and contains(@class, 'btn btn-outline-secondary btn-sm')]

#Storage Box
${storage_box}                 xpath=//a[@href='/hop' and contains(@class, 'nav-item')]
${add_box_button}              xpath=//a[@href="/hop/add" and contains(.,'Thêm hộp mới')]
${box_code_input}              xpath=//input[@id='ma_hop']
${box_name_input}              xpath=//input[@id='ten_hop']
${box_rack_select}             xpath=//select[@id='gia_id']
${box_save_button}             xpath=//button[@type='submit' and contains(.,'Lưu hộp')]
${box_cancel_button}           xpath=//a[@href="/hop" and contains(@class, 'btn btn-secondary')]
${back_box_button}             xpath=//a[@href="/hop" and contains(@class, 'btn btn-outline-secondary')]

${box_export_button}           xpath=//a[@href="/reports/export/hop" and contains(@class, 'btn btn-success')]
${file_box_prefix}             Bao_cao_hop_luu_tru

${edit_box_icon}               xpath=//a[@href="/hop/edit/4" and contains(@class, 'btn btn-outline-primary btn-sm')]
${update_box_button}           xpath=//button[@type='submit' and contains(.,'Lưu thay đổi')]
${cancel_update_box_btn}      xpath=//a[@href="/hop" and contains(@class, 'btn btn-secondary')]
${back_update_box_btn}        xpath=//a[@href="/hop" and contains(@class, 'btn btn-secondary')]
${view_container_button}       xpath=//a[@href="/kho/edit/4" and contains(@class, 'btn btn-outline-secondary btn-sm')]

*** Keywords ***
# Warehouse Storage
Navigate to Warehouse Storage
    Click Element    ${warehouse_storage}
    Wait Until Page Contains    Quản lý Kho lưu trữ
Click Add Storage Button
    Click Element    ${add_storage_button}
    Wait Until Page Contains    Thêm kho mới
Add Storage
    [Arguments]    ${storage_code}    ${storage_name}    ${storage_address}    ${storage_area}    ${storage_capacity}
    Input Text    ${storage_code_input}    ${storage_code}
    Input Text    ${storage_name_input}    ${storage_name}
    Input Text    ${storage_address_input}    ${storage_address}
    Input Text    ${storage_area_input}    ${storage_area}
    Input Text    ${storage_capacity_input}    ${storage_capacity}
    Scroll Element Into View    locator=${save_button}
Click Save Button
    Click Button    ${save_button}
Verify Field Is Focused
    [Arguments]    ${locator}
    ${focused_element}=    Execute Javascript    return document.activeElement
    ${expected_element}=    Get WebElement    ${locator}
    Should Be Equal    ${focused_element}    ${expected_element}
Click Cancel Button
    Click Element    ${cancel_button}
    Wait Until Page Contains    Danh sách kho lưu trữ
Click Back Button
    Scroll Element Into View    locator=${back_button}
    Click Element    ${back_button}
    Wait Until Page Contains    Danh sách kho lưu trữ
Click Edit Icon
    Scroll Element Into View    locator=${edit_icon}
    Click Element    ${edit_icon}
    Wait Until Page Contains    Sửa kho
Update Storage Name
    [Arguments]    ${new_storage_name}
    Input Text    ${storage_name_input}    ${new_storage_name}
    Scroll Element Into View    locator=${update_button}
    Click Button    ${update_button}
Update Storage Area
    [Arguments]    ${new_storage_area}
    Input Text    ${storage_area_input}    ${new_storage_area}
    Scroll Element Into View    locator=${update_button}
    Click Button    ${update_button}
Update Storage Capacity
    [Arguments]    ${new_storage_capacity}
    Input Text    ${storage_capacity_input}    ${new_storage_capacity}
Cancel Update
    Scroll Element Into View    locator=${back_update_btn}
    Click Element    ${back_update_btn}
    Wait Until Page Contains    Danh sách kho lưu trữ
Delete Storage
    Scroll Element Into View    locator=${storage_delete_button}
    Click Button    ${storage_delete_button}
Export Excel - Warehouse Storage Report
    Click Element    ${storage_export_button}
    Sleep    5s    # Chờ file tải về
    ${found}=    Set Variable    False
    FOR    ${i}    IN RANGE    15
        ${files}=    List Files In Directory    ${download_dir}
        FOR    ${file}    IN    @{files}
            Run Keyword If    '${file_prefix}' in '${file}'    Set Variable    ${found}    True
        END
        Run Keyword If    ${found}    Exit For Loop
        Sleep    1s
    END

#Rack
Open Rack Management
    Click Element    ${rack_storage}
    Wait Until Page Contains    Quản lý Giá kệ
Click Add Rack Button 
    Click Element    ${add_rack_button}
    Wait Until Page Contains    Thêm giá kệ mới
Add Rack
    [Arguments]    ${rack_code}    ${rack_name}    ${rack_warehouse}    ${rack_floor}    ${rack_size}
    Input Text    ${rack_code_input}    ${rack_code}
    Input Text    ${rack_name_input}    ${rack_name}
    Run Keyword If    '${rack_warehouse}' != ''    Select From List By Label    ${rack_warehouse_select}    ${rack_warehouse}
    Input Text    ${rack_floor_input}    ${rack_floor}
    Input Text    ${rack_size_input}    ${rack_size}
Click Save Rack Button
    Scroll Element Into View    locator=${rack_save_button}
    Click Button    ${rack_save_button}
Click Cancel Rack Button
    Scroll Element Into View    locator=${rack_cancel_button}
    Click Element    ${rack_cancel_button}
    Wait Until Page Contains    Danh sách giá kệ
Click Back Rack Button
    Scroll Element Into View    locator=${back_rack_button}
    Click Element    ${back_rack_button}
    Wait Until Page Contains    Danh sách giá kệ
Delete Rack
    Scroll Element Into View    locator=${rack_delete_button}
    Click Button    ${rack_delete_button}
Export Excel - Rack Report
    Click Element    ${rack_export_button}
    Sleep    5s    # Chờ file tải về
    ${found}=    Set Variable    False
    FOR    ${i}    IN RANGE    15
        ${files}=    List Files In Directory    ${download_dir}
        FOR    ${file}    IN    @{files}
            Run Keyword If    '${file_rack_prefix}' in '${file}'    Set Variable    ${found}    True
        END
        Run Keyword If    ${found}    Exit For Loop
        Sleep    1s
    END
Click Edit Rack Icon
    Scroll Element Into View    locator=${edit_rack_icon}
    Click Element    ${edit_rack_icon}
    Wait Until Page Contains    Chỉnh sửa Giá kệ
Update Rack Name
    [Arguments]    ${new_rack_name}
    Input Text    ${rack_name_input}    ${new_rack_name}
    Scroll Element Into View    locator=${update_rack_button}
Click Update Rack Button
    Click Button    ${update_rack_button}
Click Cancel Update Button
    Click Button    ${cancel_update_btn}
Click Back Rack Button - Update
    Scroll Element Into View    locator=${back_update_rack_btn}
    Click Element    ${back_update_rack_btn}
    Wait Until Page Contains    Danh sách giá kệ
Update Rack Floor
    [Arguments]    ${new_rack_floor}
    Input Text    ${rack_floor_input}    ${new_rack_floor}
    Scroll Element Into View    locator=${update_rack_button}

View Containing Warehouse
    Scroll Element Into View    locator=${view_container_button}
    Click Element    ${view_container_button}

Click Edit Rack Icon - 1
    [Arguments]    ${rack_id}
    ${edit_locator}=    Set Variable    xpath=//a[@href="/gia/edit/${rack_id}" and contains(@class,'btn btn-outline-primary')]
    Scroll Element Into View    locator=${edit_locator}
    Click Element    ${edit_locator}
    Wait Until Page Contains    Chỉnh sửa Giá kệ
View Boxes In Rack - 1
    [Arguments]    ${rack_id}    ${expected_count}
    # Tạo locator nút “Xem hộp” dựa trên rack_id
    ${view_boxes_locator}=    Set Variable    xpath=//a[@href="/hop?gia_id=${rack_id}" and contains(@class,'btn btn-outline-info btn-sm')]
    Scroll Element Into View    locator=${view_boxes_locator}
    Click Element    ${view_boxes_locator}
    Wait Until Page Contains    Quản lý Hộp lưu trữ
    ${boxes}=    Get Element Count    xpath=//table/tbody/tr
    Run Keyword If    ${boxes}==0    Log    "Rack ${rack_id} có 0 hộp"
    Run Keyword If    ${boxes}!=0    Should Be Equal As Integers    ${boxes}    ${expected_count}

Verify Box Count In List - 1
    [Arguments]    ${expected_count}
    ${rows}=    Get Element Count    xpath=//table//tbody/tr
    Should Be Equal As Integers    ${rows}    ${expected_count}

# Storage Box
Open Storage Box Management
    Click Element    ${storage_box}
    Wait Until Page Contains    Quản lý Hộp lưu trữ
Click Add Box Button
    Click Element    ${add_box_button}
    Wait Until Page Contains    Thêm hộp lưu trữ mới
Add Box
    [Arguments]    ${box_code}    ${box_name}    ${box_rack}
    Input Text    ${box_code_input}    ${box_code}
    Input Text    ${box_name_input}    ${box_name}
    Run Keyword If    '${box_rack}' != ''    Select From List By Label    ${box_rack_select}    ${box_rack}
Click Box Save Button
    Scroll Element Into View    locator=${box_save_button}
    Click Button    ${box_save_button}
Click Box Cancel Button
    Scroll Element Into View    locator=${box_cancel_button}
    Click Element    ${box_cancel_button}
    Wait Until Page Contains    Quản lý Hộp lưu trữ
Click Back Box Button
    Scroll Element Into View    locator=${back_box_button}
    Click Element    ${back_box_button}
    Wait Until Page Contains    Quản lý Hộp lưu trữ
Delete Box
    [Arguments]    ${box_id}
    Scroll Element Into View    xpath=//form[@method="POST" and @action="/hop/delete/${box_id}" and contains(@class,'d-inline')]
    Click Button    xpath=//form[@method="POST" and @action="/hop/delete/${box_id}" and contains(@class,'d-inline')]//button[contains(@class,'btn-outline-danger')]
Export Excel - Box Report
    Click Element    ${box_export_button}
    ${found}=    Set Variable    False
    FOR    ${i}    IN RANGE    15
        ${files}=    List Files In Directory    ${download_dir}
        FOR    ${file}    IN    @{files}
            Run Keyword If    '${file_box_prefix}' in '${file}'    Set Variable    ${found}    True
        END
        Run Keyword If    ${found}    Exit For Loop
        Sleep    1s
    END
    Should Be True    ${found}    File Excel báo cáo Hộp lưu trữ không được tải xuống

Click Edit Box Icon
    [Arguments]    ${box_id}
    Scroll Element Into View    xpath=//a[@href='/hop/edit/${box_id}' and contains(@class,'btn btn-outline-primary btn-sm')]
    Click Element    xpath=//a[@href='/hop/edit/${box_id}' and contains(@class,'btn btn-outline-primary btn-sm')]
    Wait Until Page Contains    Chỉnh sửa Hộp lưu trữ
Update Box Name
    [Arguments]    ${new_box_name}
    Input Text    ${box_name_input}    ${new_box_name}
    Scroll Element Into View    locator=${update_box_button}
    Click Button    ${update_box_button}
Click Box Cancel Update Button
    Scroll Element Into View    locator=${cancel_update_box_btn}
    Click Element    ${cancel_update_box_btn}
    Wait Until Page Contains    Quản lý Hộp lưu trữ
Update Empty Box Rack
    Select From List By Label    ${box_rack_select}    -- Chọn giá --
    Scroll Element Into View    locator=${update_box_button}
    Click Button    ${update_box_button}
Back Box Button - Update
    Scroll Element Into View    locator=${back_update_box_btn}
    Click Element    ${back_update_box_btn}

Click Related Action
    [Arguments]    ${action_text}
    Wait Until Element Is Visible    xpath=//a[contains(normalize-space(.), '${action_text}')]    10s
    Scroll Element Into View    xpath=//a[contains(normalize-space(.), '${action_text}')]
    Click Element    xpath=//a[contains(normalize-space(.), '${action_text}')]


