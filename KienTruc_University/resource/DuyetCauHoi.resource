*** Settings ***
Library    SeleniumLibrary
Variables   ../variables/locator.py


*** Keywords ***
Open Browser To DuyetCauHoi
    # Open Browser    ${URL}    chrome
    Login   admin    demoadmin
Close Web
    Close All Browsers
Login
    [Arguments]    ${username}    ${password}
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Sleep    5s
    Wait Until Element Is Visible    ${BTN_HIDE}    30s
    Click Element    ${BTN_HIDE}
    Wait Until Element Is Visible    ${USERNAME_INPUT}    30s
    Input Text    ${USERNAME_INPUT}    ${username}
    Input Text    ${PASSWORD_INPUT}    ${password}
    Click Button    ${LOGIN_BUTTON}
Filter in the default state
    Wait Until Element Is Visible    ${URL_QUESTION}    20s
    Click Element    ${URL_QUESTION}
    
    Sleep    10s
    Wait Until Element Is Visible    ${BUTTON_APPLY_FILTERS}     10s
    Scroll Element Into View    ${BUTTON_APPLY_FILTERS}
    Sleep    10s
    Click Element     ${BUTTON_APPLY_FILTERS}
    Wait Until Page Contains Element    ${BUTTON_APPLY_FILTERS}    30s
   
    Wait Until Page Contains Element    ${RESULT_TABLE}    10s
    Sleep    10s
    Scroll Element Into View    ${RESULT_TABLE}
    Wait Until Page Contains Element    ${RESULT_TABLE}    30s
    Sleep    10s
Filter the question successfully
    Wait Until Element Is Visible    ${URL_QUESTION}    20s
    Click Element    ${URL_QUESTION}

    Wait Until Element Is Visible    ${SELECT_COURSE}     20s
    Select From List By Value    ${SELECT_COURSE}   5      # SE101: Nhập môn kỹ thuật
    Wait Until Element Is Visible    ${SELECT_CLO}     20s
    Select From List By Value    ${SELECT_CLO}   3           #CLO3: Hiểu và giải thích...
    Wait Until Element Is Visible    ${SELECT_TYPE}     20s
    Select From List By Value    ${SELECT_TYPE}   essay    
    Wait Until Element Is Visible    ${SELECT_DIFFICULTY}     20s
    Select From List By Value    ${SELECT_DIFFICULTY}   easy
    Wait Until Element Is Visible    ${SELECT_BLOOM}     20s
    Select From List By Value    ${SELECT_BLOOM}   understand
    Wait Until Element Is Visible    ${SELECT_STATUS}     20s
    Select From List By Value    ${SELECT_STATUS}   inactive 
    Wait Until Element Is Visible    ${SELECT_APPROVAL_STATUS}     20s
    Select From List By Value    ${SELECT_APPROVAL_STATUS}   pending
    Wait Until Element Is Visible    ${SELECT_TAG}     20s
    Select From List By Value    ${SELECT_TAG}   2         #thuchanh
    
    Sleep    10s
    Wait Until Element Is Visible    ${BUTTON_APPLY_FILTERS}     10s
    Scroll Element Into View    ${BUTTON_APPLY_FILTERS}
    Sleep    10s
    Click Element     ${BUTTON_APPLY_FILTERS}
    Wait Until Page Contains Element    ${BUTTON_APPLY_FILTERS}    30s
   
    Wait Until Page Contains Element    ${RESULT_TABLE}    10s
    Sleep    10s
    Scroll Element Into View    ${RESULT_TABLE}
    Wait Until Page Contains Element    ${RESULT_TABLE}    30s
    Sleep    10s

Filter the question of the Course
    Wait Until Element Is Visible    ${URL_QUESTION}    20s
    Click Element    ${URL_QUESTION}

    Wait Until Element Is Visible    ${SELECT_COURSE}     20s
    Select From List By Value    ${SELECT_COURSE}   5      # SE101: Nhập môn kỹ thuật
    
    Sleep    10s
    Wait Until Element Is Visible    ${BUTTON_APPLY_FILTERS}     10s
    Scroll Element Into View    ${BUTTON_APPLY_FILTERS}
    Sleep    10s
    Click Element     ${BUTTON_APPLY_FILTERS}
    Wait Until Page Contains Element    ${BUTTON_APPLY_FILTERS}    30s
   
    Wait Until Page Contains Element    ${RESULT_TABLE}    10s
    Sleep    10s
    Scroll Element Into View    ${RESULT_TABLE}
    Wait Until Page Contains Element    ${RESULT_TABLE}    30s
    Sleep    10s
