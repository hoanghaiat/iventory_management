
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
Item_Unit = "//a[@href='/don-vi' and contains(@class,'nav-item')]"
Item_Storage_Room = "//a[@href='/phong' and contains(@class,'nav-item')]"
Item_Profile_Table_Contents = "//a[@href='/muc-luc' and contains(@class,'nav-item')]"
Item_Warehouse = "//a[@href='/kho' and contains(@class,'nav-item')]"
Item_shelf = "//a[@href='/gia' and contains(@class,'nav-item')]"
Item_Box = "//a[@href='/hop' and contains(@class,'nav-item')]"
Item_Search = "//a[@href='/search' and contains(@class,'nav-item')]"
Item_Report = "//a[@href='/report' and contains(@class,'nav-item')]"
Item_Admin_Page = "//a[@href='/admin' and contains(@class,'nav-item')]"
Item_Account_Management = "//a[@href='/admin/users' and contains(@class,'nav-item')]"
Item_System_Log = "//a[@href/admin/logs' and contains(@class,'nav-item')]"
Item_Interface = "//a[@href='/admin/theme-settings' and contains(@class,'nav-item')]"

#Button
Button_Add_Unit ="//a[@href='/don-vi/add' and contains(@class,'btn-primary')]"
Button_Save_Add_Unit ="//button[@type='submit' and contains(@class,'btn-primary')]"
Button_Cancel_Add_Unit ="//a[contains(@class,'btn-secondary') and contains(@class,'me-md-2')]"
Button_Back_To_List ="//a[@href='/don-vi' and contains(@class,'btn-secondary')]"
Button_Edit_Unit ="//a[@href='/don-vi/edit/10' and contains(@class,'btn-outline-primary')]"
Button_Delete_Unit ="//button[@type='submit' and contains(@class,'btn-outline-danger')]"
Button_Update_Unit ="//button[@type='submit' and contains(@class,'btn-primary')]"

Button_Add_Storage = "//a[@href='/phong/add' and contains(@class,'btn-primary')]"
Button_Back_To_storage = "//a[@href='/phong' and contains(@class,'btn-outline-secondary')]"
Button_Cancel_Add_Phong = "//a[@href='/phong' and contains(@class,'btn-secondary')]"
Button_Save_Phong = "//button[@type='submit' and contains(@class, 'btn-primary')]"
Button_Edit_Phong = "//a[@href='/phong/edit/5' and contains(@class,'btn-outline-primary')]"
Button_Update_Phong = "//button[@type='submit' and contains(@class, 'btn-primary')]"
Button_Delete_Phong = "//button[@type='submit' and contains(@class, 'btn-outline-danger')]"

Button_Add_Mucluc = "//a[@href='/muc-luc/add' and contains(@class,'btn-primary')]"
Button_Cancel_Mucluc = "//a[@href='/muc-luc' and contains(@class,'btn-secondary')]"
Button_Back_To_Mucluc = "//a[@href='/muc-luc' and contains(@class,'btn-outline-secondary')]"
Button_Save_Mucluc= "//button[@type='submit' and contains(@class, 'btn-primary')]" 
Button_Edit_Mucluc = "//a[@href='/muc-luc/edit/5' and contains(@class,'btn-outline-primary')]"
Button_Update_Mucluc = "//button[@type='submit' and contains(@class, 'btn-primary')]"
Button_Delete_Mucluc = "//button[@type='submit' and contains(@class, 'btn-outline-danger')]"

Button_Come_Back = "//a[@href='/' and contains(@class,'btn-outline-secondary')]"

Button_Search = "//button[@type='submit' and contains(@class,'btn btn-primary')]"
Button_Clear_Filter = "//button[@type='button' and contains(@class,'btn-secondary')]"

Search_Textbox = "//input[@id='keyword']"