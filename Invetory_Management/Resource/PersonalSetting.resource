*** Settings ***
*** Settings ***
Library    SeleniumLibrary
Resource    ../Resource/HomePage.resource

*** Variables ***
${Button_Come_Back}    //a[contains(@class, "btn-outline-secondary") and contains(normalize-space(.), "Quay lại")]
${Page_HomePage}       //div[@class="page-title" and normalize-space(.)="Trang chủ"]

*** Keywords ***
Button Come Back
    Click Element    ${Button_Come_Back}
    Wait Until Element Is Visible    ${Page_HomePage}    10s