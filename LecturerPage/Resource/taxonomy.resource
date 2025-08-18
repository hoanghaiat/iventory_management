*** Settings ***
Resource    core.resource
Library     SeleniumLibrary
Library     RequestsLibrary

*** Variables ***
${URL_TAXONOMY}    ${BASE_URL}/en/questionbank/tags/
${ERR_TEMPLATE}    TemplateDoesNotExist
${ERR_FILENAME}    questionbank/tag_list.html
${LOC_TAGS_MENU}   xpath=//aside//a[contains(@href,'/questionbank/tags')]

*** Keywords ***
Open Taxonomy By Menu
    Click Element    ${LOC_TAGS_MENU}
    Wait Until Page Contains Element    xpath=//body    10s

Open Taxonomy By URL
    Go To    ${URL_TAXONOMY}
    Wait Until Page Contains Element    xpath=//body    10s

Expect Template Error
    Page Should Contain    ${ERR_TEMPLATE}
    Page Should Contain    ${ERR_FILENAME}
