*** Settings ***
Library    SeleniumLibrary
Resource   ../Resource/loccauhoi.resource

Suite Setup     Open Browser And Login
Suite Teardown  Close All Browsers
Test Setup      Go To Question Bank
Test Teardown   Capture Page Screenshot


*** Variables ***
${COURSE_CS301}          CS301: Cơ sở dữ liệu
${CLO_INVALID}           CLO999
${TAG_PHYSICS}           Physics
${DIFFICULTY_HARD}       Hard
${SEARCH_ALGEBRA}        algebra
${SEARCH_ALGEBRA_UPPER}  ALGEBRA
${SEARCH_SPECIAL}        @@@@

*** Test Cases ***
QB-FUNC-01 - Lọc theo Course có dữ liệu
    Set Course    ${COURSE_CS301}
    Apply Filters
    Should Have Data

QB-FUNC-02 - Lọc theo CLO không có dữ liệu
    Set CLO    ${CLO_INVALID}
    Apply Filters
    Should Show No Data

QB-FUNC-03 - Lọc theo Tag
    Set Tag    ${TAG_PHYSICS}
    Apply Filters
    Should Have Data

QB-FUNC-04 - Lọc kết hợp nhiều filter
    Set Course       ${COURSE_CS301}
    Set Difficulty   ${DIFFICULTY_HARD}
    Apply Filters
    Should Have Data

QB-VAL-01 - Search từ khóa
    Set Search Query    ${SEARCH_ALGEBRA}
    Apply Filters
    Should Have Data

QB-VAL-02 - Search không phân biệt hoa thường
    Set Search Query    ${SEARCH_ALGEBRA_UPPER}
    Apply Filters
    Should Have Data

QB-VAL-03 - Search ký tự đặc biệt
    Set Search Query    ${SEARCH_SPECIAL}
    Apply Filters
    Should Show No Data

*** Keywords ***
norm
    [Arguments]    ${text}
    ${norm}=    Evaluate    import unicodedata; ''.join(c for c in unicodedata.normalize('NFKD', """${text}""") if not unicodedata.combining(c)).lower().strip()
    [Return]    ${norm}