Filter the question of the CLO
    Wait Until Element Is Visible    ${URL_QUESTION}    20s
    Click Element    ${URL_QUESTION}

    Wait Until Element Is Visible    ${SELECT_CLO}     20s
    Select From List By Value    ${SELECT_CLO}    3           #CLO3: Hiểu và giải thích...
    
    Sleep    10s
    Wait Until Element Is Visible    ${BUTTON_APPLY_FILTERS}     10s
    Scroll Element Into View    ${BUTTON_APPLY_FILTERS}
    Sleep    10s
    Click Element     ${BUTTON_APPLY_FILTERS}
    Wait Until Page Contains Element    ${BUTTON_APPLY_FILTERS}    30s
   
    Wait Until Page Contains Element    ${RESULT_TABLE}    10s
    Sleep    10s
    Scroll Element Into View    ${RESULT_TABLE}
    Wait Until Page Contains Element    ${RESULT_TABLE}    30s
    Sleep    10s
Filter the question of the Question Type
    Wait Until Element Is Visible    ${URL_QUESTION}    20s
    Click Element    ${URL_QUESTION}

    Wait Until Element Is Visible    ${SELECT_TYPE}     20s
    Select From List By Value    ${SELECT_TYPE}    essay
    
    Sleep    10s
    Wait Until Element Is Visible    ${BUTTON_APPLY_FILTERS}     10s
    Scroll Element Into View    ${BUTTON_APPLY_FILTERS}
    Sleep    10s
    Click Element     ${BUTTON_APPLY_FILTERS}
    Wait Until Page Contains Element    ${BUTTON_APPLY_FILTERS}    30s
   
    Wait Until Page Contains Element    ${RESULT_TABLE}    10s
    Sleep    10s
    Scroll Element Into View    ${RESULT_TABLE}
    Wait Until Page Contains Element    ${RESULT_TABLE}    30s
    Sleep    10s
Filter the question of the Difficulty
    Wait Until Element Is Visible    ${URL_QUESTION}    20s
    Click Element    ${URL_QUESTION}

    Wait Until Element Is Visible    ${SELECT_DIFFICULTY}     20s
    Select From List By Value    ${SELECT_DIFFICULTY}    easy
    
    Sleep    10s
    Wait Until Element Is Visible    ${BUTTON_APPLY_FILTERS}     10s
    Scroll Element Into View    ${BUTTON_APPLY_FILTERS}
    Sleep    10s
    Click Element     ${BUTTON_APPLY_FILTERS}
    Wait Until Page Contains Element    ${BUTTON_APPLY_FILTERS}    30s
   
    Wait Until Page Contains Element    ${RESULT_TABLE}    10s
    Sleep    10s
    Scroll Element Into View    ${RESULT_TABLE}
    Wait Until Page Contains Element    ${RESULT_TABLE}    30s
    Sleep    10s
Filter the question of the Bloom Level
    Wait Until Element Is Visible    ${URL_QUESTION}    20s
    Click Element    ${URL_QUESTION}

    Wait Until Element Is Visible    ${SELECT_BLOOM}     20s
    Select From List By Value    ${SELECT_BLOOM}    understand
    
    Sleep    10s
    Wait Until Element Is Visible    ${BUTTON_APPLY_FILTERS}     10s
    Scroll Element Into View    ${BUTTON_APPLY_FILTERS}
    Sleep    10s
    Click Element     ${BUTTON_APPLY_FILTERS}
    Wait Until Page Contains Element    ${BUTTON_APPLY_FILTERS}    30s
   
    Wait Until Page Contains Element    ${RESULT_TABLE}    10s
    Sleep    10s
    Scroll Element Into View    ${RESULT_TABLE}
    Wait Until Page Contains Element    ${RESULT_TABLE}    30s
    Sleep    10s
