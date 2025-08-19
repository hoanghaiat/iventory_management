
URL = "https://kholuutru.minds.vn/"
USERNAME = "admin_qc_automation"
PASSWORD = "Qc@12345"

TimeOut = "10s"

# Login
username_xpath = "//*[@id='username']"
password_xpath = "//*[@id='password']"
loginbtn_xpath = "//*[@id='loginBtn']"

Input_ID_Unit = "//input[@id='ma_don_vi']"
Input_Name_Unit = "//input[@id='ten_don_vi']"
Input_Name_Phong = "//input[@id='ten_phong']"
Input_ID_Mucluc = "//input[@id='ma_muc_luc']"
Input_Name_Mucluc = "//input[@id='ten_muc_luc']"

Dropdown_HienThi = "//select[@id='per-page-select']"
Dropdown_Name_Unit = "//select[@id='don_vi_id']"
Dropdown_Phong = "//select[@id='don-vi-filter']"
Dropdown_DonVi = "//select[@id='don_vi_select']"
Dropdown_Phong = "//select[@id='phong_select']"
Dropdown_DonViP = "//select[@id='don-vi-filter']"
Dropdown_DVPhong = "//select[@id='phong-filter']"
Dropdown_Kho = "//select[@id='kho_select']"
Dropdown_Gia = "//select[@id='gia_select']"


# Sidebar
SideBar = "//button[@id='sidebarToggle']"
QLKho = "//span[text()='Quản lý Kho']"
QLToChuc = "//div[@class='nav-group-header']/span[normalize-space()='Quản lý tổ chức']"
QLKho2 = "//div[@class='nav-group-header']/span[normalize-space()='Quản lý kho']"
Search_Report = "//div[@class='nav-group-header']/span[normalize-space()='Tìm kiếm &amp; Báo cáo']"
QTHeThong = "//div[@class='nav-group-header']/span[normalize-space()='Quản trị hệ thống']"
CaNhan = "//div[@class='nav-group-header']/span[normalize-space()='Cài đặt cá nhân']"

# Quick Add
Quick_Add_New_Unit_xpath = "//a[@href='/don-vi/add' and contains(@class,'btn-primary')]"
Quick_Add_Storage_Room = "//a[@href='/phong/add' and contains(@class,'btn-primary')]"
Quick_Add_Profile_Table_Contents = "//a[@href='/muc-luc/add' and contains(@class,'btn-primary')]"
Quick_Add_Warehouse = "//a[@href='/kho/add' and contains(@class,'btn-success')]"
Quick_Add_shelf = "//a[@href='/gia/add' and contains(@class,'btn-success')]"
Quick_Add_Box = "//a[@href='/hop/add' and contains(@class,'btn-success')]"
Quick_Add_Document_Search = "//a[@href='/search' and contains(@class,'btn-outline-primary')]"
Quick_Add_See_Report = "//a[@href='/reports' and contains(@class,'btn-outline-success')]"

# Logout
Logout = "//a[@href='/logout' and contains(@class,'btn-outline-danger')]"
Logout_Menu = "//a[@href='/logout' and contains(@class,'nav-item')]"


# Menu Items
Item_Unit = "//a[contains(@href,'/don-vi') and contains(normalize-space(.),'Đơn vị')]"
Item_Storage_Room = "//a[contains(@href,'/phong') and contains(normalize-space(.),'Phông lưu trữ')]"
Item_Profile_Table_Contents = "//a[contains(@href,'/muc-luc') and contains(normalize-space(.),'Mục lục hồ sơ')]"
Item_Warehouse = "//a[contains(@href,'/kho') and contains(normalize-space(.),'Kho lưu trữ')]"
Item_shelf = "//a[contains(@href,'/gia') and contains(normalize-space(.),'Giá kệ')]"
Item_Box = "//a[contains(@href,'/hop') and contains(normalize-space(.),'Hộp lưu trữ')]"
Item_Search = "//a[contains(@href,'/search') and contains(normalize-space(.),'Tìm kiếm')]"
Item_Report = "//a[contains(@href,'/report') and contains(normalize-space(.),'Báo cáo')]"
Item_Admin_Page = "//a[contains(@href,'/admin') and contains(normalize-space(.),'Trang quản trị')]"
Item_Account_Management = "//a[contains(@href,'/admin/users') and contains(normalize-space(.),'Quản lý tài khoản')]"
Item_System_Log = "//a[contains(@href,'/admin/logs') and contains(normalize-space(.),'Nhật ký hệ thống')]"
Item_Interface = "//a[contains(@href,'/theme-settings') and contains(normalize-space(.),'Giao diện')]"

