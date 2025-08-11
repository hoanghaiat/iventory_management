*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}    https://kholuutru.minds.vn/
${USERNAME}  admin_qc_automation
${PASSWORD}  Qc@12345
${username_xpath}    //*[@id="username"]
${password_xpath}    //*[@id="password"]
${loginbtn_xpath}    //*[@id="loginBtn"]

${Quick_Add_New_Unit_xpath}             //a[@href="/don-vi/add" and contains(@class,"btn-primary")]
${Form_Add_Unit}                        //div[@class="page-title" and normalize-space()="Thêm Đơn vị"]
${Quick_Add_Storage_Room}               //a[@href="/phong/add" and contains(@class,"btn-primary")]
${Form_Add_Storage_Room}                //div[@class="page-title" and normalize-space()="Thêm Phông lưu trữ mới"]
${Quick_Add_Profile_Table_Contents}     //a[@href="/muc-luc/add" and contains(@class,"btn-primary")]
${Form_Add_Profile_Table_Contents}      //div[@class="page-title" and normalize-space()="Thêm Mục lục hồ sơ mới"]
${Quick_Add_Warehouse}                  //a[@href="/kho/add" and contains(@class,"btn-primary")]
${Form_Add_Warehouse}                   //div[@class="page-title" and normalize-space()="Thêm Kho mới"]
${Quick_Add_shelf}                      //a[@href="/gia/add" and contains(@class,"btn-primary")]
${Form_Add_shelf}                       //div[@class="page-title" and normalize-space()="Thêm Giá kệ mới"]
${Quick_Add_Box}                        //a[@href="/hop/add" and contains(@class,"btn-primary")]
${Form_Add_Box}                         //div[@class="page-title" and normalize-space()="Thêm Hộp lưu trữ mới"]
${Quick_Add_Document_Search}            //a[@href="/search/add" and contains(@class,"btn-primary")]
${Form_Add_Document_Search}             //div[@class="page-title" and normalize-space()="Tìm kiếm"]
${Quick_Add_See_Report}                 //a[@href="/reports/add" and contains(@class,"btn-primary")]
${Form_Add_See_Report}                  //div[@class="page-title" and normalize-space()="Hệ thống Quản lý Kho"]


${Logout}    //a[normalize-space(.)="Đăng xuất"]

${Item_Unit}                //a[contains(@href,"/don-vi") and contains(normalize-space(.),"Đơn vị")]
${Page_Unit}                  //div[@class="page-title" and normalize-space(.)="Quản lý Đơn vị"]
${Item_Storage_Room}        //a[contains(@href,"/phong") and contains(normalize-space(.),"Phông lưu trữ")]
${Page_Storage_Room}          //div[@class="page-title" and normalize-space(.)="Quản lý Phông Lưu trữ"]
${Item_Profile_Table_Contents}    //a[contains(@href,"/muc-luc") and contains(normalize-space(.),"Mục lục hồ sơ")]
${Page_Profile_Table_Contents}    //div[@class="page-title" and normalize-space(.)="Quản lý Mục lục hồ sơ"]
${Item_Warehouse}    //a[contains(@href,"/kho") and contains(normalize-space(.),"Kho lưu trữ")]
${Page_Warehouse}    //div[@class="page-title" and normalize-space(.)="Quản lý Kho lưu trữ"]
${Item_shelf}    //a[contains(@href,"/gia") and contains(normalize-space(.),"Giá kệ")]
${Page_shelf}    //div[@class="page-title" and normalize-space(.)="Quản lý Giá kệ"]
${Item_Box}    //a[contains(@href,"/hop") and contains(normalize-space(.),"Hộp lưu trữ")]
${Page_Box}    //div[@class="page-title" and normalize-space(.)="Quản lý Hộp lưu trữ"]
${Item_Search}    //a[contains(@href,"/search") and contains(normalize-space(.),"Tìm kiếm")]
${Page_Search}    //div[@class="page-title" and normalize-space(.)="Tìm kiếm"]
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
    Capture Page Screenshot    thêm_đơn_vị.png

Quick Add Storage Room
    Click Element    ${Quick_Add_Storage_Room}
    Wait Until Page Contains Element    ${Form_Add_Storage_Room}    10s
    Capture Page Screenshot    them_phong_luu_tru.png

Quick Add Profile Table of Contents
    Click Element    ${Quick_Add_Profile_Table_Contents}
    Wait Until Page Contains Element    ${Form_Add_Profile_Table_Contents}    10s

Quick Add Warehouse
    Wait Until Element Is Visible    ${Quick_Add_Warehouse}    10s
    Scroll Element Into View    ${Quick_Add_Warehouse}
    Click Element    ${Quick_Add_Warehouse}
    Wait Until Page Contains Element    ${Form_Add_Warehouse}    10s

Quick Add shelf
    Click Element    ${Quick_Add_shelf}
    Wait Until Page Contains Element    ${Form_Add_shelf}    10s

Quick Add Box
    Click Element    ${Quick_Add_Box}
    Wait Until Page Contains Element    ${Form_Add_Box}    10s

Quick Add Document Search
    Click Element    ${Quick_Add_Document_Search}
    Wait Until Page Contains Element    ${Form_Add_Document_Search}    10s

Quick Add See report
    Click Element    ${Quick_Add_See_Report}
    Wait Until Page Contains Element    ${Form_Add_See_Report}    10s
Logout
    Wait Until Element Is Visible    ${Logout}    10s
    Scroll Element Into View    ${Logout}
    Click Element    ${Logout}
    Wait Until Element Is Visible    ${username_xpath}    10s
    Capture Page Screenshot    logout.png

Click Unit
    Wait Until Element Is Visible    ${Item_Unit}    10s
    Click Element    ${Item_Unit}
    Wait Until Page Contains Element    ${Page_Unit}    10s
    Capture Page Screenshot    don_vi.png

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