Filter the question of the Status
    Wait Until Element Is Visible    ${URL_QUESTION}    20s
    Click Element    ${URL_QUESTION}

    Wait Until Element Is Visible    ${SELECT_STATUS}     20s
    Select From List By Value    ${SELECT_STATUS}    inactive
    
    Sleep    10s
    Wait Until Element Is Visible    ${BUTTON_APPLY_FILTERS}     10s
    Scroll Element Into View    ${BUTTON_APPLY_FILTERS}
    Sleep    10s
    Click Element     ${BUTTON_APPLY_FILTERS}
    Wait Until Page Contains Element    ${BUTTON_APPLY_FILTERS}    30s
   
    Wait Until Page Contains Element    ${RESULT_TABLE}    10s
    Sleep    10s
    Scroll Element Into View    ${RESULT_TABLE}
    Wait Until Page Contains Element    ${RESULT_TABLE}    30s
    Sleep    10s
Filter the question of the Approval Status
    Wait Until Element Is Visible    ${URL_QUESTION}    20s
    Click Element    ${URL_QUESTION}

    Wait Until Element Is Visible    ${SELECT_TYPE}     20s
    Select From List By Value    ${SELECT_TYPE}    pending
    
    Sleep    10s
    Wait Until Element Is Visible    ${BUTTON_APPLY_FILTERS}     10s
    Scroll Element Into View    ${BUTTON_APPLY_FILTERS}
    Sleep    10s
    Click Element     ${BUTTON_APPLY_FILTERS}
    Wait Until Page Contains Element    ${BUTTON_APPLY_FILTERS}    30s
   
    Wait Until Page Contains Element    ${RESULT_TABLE}    10s
    Sleep    10s
    Scroll Element Into View    ${RESULT_TABLE}
    Wait Until Page Contains Element    ${RESULT_TABLE}    30s
    Sleep    10s
Filter the question of the Tag
    Wait Until Element Is Visible    ${URL_QUESTION}    20s
    Click Element    ${URL_QUESTION}

    Wait Until Element Is Visible    ${SELECT_TAG}     20s
    Select From List By Value    ${SELECT_TAG}    2

    Wait Until Element Is Visible    ${BUTTON_APPLY_FILTERS}     10s
    Scroll Element Into View    ${BUTTON_APPLY_FILTERS}
    Sleep    10s
    Click Element     ${BUTTON_APPLY_FILTERS}
    Wait Until Page Contains Element    ${BUTTON_APPLY_FILTERS}    30s
   
    Wait Until Page Contains Element    ${RESULT_TABLE}    10s
    Sleep    10s
    Scroll Element Into View    ${RESULT_TABLE}
    Wait Until Page Contains Element    ${RESULT_TABLE}    30s
    Sleep    10s
Check the filter delete button
    Wait Until Element Is Visible    ${URL_QUESTION}    20s
    Click Element    ${URL_QUESTION}

    Wait Until Element Is Visible    ${SELECT_COURSE}     20s
    Select From List By Value    ${SELECT_COURSE}   5      # SE101: Nhập môn kỹ thuật
    Wait Until Element Is Visible    ${SELECT_CLO}     20s
    Select From List By Value    ${SELECT_CLO}   3           #CLO3: Hiểu và giải thích...
    Wait Until Element Is Visible    ${SELECT_TYPE}     20s
    Select From List By Value    ${SELECT_TYPE}   essay    
    Wait Until Element Is Visible    ${SELECT_DIFFICULTY}     20s
    Select From List By Value    ${SELECT_DIFFICULTY}   easy
    Wait Until Element Is Visible    ${SELECT_BLOOM}     20s
    Select From List By Value    ${SELECT_BLOOM}   understand
    Wait Until Element Is Visible    ${SELECT_STATUS}     20s
    Select From List By Value    ${SELECT_STATUS}   inactive 
    Wait Until Element Is Visible    ${SELECT_APPROVAL_STATUS}     20s
    Select From List By Value    ${SELECT_APPROVAL_STATUS}   pending
    Wait Until Element Is Visible    ${SELECT_TAG}     20s
    Select From List By Value    ${SELECT_TAG}   2         #thuchanh
    
    Sleep    10s
    Wait Until Element Is Visible    ${BUTTON_CLEAR_FILTERS}     10s
    Scroll Element Into View    ${BUTTON_CLEAR_FILTERS}
    Sleep    10s
    Click Element     ${BUTTON_CLEAR_FILTERS}
    Wait Until Page Contains Element    ${BUTTON_CLEAR_FILTERS}    30s
   
    Wait Until Page Contains Element    ${RESULT_TABLE}    10s
    Sleep    10s
    Scroll Element Into View    ${RESULT_TABLE}
    Wait Until Page Contains Element    ${RESULT_TABLE}    30s
    Sleep    10s
