*** Settings ***
Resource    core.resource
Library     SeleniumLibrary
Library     RequestsLibrary

*** Variables ***
${URL_IMPORT}        ${BASE_URL}/en/questionbank/questions/import/
${ERR_TEMPLATE}      TemplateDoesNotExist
${ERR_FILENAME}      questionbank/import_questions.html

${LOC_IMPORT_MENU}   xpath=//aside//a[contains(@href,'/questionbank/questions/import')]
${IMP_INPUT_FILE}    xpath=//input[@type='file']

*** Keywords ***
Open Import By Menu
    Safe Click    ${LOC_IMPORT_MENU}
    Wait Until Document Ready

Open Import By URL
    Go To    ${URL_IMPORT}
    Wait Until Document Ready

Expect Template Error
    Page Should Contain    ${ERR_TEMPLATE}
    Page Should Contain    ${ERR_FILENAME}

Verify Import Menu Visible
    Page Should Contain Element    ${LOC_IMPORT_MENU}