# locators_buttons.py

Button_Add_Unit = "//a[contains(@href, '/don-vi/add') and contains(normalize-space(.), 'Thêm đơn vị mới')]"
Button_Cancel_Add_Unit = "//a[contains(@class, 'btn-secondary') and contains(normalize-space(.), 'Hủy bỏ')]"
Button_Save_Add_Unit = "//button[@type='submit' and contains(@class, 'btn-primary') and contains(normalize-space(.), 'Lưu đơn vị')]"
Button_Back_To_List = "//a[contains(@class, 'btn-secondary') and contains(normalize-space(.), 'Quay lại danh sách')]"
Button_Edit_Unit = "//a[contains(@href, '/don-vi/edit/7') and contains(@class, 'btn-outline-primary') and @title='Chỉnh sửa']"
Button_Update_Unit = "//button[@type='submit' and contains(@class, 'btn-primary') and contains(normalize-space(.), 'Cập nhật đơn vị')]"
Button_Delete_Unit = "//button[@type='submit' and contains(@class, 'btn-outline-danger') and @title='Xóa']"

Button_Add_Storage = "//a[contains(@href, '/phong/add') and contains(normalize-space(.), 'Thêm phông mới')]"
Button_Back_To_storage = "//a[contains(@href, '/phong') and contains(@class, 'btn-outline-secondary') and contains(normalize-space(.), 'Quay lại')]"
Button_Cancel_Add_Phong = "//a[contains(@href, '/phong') and contains(@class, 'btn-secondary') and contains(normalize-space(.), 'Hủy bỏ')]"
Button_Save_Phong = "//button[@type='submit' and contains(., 'Lưu phông lưu trữ')]"
Button_Edit_Phong = "//a[@title='Chỉnh sửa phông']"
Button_Update_Phong = "//button[contains(@class,'btn-primary') and normalize-space()='Cập nhật phông']"
Button_Delete_Phong = "//button[@type='submit' and contains(@class, 'btn-outline-danger') and @title='Xóa phông']"

Button_Add_Mucluc = "//a[contains(@href, '/muc-luc/add') and contains(normalize-space(.), 'Thêm mục lục mới')]"
Button_Cancel_Mucluc = "//a[contains(@href, '/muc-luc') and contains(@class, 'btn-secondary') and contains(normalize-space(.), 'Hủy bỏ')]"
Button_Back_To_Mucluc = "//a[contains(@href, '/muc-luc') and contains(@class, 'btn-outline-secondary') and contains(normalize-space(.), 'Quay lại')]"
Button_Save_Mucluc = "//button[@type='submit' and contains(., 'Lưu mục lục')]"
Button_Edit_Mucluc = "//a[@title='Chỉnh sửa']"
Button_Update_Mucluc = "//button[contains(@class,'btn-primary') and normalize-space()='Cập nhật mục lục']"
Button_Delete_Mucluc = "//button[@type='submit' and contains(@class, 'btn-outline-danger') and @title='Xóa']"

Button_Come_Back = "//a[contains(@class, 'btn-outline-secondary') and contains(normalize-space(.), 'Quay lại')]"

Button_Search = "//button[@type='submit' and contains(normalize-space(.),'Tìm kiếm')]"
Button_Clear_Filter = "//button[contains(@class, 'btn-secondary') and contains(normalize-space(.), 'Xóa bộ lọc')]"

Search_Textbox = "//input[@id='keyword']"