See questions
    Wait Until Element Is Visible    ${URL_QUESTION}    20s
    Click Element    ${URL_QUESTION}

    Wait Until Element Is Visible    ${BUTTON_VIEW}     10s
    Scroll Element Into View    ${BUTTON_VIEW}
    Sleep    5s
    Click Element     ${BUTTON_VIEW}
Back to Question Bank
    Wait Until Element Is Visible    ${URL_QUESTION}    20s
    Click Element    ${URL_QUESTION}

    Wait Until Element Is Visible    ${BUTTON_VIEW}     10s
    Scroll Element Into View    ${BUTTON_VIEW}
    Sleep    5s
    Click Element     ${BUTTON_VIEW}
    Wait Until Element Is Visible    ${BUTTON_BACK}     10s
    Click Element     ${BUTTON_BACK}
    Sleep    5s
Add New Tag
    Wait Until Element Is Visible    ${URL_QUESTION}    20s
    Click Element    ${URL_QUESTION}

    Wait Until Element Is Visible    ${BUTTON_VIEW}     10s
    Scroll Element Into View    ${BUTTON_VIEW}
    Sleep    5s
    Click Element     ${BUTTON_VIEW}

    Wait Until Element Is Visible    ${BUTTON_ADD_NEWTAG}     10s
    Scroll Element Into View    ${BUTTON_ADD_NEWTAG}
    Sleep    5s
    Click Element     ${BUTTON_ADD_NEWTAG}
    Sleep    5s
   
Add Tag
    Wait Until Element Is Visible    ${URL_QUESTION}    20s
    Click Element    ${URL_QUESTION}

    Wait Until Element Is Visible    ${BUTTON_VIEW}     10s
    Scroll Element Into View    ${BUTTON_VIEW}
    Sleep    5s
    Click Element     ${BUTTON_VIEW}

    Wait Until Element Is Visible    ${BUTTON_ADD_NEWTAG}     10s
    Scroll Element Into View    ${BUTTON_ADD_NEWTAG}
    Sleep    5s
    Click Element     ${BUTTON_ADD_NEWTAG}

    Sleep    8s
    Wait Until Element Is Visible    ${SELECT_EXISTING_TAG}     10s
    Select From List By Value    ${SELECT_EXISTING_TAG}   3       #khó
    Input Text    ${NEW_TAG}    Bài tập khó
    Sleep    8s
    Click Element     ${BUTTON_ADD_TAG}
    Sleep    5s
Cancel Tag
    Wait Until Element Is Visible    ${URL_QUESTION}    20s
    Click Element    ${URL_QUESTION}

    Wait Until Element Is Visible    ${BUTTON_VIEW}     10s
    Scroll Element Into View    ${BUTTON_VIEW}
    Sleep    5s
    Click Element     ${BUTTON_VIEW}

    Wait Until Element Is Visible    ${BUTTON_ADD_NEWTAG}     10s
    Scroll Element Into View    ${BUTTON_ADD_NEWTAG}
    Sleep   5s
    Click Element     ${BUTTON_ADD_NEWTAG}

    Sleep    5s
    Wait Until Element Is Visible    ${SELECT_EXISTING_TAG}     10s
    Select From List By Value    ${SELECT_EXISTING_TAG}   3       #khó
    Sleep    5s
    Input Text    ${NEW_TAG}    Bài tập khó
    Wait Until Element Is Visible    ${BUTTON_CANCEL_ADDTAG}     10s
    Click Element     ${BUTTON_CANCEL_ADDTAG}
    Sleep    5s

Tag Remove
    Wait Until Element Is Visible    ${URL_QUESTION}    20s
    Click Element    ${URL_QUESTION}

    Wait Until Element Is Visible    ${BUTTON_VIEW}     10s
    Scroll Element Into View    ${BUTTON_VIEW}
    Sleep    5s
    Click Element     ${BUTTON_VIEW}

    Wait Until Element Is Visible    ${BUTTON_ADD_NEWTAG}     10s
    Scroll Element Into View    ${BUTTON_ADD_NEWTAG}
    Sleep    5s
    Click Element     ${BUTTON_ADD_NEWTAG}

    Sleep    8s
    Wait Until Element Is Visible    ${SELECT_EXISTING_TAG}     10s
    Select From List By Value    ${SELECT_EXISTING_TAG}   3       #khó
    Input Text    ${NEW_TAG}    Bài tập khó
    Wait Until Element Is Visible    ${BUTTON_ADD_TAG}     10s
    Click Element     ${BUTTON_ADD_TAG}
    
    Sleep    5s
    Wait Until Element Is Visible    ${BUTTON_REMOVE_TAG}     10s
    Scroll Element Into View    ${BUTTON_REMOVE_TAG}
    Click Element     ${BUTTON_REMOVE_TAG}
     Wait Until Element Is Visible    ${BUTTON_BACK}     10s
    Click Element     ${BUTTON_BACK}
    Sleep    3s
