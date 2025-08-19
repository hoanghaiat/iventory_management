# locators.py
# ===================== Admin Page Elements =====================
admin_page = "xpath=//a[@href='/admin']"
card_user_detail = "xpath=//a[@href='/admin/users' and contains(@class,'card-footer')]"
card_unit_detail = "xpath=//a[@href='/don-vi' and contains(@class,'card-footer')]"
card_storage_detail = "xpath=//a[@href='/phong' and contains(@class,'card-footer')]"
card_catalog_detail = "xpath=//a[@href='/muc-luc' and contains(@class,'card-footer')]"
link_user_management = "xpath=//a[@href='/admin/users' and contains(@class,'list-group-item')]"
link_system_logs = "xpath=//a[@href='/admin/logs' and contains(@class,'list-group-item')]"

# ===================== Account Management Elements =====================
account_management_page = "xpath=//a[@href='/admin/users']"
add_acc_btn = "xpath=//a[@href='/admin/users/add' and contains(@class,'btn btn-primary')]"
addacc_username_xpath = "xpath=//input[@id='username' and contains(@class,'form-control-lg')]"
addacc_email_xpath = "xpath=//input[@id='email' and contains(@class,'form-control-lg')]"
addacc_password_xpath = "xpath=//input[@id='password' and contains(@class,'form-control-lg')]"
addacc_confirm_password_xpath = "xpath=//input[@id='confirm_password' and contains(@class,'form-control-lg')]"
addacc_submit_btn_xpath = "xpath=//input[@id='submit' and contains(@class,'btn-success')]"

view_account_details = "xpath=//a[@href='/admin/users/7/permissions' and contains(@class,'btn btn-outline-info')]"
dashboard_link = "xpath=//a[@href='/admin' and contains(@class,'btn btn-outline-secondary')]"
select_per_page = "xpath=//*[@id='per-page-select']"

edit_icon = "xpath=//a[@href='/admin/users/11/edit' and contains(@class,'btn btn-outline-primary')]"
editacc_email_xpath = "xpath=//input[@id='email' and contains(@class,'form-control')]"
name_input_xpath = "xpath=//input[@id='username' and contains(@class,'form-control')]"
acc_update_button = "xpath=//input[@id='submit' and contains(@class,'btn btn-primary btn-lg')]"
acc_cancel_button = "xpath=//a[@href='/admin/users' and contains(@class,'btn btn-outline-secondary btn-lg')]"
view_permission_button = "xpath=//a[@href='/admin/users/11/permissions' and contains(@class,'btn btn-outline-info btn-lg')]"
edit_permission_button = "xpath=//a[@href='/admin/users/11/edit' and contains(@class,'btn btn-primary')]"

key_icon = "xpath=//a[@href='/admin/users/11/change-password' and contains(@class,'btn btn-outline-warning')]"
new_password_input = "xpath=//input[@id='new_password' and contains(@class,'form-control')]"
confirm_new_password_input = "xpath=//input[@id='confirm_password' and contains(@class,'form-control')]"
confirm_button = "xpath=//input[@id='submit' and contains(@class,'btn btn-warning')]"
cancelbtn = "xpath=//a[@href='/admin/users' and contains(@class,'btn btn-secondary')]"
acc_to_change = "user4"

# ===================== System Log Page Elements =====================
system_log_page = "xpath=//a[@href='/admin/logs' and contains(@class,'nav-item')]"
log_type_dropdown = "xpath=//select[@id='log_type' and contains(@class,'form-select form-select-sm')]"
filter_button = "xpath=//button[@type='submit' and contains(@class,'btn btn-primary btn-sm')]"
row_dropdown = "xpath=//select[@name='per_page' and contains(@class,'form-select form-select-sm')]"
back_to_admin_page = "xpath=//a[@href='/admin' and contains(@class,'btn btn-outline-secondary me-2')]"
refresh_logs_button = "xpath=//button[@class='btn btn-outline-primary' and contains(.,'Làm mới')]"

# =========================
# Warehouse Storage
# =========================
warehouse_storage = "xpath=//a[@href='/kho' and contains(@class, 'nav-item')]"
add_storage_button = "xpath=//a[@href='/kho/add' and contains(.,'Thêm kho mới')]"
storage_code_input = "xpath=//input[@id='ma_kho']"
storage_name_input = "xpath=//input[@id='ten_kho']"
storage_address_input = "xpath=//input[@id='dia_chi']"
storage_area_input = "xpath=//input[@id='dien_tich']"
storage_capacity_input = "xpath=//input[@id='suc_chua']"
save_button = "xpath=//button[@type='submit' and contains(.,'Lưu kho')]"
cancel_button = "xpath=//a[@href='/kho' and contains(@class, 'btn btn-secondary')]"
back_button = "xpath=//a[@href='/kho' and contains(@class, 'btn btn-outline-secondary')]"

