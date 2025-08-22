*** Settings ***
Resource    ${CURDIR}${/}core.resource
Library     SeleniumLibrary
Library     Collections
Library     String

*** Variables ***
${HDR_QB}       xpath=(//h1|//h2)[contains(translate(normalize-space(.),'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'),'question bank') or contains(translate(normalize-space(.),'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'),'ngân hàng câu hỏi') or contains(translate(normalize-space(.),'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'),'duyệt câu hỏi')]
${BTN_ADD}      xpath=//*[self::a or self::button][contains(translate(.,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'),'add question') or contains(translate(.,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'),'tạo câu hỏi')]
${BTN_IMPORT}   xpath=//*[self::a or self::button][contains(translate(.,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'),'import') or contains(translate(.,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'),'nhập')]
${BTN_TAGS}     xpath=//*[self::a or self::button][contains(translate(.,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'),'tags') or contains(translate(.,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'),'thẻ')]
${TABLE_ANY}    xpath=(//table | //div[contains(@class,'table')])[1]

*** Keywords ***
Open Question Bank
    # Thử EN -> VI; chỉ Fail khi cả hai đều không vào được
    Go To    ${QB_URL_EN}
    Wait Until Document Ready
    ${ok}=    Run Keyword And Return Status    Wait For QB Landed    20s
    IF    ${ok}
        RETURN
    END
    Go To    ${QB_URL_VI}
    Wait Until Document Ready
    ${ok2}=   Run Keyword And Return Status    Wait For QB Landed    20s
    IF    ${ok2}
        RETURN
    END
    Fail    Không mở được trang Question Bank qua cả EN và VI.

QB Markers Present Check
    ${loc}=       Get Location
    ${by_url}=    Evaluate    '/questionbank/' in '''${loc}'''
    IF    ${by_url}
        RETURN    ${True}
    END
    ${m1}=    Run Keyword And Return Status    Page Should Contain Element    ${BTN_ADD}
    ${m2}=    Run Keyword And Return Status    Page Should Contain Element    ${BTN_IMPORT}
    ${m3}=    Run Keyword And Return Status    Page Should Contain Element    ${BTN_TAGS}
    ${hdr}=   Run Keyword And Return Status    Page Should Contain Element    ${HDR_QB}
    ${tbl}=   Run Keyword And Return Status    Page Should Contain Element    ${TABLE_ANY}
    ${any}=   Evaluate    ${m1} or ${m2} or ${m3} or ${hdr} or ${tbl}
    RETURN    ${any}

Assert QB Markers Present
    ${ok}=    QB Markers Present Check
    Should Be True    ${ok}    Question Bank markers not visible

Wait For QB Landed
    [Arguments]    ${timeout}=50s
    # Retry đến khi marker sẵn sàng; ${POLL} khai báo trong core.resource (ví dụ 0.25s)
    Wait Until Keyword Succeeds    ${timeout}    ${POLL}    Assert QB Markers Present
