*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://kholuutru.minds.vn/
${USERNAME}  admin_qc_automation
${PASSWORD}  Qc@12345
${username_xpath}    //*[@id="username"]
${password_xpath}    //*[@id="password"]
${loginbtn_xpath}    //*[@id="loginBtn"]

${Box_Mucluc}    //div[contains(@class,'stats-card') and .//div[contains(text(),'Mục lục hồ sơ')]]//span[@class='stat-number']
${Box_Kho}       //span[@class='stat-number' and text()='5']

${Box_Mucluc_Menu}    //div[contains(@class,'stats-card') and .//div[contains(text(),'Tổng mục lục')]]//span[@class='stat-number']

${SideBar}          //button[@id='sidebarToggle']
${QLKho}            //span[text()='Quản lý Kho']
${QLToChuc}         //div[@class='nav-group-header']/span[normalize-space()='Quản lý tổ chức']
${QLKho2}           //div[@class='nav-group-header']/span[normalize-space()='Quản lý kho']
${Search_Report}    //div[@class='nav-group-header']/span[normalize-space()='Tìm kiếm &amp; Báo cáo']
${QTHeThong}        //div[@class='nav-group-header']/span[normalize-space()='Quản trị hệ thống']
${CaNhan}           //div[@class='nav-group-header']/span[normalize-space()='Cài đặt cá nhân']

${Quick_Add_New_Unit_xpath}             //a[@href="/don-vi/add" and contains(@class,"btn-primary")]
${Quick_Add_Storage_Room}               //a[@href="/phong/add" and contains(@class,"btn-primary")]
${Quick_Add_Profile_Table_Contents}     //a[@href="/muc-luc/add" and contains(@class,"btn-primary")]
${Quick_Add_Warehouse}                  //a[@href="/kho/add" and contains(@class,"btn-success")]
${Quick_Add_shelf}                      //a[@href="/gia/add" and contains(@class,"btn-success")]
${Quick_Add_Box}                        //a[@href="/hop/add" and contains(@class,"btn-success")]
${Quick_Add_Document_Search}            //a[@href='/search' and contains(@class,"btn-outline-primary")]
${Quick_Add_See_Report}                 //a[@href="/reports" and contains(@class,"btn-outline-success")]

${Form_Add_Unit}                        //div[@class="page-title" and normalize-space()="Thêm Đơn vị"]
${Form_Add_Storage_Room}                //div[@class="page-title" and normalize-space()="Thêm Phông lưu trữ mới"]
${Form_Add_Profile_Table_Contents}      //div[@class="page-title" and normalize-space()="Thêm Mục lục hồ sơ mới"]
${Form_Add_Warehouse}                   //div[@class="page-title" and normalize-space()="Thêm Kho mới"]
${Form_Add_shelf}                       //div[@class="page-title" and normalize-space()="Thêm Giá kệ mới"]
${Form_Add_Box}                         //div[@class="page-title" and normalize-space()="Thêm Hộp lưu trữ mới"]
${Form_Add_Document_Search}             //div[@class="page-title" and normalize-space()="Tìm kiếm"]
${Form_Add_See_Report}                  //div[@class="page-title" and normalize-space()="Hệ thống Quản lý Kho"]


${Logout}    //a[@href='/logout' and contains(@class,'btn-outline-danger')]
${Logout_Menu}    //a[@href='/logout' and contains(@class,'nav-item')]

${Item_Unit}                        //a[contains(@href,"/don-vi") and contains(normalize-space(.),"Đơn vị")]
${Item_Storage_Room}                //a[contains(@href,"/phong") and contains(normalize-space(.),"Phông lưu trữ")]
${Item_Profile_Table_Contents}      //a[contains(@href,"/muc-luc") and contains(normalize-space(.),"Mục lục hồ sơ")]
${Item_Warehouse}                   //a[contains(@href,"/kho") and contains(normalize-space(.),"Kho lưu trữ")]
${Item_shelf}                       //a[contains(@href,"/gia") and contains(normalize-space(.),"Giá kệ")]
${Item_Box}                         //a[contains(@href,"/hop") and contains(normalize-space(.),"Hộp lưu trữ")]
${Item_Search}                      //a[contains(@href,"/search") and contains(normalize-space(.),"Tìm kiếm")]
${Item_Admin_Page}                  //a[contains(@href,"/admin") and contains(normalize-space(.),"Trang quản trị")]
${Item_Account_Management}          //a[contains(@href,"/admin/users") and contains(normalize-space(.),"Quản lý tài khoản")]
${Item_System_Log}                  //a[contains(@href,"/admin/logs") and contains(normalize-space(.),"Nhật ký hệ thống")]
${Item_Interface}                   //a[contains(@href,"/theme-settings") and contains(normalize-space(.),"Giao diện")]