wh_edit_icon = "xpath=//a[@href='/kho/edit/4' and contains(@class, 'btn btn-outline-primary btn-sm')]"
storage_name_input_update = "xpath=//input[@id='ten_kho' and @name='ten_kho']"
update_button = "xpath=//button[@type='submit' and contains(.,'Cập nhật')]"
back_update_btn = "xpath=//a[@href='/kho' and contains(@class, 'btn btn-secondary')]"

storage_delete_button = "xpath=//button[@title='Xóa' and @data-item-name='Kho F - Lưu trữ phụ']"
storage_export_button = "xpath=//a[@href='/reports/export/kho' and contains(@class, 'btn btn-success')]"
download_dir = r"C:/Users/ADMIN/Downloads"
file_prefix = "Bao_cao_kho_luu_tru"

# =========================
# Rack
# =========================
rack_storage = "xpath=//a[@href='/gia' and contains(@class, 'nav-item')]"
add_rack_button = "xpath=//a[@href='/gia/add' and contains(.,'Thêm giá mới')]"
rack_code_input = "xpath=//input[@id='ma_gia']"
rack_name_input = "xpath=//input[@id='ten_gia']"
rack_warehouse_select = "xpath=//select[@id='kho_id']"
rack_floor_input = "xpath=//input[@id='so_tang']"
rack_size_input = "xpath=//input[@id='kich_thuoc']"
rack_save_button = "xpath=//button[@type='submit' and contains(.,'Lưu giá kệ')]"
rack_cancel_button = "xpath=//a[@href='/gia' and contains(@class, 'btn btn-secondary')]"
back_rack_button = "xpath=//a[@href='/gia' and contains(@class, 'btn btn-outline-secondary')]"

rack_delete_button = "xpath=//button[@title='Xóa' and @data-item-name='Giá 1 - Kho D - Chi nhánh']"
rack_export_button = "xpath=//a[@href='/reports/export/gia' and contains(@class, 'btn btn-success')]"
file_rack_prefix = "Bao_cao_gia_ke"

edit_rack_icon = "xpath=//a[@href='/gia/edit/11' and contains(@class, 'btn btn-outline-primary')]"
update_rack_button = "xpath=//button[@type='submit' and contains(.,'Lưu thay đổi')]"
cancel_update_btn = "xpath=//a[@href='/gia' and contains(@class, 'btn btn-secondary')]"
back_update_rack_btn = "xpath=//a[@href='/gia' and contains(@class, 'btn btn-secondary')]"
view_boxes_button_0 = "xpath=//a[@href='/hop?gia_id=10' and contains(@class, 'btn btn-outline-info btn-sm')]"
view_container_button_rack = "xpath=//a[@href='/kho/edit/4' and contains(@class, 'btn btn-outline-secondary btn-sm')]"

# =========================
# Storage Box
# =========================
storage_box = "xpath=//a[@href='/hop' and contains(@class, 'nav-item')]"
add_box_button = "xpath=//a[@href='/hop/add' and contains(.,'Thêm hộp mới')]"
box_code_input = "xpath=//input[@id='ma_hop']"
box_name_input = "xpath=//input[@id='ten_hop']"
box_rack_select = "xpath=//select[@id='gia_id']"
box_save_button = "xpath=//button[@type='submit' and contains(.,'Lưu hộp')]"
box_cancel_button = "xpath=//a[@href='/hop' and contains(@class, 'btn btn-secondary')]"
back_box_button = "xpath=//a[@href='/hop' and contains(@class, 'btn btn-outline-secondary')]"

box_export_button = "xpath=//a[@href='/reports/export/hop' and contains(@class, 'btn btn-success')]"
file_box_prefix = "Bao_cao_hop_luu_tru"

edit_box_icon = "xpath=//a[@href='/hop/edit/4' and contains(@class, 'btn btn-outline-primary btn-sm')]"
update_box_button = "xpath=//button[@type='submit' and contains(.,'Lưu thay đổi')]"
cancel_update_box_btn = "xpath=//a[@href='/hop' and contains(@class, 'btn btn-secondary')]"
back_update_box_btn = "xpath=//a[@href='/hop' and contains(@class, 'btn btn-secondary')]"
view_container_button_box = "xpath=//a[@href='/kho/edit/4' and contains(@class, 'btn btn-outline-secondary btn-sm')]"