Edit Question
    Wait Until Element Is Visible    ${URL_QUESTION}    20s
    Click Element    ${URL_QUESTION}

    Wait Until Element Is Visible    ${BUTTON_EDIT}     10s
    Scroll Element Into View    ${BUTTON_EDIT}
    Sleep    5s
    Click Element     ${BUTTON_EDIT}

    Wait Until Element Is Visible    ${POST_COURSE}     20s
    Select From List By Value    ${POST_COURSE}   6         #SE201 - Phân tích và thiết kế ..
    Wait Until Element Is Visible    ${POST_CONTENT}     20s
    Input Text   ${POST_CONTENT}     Phương pháp tiếp cận định hướng tiến trình có hạn chế gì?
    Wait Until Element Is Visible    ${POST_TYPE}     20s
    Select From List By Value    ${POST_TYPE}   practical
    Wait Until Element Is Visible    ${POST_DIFFICULTY}     20s
    Select From List By Value    ${POST_DIFFICULTY}   medium
    Wait Until Element Is Visible    ${POST_BLOOM}     20s
    Select From List By Value    ${POST_BLOOM}   apply
    Wait Until Element Is Visible    ${POST_STATUS}     20s
    Select From List By Value    ${POST_STATUS}   inactive
    Wait Until Element Is Visible    ${POST_APPROVAL_STATUS}     20s
    Select From List By Value    ${POST_APPROVAL_STATUS}   pending

    Wait Until Element Is Visible    ${BUTTON_UPDATE_QUESTION}     10s
    Scroll Element Into View    ${BUTTON_UPDATE_QUESTION}
    Sleep    5s
    Click Element     ${BUTTON_UPDATE_QUESTION}
    Sleep    5s

Approve Question
    Wait Until Element Is Visible    ${URL_QUESTION}    20s
    Click Element    ${URL_QUESTION}

    Wait Until Element Is Visible    ${BUTTON_APPROVE}     10s
    Scroll Element Into View    ${BUTTON_APPROVE}
    Sleep    5s
    Click Element     ${BUTTON_APPROVE}
    Sleep    5s
Reject Question
    Wait Until Element Is Visible    ${URL_QUESTION}    20s
    Click Element    ${URL_QUESTION}

    Wait Until Element Is Visible    ${BUTTON_REJECT}     10s
    Scroll Element Into View    ${BUTTON_REJECT}
    Sleep    5s
    Click Element     ${BUTTON_REJECT}
    Sleep    5s
Reject Question Successfully in Detail View
    Wait Until Element Is Visible    ${URL_QUESTION}    20s
    Click Element    ${URL_QUESTION}
    Sleep    5s
    Wait Until Element Is Visible    ${BUTTON_REJECT_VIEW}     20s
    Scroll Element Into View    ${BUTTON_REJECT_VIEW}
    Sleep    5s
    Click Element     ${BUTTON_REJECT_VIEW}
    Wait Until Element Is Visible    ${BUTTON_DETAIL_REJECT}     20s
    Click Element     ${BUTTON_DETAIL_REJECT}
    Sleep    5s
Approve Question Successfully in Detail View
    Wait Until Element Is Visible    ${URL_QUESTION}    20s
    Click Element    ${URL_QUESTION}

    Wait Until Element Is Visible    ${BUTTON_DETAIL_APPROVE}     20s
    Scroll Element Into View    ${BUTTON_DETAIL_APPROVE}
    Sleep    5s
    Click Element     ${BUTTON_DETAIL_APPROVE}
    Wait Until Element Is Visible    ${BUTTON_APPROVE_VIEW}     20s
    Click Element     ${BUTTON_APPROVE_VIEW}
    Sleep    5s
