# login
username_xpath = '//*[@id="username"]'
password_xpath = '//*[@id="password"]'
loginbtn_xpath = '//button[@type="submit" and @class="btn-login"]'

# Logout
logout = '//a[@href="/logout" and contains(@class,"btn-outline-danger")]'
logout_menu = '//a[@href="/logout" and contains(@class,"nav-item")]'

input_id_unit = '//input[@id="ma_don_vi"]'
input_name_unit = '//input[@id="ten_don_vi"]'
input_name_phong = '//input[@id="ten_phong"]'
input_id_index = '//input[@id="ma_muc_luc"]'
input_name_index = '//input[@id="ten_muc_luc"]'

dropdown_hienthi = '//select[@id="per-page-select"]'
dropdown_name_unit = '//select[@id="don_vi_id"]'
dropdown_phong = '//select[@id="don-vi-filter"]'
dropdown_donvi = '//select[@id="don_vi_select"]'
dropdown_phongg = '//select[@id="phong_select"]'
dropdown_donvip = '//select[@id="don-vi-filter"]'
dropdown_dvphong = '//select[@id="phong-filter"]'
dropdown_kho = '//select[@id="kho_select"]'
dropdown_gia = '//select[@id="gia_select"]'

# Sidebar
sidebar = '//button[@id="sidebarToggle"]'
ql_to_chuc = '//div[@class="nav-group-header"]/span[normalize-space()="Quản lý tổ chức"]'
ql_khoo = '//div[@class="nav-group-header"]/span[normalize-space()="Quản lý kho"]'
search_report = '//div[@class="nav-group-header"]/span[normalize-space()="Tìm kiếm &amp; Báo cáo"]'
qt_he_thong = '//div[@class="nav-group-header"]/span[normalize-space()="Quản trị hệ thống"]'
ca_nhan = '//div[@class="nav-group-header"]/span[normalize-space()="Cài đặt cá nhân"]'

# Quick Add
quick_add_new_unit = '//a[@href="/don-vi/add" and contains(@class,"btn-primary")]'
quick_add_phong = '//a[@href="/phong/add" and contains(@class,"btn-primary")]'
quick_add_index = '//a[@href="/muc-luc/add" and contains(@class,"btn-primary")]'
quick_add_warehouse= '//a[@href="/kho/add" and contains(@class,"btn-success")]'
quick_add_shelf = '//a[@href="/gia/add" and contains(@class,"btn-success")]'
quick_add_box = '//a[@href="/hop/add" and contains(@class,"btn-success")]'
quick_add_document_search = '//a[@href="/search" and contains(@class,"btn-outline-primary")]'
quick_add_see_report = '//a[@href="/reports" and contains(@class,"btn-outline-success")]'

# Menu Items
item_unit = '//a[@href="/don-vi" and contains(@class,"nav-item")]'
item_phong = '//a[@href="/phong" and contains(@class,"nav-item")]'
item_index = '//a[@href="/muc-luc" and contains(@class,"nav-item")]'
item_warwhouse =  '//a[@href="/kho" and contains(@class,"nav-item")]'
item_shelf = '//a[@href="/gia" and contains(@class,"nav-item")]'
item_box = '//a[@href="/hop" and contains(@class,"nav-item")]'
item_search = '//a[@href="/search" and contains(@class,"nav-item")]'
item_report = '//a[@href="/report" and contains(@class,"nav-item")]'
item_admin_page = '//a[@href="/admin" and contains(@class,"nav-item")]'
item_account_management = '//a[@href="/admin/users" and contains(@class,"nav-item")]'
item_system_log = '//a[@href="/admin/logs" and contains(@class,"nav-item")]'
item_interface = '//a[@href="/admin/theme-settings" and contains(@class,"nav-item")]'

# Button
button_add_unit = '//a[@href="/don-vi/add" and contains(@class,"btn-primary")]'
button_save_add_unit = '//button[@type="submit" and contains(@class,"btn-primary")]'
button_cancel_add_unit = '//a[contains(@class,"btn-secondary") and contains(@class,"me-md-2")]'
button_back_to_list = '//a[@href="/don-vi" and contains(@class,"btn-secondary")]'
button_edit_unit = '//a[@href="/don-vi/edit/10" and contains(@class,"btn-outline-primary")]'
button_delete_unit = '//button[@type="submit" and contains(@class,"btn-outline-danger")]'
button_update_unit = '//button[@type="submit" and contains(@class,"btn-primary")]'

button_add_phong = '//a[@href="/phong/add" and contains(@class,"btn-primary")]'
button_back_to_phong = '//a[@href="/phong" and contains(@class,"btn-outline-secondary")]'
button_cancel_add_phong = '//a[@href="/phong" and contains(@class,"btn-secondary")]'
button_save_phong = '//button[@type="submit" and contains(@class, "btn-primary")]'
button_edit_phong = '//a[@href="/phong/edit/5" and contains(@class,"btn-outline-primary")]'
button_update_phong = '//button[@type="submit" and contains(@class, "btn-primary")]'
button_delete_phong = '//button[@type="submit" and contains(@class, "btn-outline-danger")]'

button_add_index = '//a[@href="/muc-luc/add" and contains(@class,"btn-primary")]'
button_cancel_index = '//a[@href="/muc-luc" and contains(@class,"btn-secondary")]'
button_back_to_index = '//a[@href="/muc-luc" and contains(@class,"btn-outline-secondary")]'
button_save_index = '//button[@type="submit" and contains(@class, "btn-primary")]'
button_edit_index = '//a[@href="/muc-luc/edit/5" and contains(@class,"btn-outline-primary")]'
button_update_index = '//button[@type="submit" and contains(@class, "btn-primary")]'
button_delete_index = '//button[@type="submit" and contains(@class, "btn-outline-danger")]'

button_come_back = '//a[@href="/" and contains(@class,"btn-outline-secondary")]'
button_search= '//button[@type="submit" and contains(@class,"btn btn-primary")]'
button_clear_filter = '//button[@type="button" and contains(@class,"btn-secondary")]'

search_textbox = '//input[@id="keyword"]'

#message
message_unit = '//div[@class="alert alert-success alert-dismissible fade show"]'
mess_invalid_feedback_unit = '//div[@class="invalid-feedback"]'
mess_invalid_feedback_phong = '//div[@class="invalid-feedback d-block"]'

#page
page_title = '//div[@class="page-title"]'