${Page_Unit}                        //div[@class="page-title" and normalize-space(.)="Quản lý Đơn vị"]
${Page_Storage_Room}                //div[@class="page-title" and normalize-space(.)="Quản lý Phông Lưu trữ"]
${Page_Profile_Table_Contents}      //div[@class="page-title" and normalize-space(.)="Quản lý Mục lục hồ sơ"]
${Page_Warehouse}                   //div[@class="page-title" and normalize-space(.)="Quản lý Kho lưu trữ"]
${Page_shelf}                       //div[@class="page-title" and normalize-space(.)="Quản lý Giá kệ"]
${Page_Box}                         //div[@class="page-title" and normalize-space(.)="Quản lý Hộp lưu trữ"]
${Page_Search}                      //div[@class="page-title" and normalize-space(.)="Tìm kiếm"]
${Page_Admin_Page}                  //div[@class="page-title" and normalize-space(.)="Hệ thống Quản lý Kho"]
${Page_Account_Managemnet}          //div[@class="page-title" and normalize-space(.)="Quản lý tài khoản"]
${Page_System_Log}                  //div[@class="page-title" and normalize-space(.)="Hệ thống Quản lý Kho"]
${Page_Interface}                   //div[@class="page-title" and normalize-space(.)="Hệ thống Quản lý Kho"]

*** Keywords ***
Login To System
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Wait Until Element Is Visible    ${username_xpath}    30s
    Input Text    ${username_xpath}    ${USERNAME}
    Input Text    ${password_xpath}    ${PASSWORD}
    Click Button  ${loginbtn_xpath}
    
Quick Add New Units
    Click Element    ${Quick_Add_New_Unit_xpath}
    Wait Until Page Contains Element    ${Form_Add_Unit}    30s

Quick Add Storage Room
    Click Element    ${Quick_Add_Storage_Room}
    Wait Until Page Contains Element    ${Form_Add_Storage_Room}    10s

Quick Add Profile Table of Contents
    Scroll Element Into View    ${Quick_Add_Profile_Table_Contents}
    Click Element    ${Quick_Add_Profile_Table_Contents}
    Wait Until Page Contains Element    ${Form_Add_Profile_Table_Contents}    10s

Quick Add Warehouse
    #Wait Until Element Is Visible    ${Quick_Add_Warehouse}    10s
    Scroll Element Into View    ${Quick_Add_Warehouse}
    Click Element    ${Quick_Add_Warehouse}
    Wait Until Page Contains Element    ${Form_Add_Warehouse}    10s

Quick Add shelf
    Wait Until Element Is Visible    ${Quick_Add_shelf}    10s
    Scroll Element Into View    ${Quick_Add_shelf}
    Click Element    ${Quick_Add_shelf}
    Wait Until Page Contains Element    ${Form_Add_shelf}    10s

Quick Add Box
    Wait Until Element Is Visible    ${Quick_Add_Box}    10s
    Scroll Element Into View    ${Quick_Add_Box}
    Click Element    ${Quick_Add_Box}
    Wait Until Page Contains Element    ${Form_Add_Box}    10s

Quick Add Document Search
    Click Element    ${Quick_Add_Document_Search}
    Wait Until Page Contains Element    ${Form_Add_Document_Search}    10s

Quick Add See report
    Wait Until Element Is Visible    ${Quick_Add_See_Report}    10s
    Scroll Element Into View    ${Quick_Add_See_Report}
    Click Element    ${Quick_Add_See_Report}
    Wait Until Page Contains Element    ${Form_Add_See_Report}    10s
Logout
    Wait Until Element Is Visible    ${Logout}    10s
    Scroll Element Into View    ${Logout}
    Click Element    ${Logout}
    Wait Until Element Is Visible    ${username_xpath}    10s

Click Unit
    Wait Until Element Is Visible    ${Item_Unit}    10s
    Click Element    ${Item_Unit}
    Wait Until Page Contains Element    ${Page_Unit}    10s