Related Question Link
     Wait Until Element Is Visible    ${URL_QUESTION}    20s
    Click Element    ${URL_QUESTION}

    Wait Until Element Is Visible    ${BUTTON_VIEW}     10s
    Scroll Element Into View    ${BUTTON_VIEW}
    Sleep    5s
    Click Element     ${BUTTON_VIEW}

    Wait Until Element Is Visible    ${LINK_RELATED}     10s
    Scroll Element Into View    ${LINK_RELATED}
    Sleep    5s
    Click Element     ${LINK_RELATED}
    Wait Until Element Is Visible    ${BUTTON_BACK}     10s
    Click Element     ${BUTTON_BACK}
    Sleep    3s
Course Link
     Wait Until Element Is Visible    ${URL_QUESTION}    20s
    Click Element    ${URL_QUESTION}

    Wait Until Element Is Visible    ${BUTTON_VIEW}     10s
    Scroll Element Into View    ${BUTTON_VIEW}
    Sleep    5s
    Click Element     ${BUTTON_VIEW}

    Wait Until Element Is Visible    ${LINK_COURSE}     10s
    Scroll Element Into View    ${LINK_COURSE}
    Sleep    5s
    Click Element     ${LINK_COURSE}
    Sleep    3s
CLO Link
    Wait Until Element Is Visible    ${URL_QUESTION}    20s
    Click Element    ${URL_QUESTION}

    Wait Until Element Is Visible    ${BUTTON_VIEW}     10s
    Scroll Element Into View    ${BUTTON_VIEW}
    Sleep    5s
    Click Element     ${BUTTON_VIEW}

    Wait Until Element Is Visible    ${LINK_CLO}     10s
    Scroll Element Into View    ${LINK_CLO}
    Sleep    5s
    Click Element     ${LINK_CLO}
    Sleep    3s
Nav Add New Question
    Wait Until Element Is Visible    ${URL_QUESTION}    20s
    Click Element    ${URL_QUESTION}
    Wait Until Element Is Visible    ${BUTTON_ADD_QUESTION}     10s
    Scroll Element Into View    ${BUTTON_ADD_QUESTION}
    Sleep    5s
    Click Element     ${BUTTON_ADD_QUESTION}
Back to Question
    Wait Until Element Is Visible    ${URL_QUESTION}    20s
    Click Element    ${URL_QUESTION}
    Wait Until Element Is Visible    ${BUTTON_ADD_QUESTION}     10s
    Scroll Element Into View    ${BUTTON_ADD_QUESTION}
    Sleep    5s
    Click Element     ${BUTTON_ADD_QUESTION}
    Wait Until Element Is Visible    ${BUTTON_BACK}     10s
    Click Element     ${BUTTON_BACK}
Search with keyword valid question
    Wait Until Element Is Visible    ${URL_QUESTION}    20s
    Click Element    ${URL_QUESTION}
    Wait Until Element Is Visible    ${CHECK_QUESTION}     10s
    Scroll Element Into View    ${CHECK_QUESTION}
    Sleep     10s
    Select Checkbox    ${CHECK_QUESTION}

    Wait Until Element Is Visible    ${INPUT_SEARCH}     10s
    Input Text   ${INPUT_SEARCH}     abc
    Sleep    5s
    Wait Until Element Is Visible    ${BUTTON_APPLY_FILTERS}     10s
    Scroll Element Into View    ${BUTTON_APPLY_FILTERS}
    Sleep    10s
    Click Element     ${BUTTON_APPLY_FILTERS}
    Wait Until Page Contains Element    ${BUTTON_APPLY_FILTERS}    30s
   
    Wait Until Page Contains Element    ${RESULT_TABLE}    10s
    Sleep    10s
    Scroll Element Into View    ${RESULT_TABLE}
    Wait Until Page Contains Element    ${RESULT_TABLE}    30s
    Sleep    10s
Search with empty keywords
    Wait Until Element Is Visible    ${URL_QUESTION}    20s
    Click Element    ${URL_QUESTION}
    Wait Until Element Is Visible    ${CHECK_QUESTION}     10s
    Scroll Element Into View    ${CHECK_QUESTION}
    Sleep     10s
    Select Checkbox    ${CHECK_QUESTION}
    Sleep    5s
    Wait Until Element Is Visible    ${BUTTON_APPLY_FILTERS}     10s
    Scroll Element Into View    ${BUTTON_APPLY_FILTERS}
    Sleep    10s
    Click Element     ${BUTTON_APPLY_FILTERS}
    Wait Until Page Contains Element    ${BUTTON_APPLY_FILTERS}    30s
   
    Wait Until Page Contains Element    ${RESULT_TABLE}    10s
    Sleep    10s
    Scroll Element Into View    ${RESULT_TABLE}
    Wait Until Page Contains Element    ${RESULT_TABLE}    30s
    Sleep    10s
