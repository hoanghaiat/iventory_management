
URL = "https://kholuutru.minds.vn/"
USERNAME = "admin_qc_automation"
PASSWORD = "Qc@12345"

TIMEOUT = "10s"

# Login
USERNAME_XPATH = "//*[@id='username']"
PASSWORD_XPATH = "//*[@id='password']"
LOGINBTN_XPATH = "//*[@id='loginBtn']"

INPUT_ID_UNIT = "//input[@id='ma_don_vi']"
INPUT_NAME_UNIT = "//input[@id='ten_don_vi']"
INPUT_NAME_PHONG = "//input[@id='ten_phong']"
INPUT_ID_MUCLUC = "//input[@id='ma_muc_luc']"
INPUT_NAME_MUCLUC = "//input[@id='ten_muc_luc']"

DROPDOWN_HIENTHI = "//select[@id='per-page-select']"
DROPDOWN_NAME_UNIT = "//select[@id='don_vi_id']"
DROPDOWN_PHONG = "//select[@id='don-vi-filter']"
DROPDOWN_DONVI = "//select[@id='don_vi_select']"
DROPDOWN_PHONG2 = "//select[@id='phong_select']"
DROPDOWN_DONVIP = "//select[@id='don-vi-filter']"
DROPDOWN_DVPHONG = "//select[@id='phong-filter']"
DROPDOWN_KHO = "//select[@id='kho_select']"
DROPDOWN_GIA = "//select[@id='gia_select']"

# Sidebar
SIDEBAR = "//button[@id='sidebarToggle']"
QLTOCHUC = "//div[@class='nav-group-header']/span[normalize-space()='Quản lý tổ chức']"
QLKHO2 = "//div[@class='nav-group-header']/span[normalize-space()='Quản lý kho']"
SEARCH_REPORT = "//div[@class='nav-group-header']/span[normalize-space()='Tìm kiếm &amp; Báo cáo']"
QTHETHONG = "//div[@class='nav-group-header']/span[normalize-space()='Quản trị hệ thống']"
CANHAN = "//div[@class='nav-group-header']/span[normalize-space()='Cài đặt cá nhân']"

# Quick Add
QUICK_ADD_NEW_UNIT_XPATH = "//a[@href='/don-vi/add' and contains(@class,'btn-primary')]"
QUICK_ADD_STORAGE_ROOM = "//a[@href='/phong/add' and contains(@class,'btn-primary')]"
QUICK_ADD_PROFILE_TABLE_CONTENTS = "//a[@href='/muc-luc/add' and contains(@class,'btn-primary')]"
QUICK_ADD_WAREHOUSE = "//a[@href='/kho/add' and contains(@class,'btn-success')]"
QUICK_ADD_SHELF = "//a[@href='/gia/add' and contains(@class,'btn-success')]"
QUICK_ADD_BOX = "//a[@href='/hop/add' and contains(@class,'btn-success')]"
QUICK_ADD_DOCUMENT_SEARCH = "//a[@href='/search' and contains(@class,'btn-outline-primary')]"
QUICK_ADD_SEE_REPORT = "//a[@href='/reports' and contains(@class,'btn-outline-success')]"

# Logout
LOGOUT = "//a[@href='/logout' and contains(@class,'btn-outline-danger')]"
LOGOUT_MENU = "//a[@href='/logout' and contains(@class,'nav-item')]"

# Menu Items
ITEM_UNIT = "//a[@href='/don-vi' and contains(@class,'nav-item')]"
ITEM_STORAGE_ROOM = "//a[@href='/phong' and contains(@class,'nav-item')]"
ITEM_PROFILE_TABLE_CONTENTS = "//a[@href='/muc-luc' and contains(@class,'nav-item')]"
ITEM_WAREHOUSE = "//a[@href='/kho' and contains(@class,'nav-item')]"
ITEM_SHELF = "//a[@href='/gia' and contains(@class,'nav-item')]"
ITEM_BOX = "//a[@href='/hop' and contains(@class,'nav-item')]"
ITEM_SEARCH = "//a[@href='/search' and contains(@class,'nav-item')]"
ITEM_REPORT = "//a[@href='/report' and contains(@class,'nav-item')]"
ITEM_ADMIN_PAGE = "//a[@href='/admin' and contains(@class,'nav-item')]"
ITEM_ACCOUNT_MANAGEMENT = "//a[@href='/admin/users' and contains(@class,'nav-item')]"
ITEM_SYSTEM_LOG = "//a[@href='/admin/logs' and contains(@class,'nav-item')]"
ITEM_INTERFACE = "//a[@href='/admin/theme-settings' and contains(@class,'nav-item')]"

# Button
BUTTON_ADD_UNIT = "//a[@href='/don-vi/add' and contains(@class,'btn-primary')]"
BUTTON_SAVE_ADD_UNIT = "//button[@type='submit' and contains(@class,'btn-primary')]"
BUTTON_CANCEL_ADD_UNIT = "//a[contains(@class,'btn-secondary') and contains(@class,'me-md-2')]"
BUTTON_BACK_TO_LIST = "//a[@href='/don-vi' and contains(@class,'btn-secondary')]"
BUTTON_EDIT_UNIT = "//a[@href='/don-vi/edit/10' and contains(@class,'btn-outline-primary')]"
BUTTON_DELETE_UNIT = "//button[@type='submit' and contains(@class,'btn-outline-danger')]"
BUTTON_UPDATE_UNIT = "//button[@type='submit' and contains(@class,'btn-primary')]"

BUTTON_ADD_STORAGE = "//a[@href='/phong/add' and contains(@class,'btn-primary')]"
BUTTON_BACK_TO_STORAGE = "//a[@href='/phong' and contains(@class,'btn-outline-secondary')]"
BUTTON_CANCEL_ADD_PHONG = "//a[@href='/phong' and contains(@class,'btn-secondary')]"
BUTTON_SAVE_PHONG = "//button[@type='submit' and contains(@class, 'btn-primary')]"
BUTTON_EDIT_PHONG = "//a[@href='/phong/edit/5' and contains(@class,'btn-outline-primary')]"
BUTTON_UPDATE_PHONG = "//button[@type='submit' and contains(@class, 'btn-primary')]"
BUTTON_DELETE_PHONG = "//button[@type='submit' and contains(@class, 'btn-outline-danger')]"

BUTTON_ADD_MUCLUC = "//a[@href='/muc-luc/add' and contains(@class,'btn-primary')]"
BUTTON_CANCEL_MUCLUC = "//a[@href='/muc-luc' and contains(@class,'btn-secondary')]"
BUTTON_BACK_TO_MUCLUC = "//a[@href='/muc-luc' and contains(@class,'btn-outline-secondary')]"
BUTTON_SAVE_MUCLUC = "//button[@type='submit' and contains(@class, 'btn-primary')]"
BUTTON_EDIT_MUCLUC = "//a[@href='/muc-luc/edit/5' and contains(@class,'btn-outline-primary')]"
BUTTON_UPDATE_MUCLUC = "//button[@type='submit' and contains(@class, 'btn-primary')]"
BUTTON_DELETE_MUCLUC = "//button[@type='submit' and contains(@class, 'btn-outline-danger')]"

BUTTON_COME_BACK = "//a[@href='/' and contains(@class,'btn-outline-secondary')]"

BUTTON_SEARCH = "//button[@type='submit' and contains(@class,'btn btn-primary')]"
BUTTON_CLEAR_FILTER = "//button[@type='button' and contains(@class,'btn-secondary')]"

SEARCH_TEXTBOX = "//input[@id='keyword']"