Click Storage Room
    Wait Until Element Is Visible    ${Item_Storage_Room}    10s
    Click Element    ${Item_Storage_Room}
    Wait Until Page Contains Element    ${Page_Storage_Room}    10s

Click Profile Table of Contents
    Wait Until Element Is Visible    ${Item_Profile_Table_Contents}    10s
    Click Element    ${Item_Profile_Table_Contents}
    Wait Until Page Contains Element    ${Page_Profile_Table_Contents}    10s
    Capture Page Screenshot    muc_luc.png

Click Warehouse
    Wait Until Element Is Visible    ${Item_Warehouse}    10s
    Click Element    ${Item_Warehouse}
    Wait Until Page Contains Element    ${Page_Warehouse}    10s

Click shelf
    Wait Until Element Is Visible    ${Item_shelf}    10s
    Click Element    ${Item_shelf}
    Wait Until Page Contains Element    ${Page_shelf}    10s

Click Box
    Wait Until Element Is Visible    ${Item_Box}    10s
    Click Element    ${Item_Box}
    Wait Until Page Contains Element    ${Page_Box}    10s

Click Search
    Wait Until Element Is Visible    ${Item_Search}    10s
    Click Element    ${Item_Search}
    Wait Until Page Contains Element    ${Page_Search}    10s

Click Admin Page
    Wait Until Element Is Visible    ${Item_Admin_Page}    10s
    Scroll Element Into View    ${Item_Admin_Page}
    Click Element    ${Item_Admin_Page}
    Wait Until Page Contains Element    ${Page_Admin_Page}    10s

Click Account Management
    Wait Until Element Is Visible    ${Item_Account_Management}    10s
    Scroll Element Into View    ${Item_Account_Management}
    Click Element    ${Item_Account_Management}
    Wait Until Page Contains Element    ${Page_Account_Managemnet}    10s

Click System Log
    Wait Until Element Is Visible    ${Item_System_Log}    10s
    Scroll Element Into View    ${Item_System_Log}
    Click Element    ${Item_System_Log}
    Wait Until Page Contains Element    ${Page_System_Log}    10s

Click Interface 
    Wait Until Element Is Visible    ${Item_Interface}    10s
    Scroll Element Into View    ${Item_Interface}
    Click Element    ${Item_Interface}
    Wait Until Page Contains Element    ${Page_Interface}    10s

Click Logout menu
    Wait Until Element Is Visible    ${Logout_Menu}    10s
    Scroll Element Into View    ${Logout_Menu}
    Click Element    ${Logout_Menu}
    Wait Until Element Is Visible    ${username_xpath}    10s

Close menu
    Wait Until Element Is Visible    ${QLKho}    10s
    Click Element    ${SideBar}
    Wait Until Element Is Not Visible    ${QLKho}    10s

Close QLToChuc
    Wait Until Element Is Visible    ${QLKho}    10s
    Click Element    ${QLToChuc}
    Wait Until Element Is Not Visible    ${Item_Unit}    10s

Close QLKho2
    Wait Until Element Is Visible    ${QLKho}    10s
    Click Element    ${QLKho2}
    Wait Until Element Is Not Visible    ${Item_Warehouse}    10s

Close Search_Report
    Wait Until Element Is Visible    ${QLKho}    10s
    Click Element    ${Search_Report}
    Wait Until Element Is Not Visible    ${Item_Search}    10s

Close QTHeThong
    Wait Until Element Is Visible    ${QLKho}    10s
    Click Element    ${QTHeThong}
    Wait Until Element Is Not Visible    ${Item_Admin_Page}    10s
Close CaNhan
    Wait Until Element Is Visible    ${QLKho}    10s
    Click Element    ${CaNhan}
    Wait Until Element Is Not Visible    ${Item_Interface}    10s

Number MucLuc 
    ${dashboard_value}=    Get Text    ${Box_Mucluc}
    Log    Số dashboard: ${dashboard_value}

    Click Element    ${Item_Profile_Table_Contents}
    Scroll Element Into View    ${Box_Mucluc_Menu}
    Wait Until Element Is Visible    ${Box_Mucluc_Menu}

    ${page_value}=    Get Text    ${Box_Mucluc_Menu}
    Log    Số trang Mục lục: ${page_value}

    Should Be Equal As Integers    ${dashboard_value}    ${page_value}