Search with keywords not in the question
    Wait Until Element Is Visible    ${URL_QUESTION}    20s
    Click Element    ${URL_QUESTION}
    Wait Until Element Is Visible    ${CHECK_QUESTION}     10s
    Scroll Element Into View    ${CHECK_QUESTION}
    Sleep     10s
    Select Checkbox    ${CHECK_QUESTION}

    Wait Until Element Is Visible    ${INPUT_SEARCH}     10s
    Input Text   ${INPUT_SEARCH}     Short Answer.$526
    Sleep    5s
    Wait Until Element Is Visible    ${BUTTON_APPLY_FILTERS}     10s
    Scroll Element Into View    ${BUTTON_APPLY_FILTERS}
    Sleep    10s
    Click Element     ${BUTTON_APPLY_FILTERS}
    Wait Until Page Contains Element    ${BUTTON_APPLY_FILTERS}    30s
   
    Wait Until Page Contains Element    ${RESULT_TABLE}    10s
    Sleep    10s
    Scroll Element Into View    ${RESULT_TABLE}
    Wait Until Page Contains Element    ${RESULT_TABLE}    30s
    Sleep    10s
    # Wait Until Page Contains Element    ${RESULT_FAILD}    10s
    # Sleep    10s
    # Scroll Element Into View    ${RESULT_FAILD}
    # Wait Until Page Contains Element    ${RESULT_FAILD}    30s
    # Sleep    10s
Import Question
    Wait Until Element Is Visible    ${URL_QUESTION}    20s
    Click Element    ${URL_QUESTION}
    Wait Until Element Is Visible    ${BUTTON_IMPORT_QUESTION}    20s
    Click Element    ${BUTTON_IMPORT_QUESTION}
Manage Tag
    Wait Until Element Is Visible    ${URL_QUESTION}    20s
    Click Element    ${URL_QUESTION}
    Wait Until Element Is Visible    ${BUTTON_MANAGER_TAG}    20s
    Click Element    ${BUTTON_MANAGER_TAG}
Edit questions in the detailed view
    [Arguments]    ${course_value}    ${content_text}    ${type_value}    ${difficulty_value}
    Wait Until Element Is Visible    ${URL_QUESTION}    20s
    Click Element    ${URL_QUESTION}
    Wait Until Element Is Visible    ${BUTTON_VIEW}     10s
    Scroll Element Into View    ${BUTTON_VIEW}
    Sleep    5s
    Click Element     ${BUTTON_VIEW}
    Wait Until Element Is Visible    ${BUTTON_EDIT_VIEW}     10s
    Click Element     ${BUTTON_EDIT_VIEW}

    Wait Until Element Is Visible    ${POST_COURSE}     20s
    Select From List By Value    ${POST_COURSE}    ${course_value}
    Wait Until Element Is Visible    ${POST_CONTENT}     20s
    Input Text    ${POST_CONTENT}    ${content_text}
    Wait Until Element Is Visible    ${POST_TYPE}     20s
    Select From List By Value    ${POST_TYPE}    ${type_value}
    Wait Until Element Is Visible    ${POST_DIFFICULTY}     20s
    Select From List By Value    ${POST_DIFFICULTY}    ${difficulty_value}
    
    Wait Until Element Is Visible    ${BUTTON_UPDATE_QUESTION}     10s
    Scroll Element Into View    ${BUTTON_UPDATE_QUESTION}
    Sleep    5s
    Click Element     ${BUTTON_UPDATE_QUESTION}
    Sleep    5s
Check back button in edit view
    Wait Until Element Is Visible    ${URL_QUESTION}    20s
    Click Element    ${URL_QUESTION}
    Wait Until Element Is Visible    ${BUTTON_VIEW}     10s
    Scroll Element Into View    ${BUTTON_VIEW}
    Sleep    5s
    Click Element     ${BUTTON_VIEW}
    Wait Until Element Is Visible    ${BUTTON_EDIT_VIEW}     10s
    Click Element     ${BUTTON_EDIT_VIEW}
    Sleep    3s
    Wait Until Element Is Visible    ${BUTTON_BACK}     10s
    Click Element     ${BUTTON_BACK}




