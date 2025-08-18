*** Settings ***
Library     SeleniumLibrary
Library     Collections
Library     String

*** Variables ***
${BASE_URL}       https://demo-clo.minds.vn
${LOGIN_URL}      ${BASE_URL}/en/accounts/login/?next=/en/
${BROWSER}        chrome
${HEADLESS}       False
${USERNAME}       lecturer1
${PASSWORD}       demolecturer
${TO}             25s
${POLL}           500ms

${QB_URL_EN}      ${BASE_URL}/en/questionbank/questions/
${QB_URL_VI}      ${BASE_URL}/vi/questionbank/questions/

*** Keywords ***
Set Selenium Options
    ${opt}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Run Keyword If    ${HEADLESS}    Call Method    ${opt}    add_argument    --headless=new
    Call Method    ${opt}    add_argument    --disable-gpu
    Call Method    ${opt}    add_argument    --no-sandbox
    RETURN    ${opt}

Login As Lecturer
    ${opt}=    Set Selenium Options
    Open Browser    about:blank    ${BROWSER}    options=${opt}
    Maximize Browser Window
    Go To    ${LOGIN_URL}
    Wait Until Page Contains Element    xpath=//input[@name='username']    ${TO}
    Input Text        xpath=//input[@name='username']    ${USERNAME}
    Input Password    xpath=//input[@name='password']    ${PASSWORD}
    Click Button      xpath=(//button[@type='submit']|//button)[1]
    Wait Until Document Ready
    Remove Overlays
    Wait Until Keyword Succeeds    40 times    ${POLL}    Execute Javascript    return document.readyState === 'complete'

Wait Until Document Ready
    Wait Until Keyword Succeeds    40 times    ${POLL}    Execute Javascript    return document.readyState === 'complete'

Remove Overlays
    Execute Javascript
    ...    (function(){
    ...      try{
    ...        var ids=['djDebug']; ids.forEach(function(i){var e=document.getElementById(i); if(e) e.remove();});
    ...        var cls=['djdt','djdt-scroll','modal-backdrop','offcanvas-backdrop','overlay','toast','fade','show','TemplatesPanel'];
    ...        cls.forEach(function(c){document.querySelectorAll('.'+c).forEach(function(el){el.remove();});});
    ...        document.querySelectorAll('a.TemplatesPanel').forEach(function(el){el.remove();});
    ...        document.body.style.pointerEvents='auto';
    ...      }catch(e){}
    ...    })();

Safe Click
    [Arguments]    ${locator}
    Remove Overlays
    Wait Until Page Contains Element    ${locator}    ${TO}
    Scroll Element Into View           ${locator}
    Execute Javascript    window.scrollBy(0, -120);
    ${clicked}=    Run Keyword And Return Status    Click Element    ${locator}
    IF    not ${clicked}
        ${jsok}=    Run Keyword And Return Status
        ...    Execute Javascript
        ...    return (function(el){ if(!el){return false;} try{ el.click(); return true;} catch(e){ return false; } })(arguments[0]);
        ...    ${locator}
        IF    not ${jsok}
            Wait Until Keyword Succeeds    3x    300ms    Click Element    ${locator}
        END
    END
