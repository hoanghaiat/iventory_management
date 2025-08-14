# dangnhap
URL   = 'https://demo-clo.minds.vn/'
USERNAME_INPUT = "xpath=//input[@id='id_username']"
PASSWORD_INPUT = "xpath=//input[@id='id_password']"
LOGIN_BUTTON   = "xpath=//button[text()='Đăng nhập']"

BTN_HIDE ='//a[@id="djHideToolBarButton"]'
# DuyetCauhoi
URL_QUESTION = "//div[@class='menu-section']//a[contains(@href, '/questionbank/questions/')][1]"
BUTTON_APPLY_FILTERS = "//button[@type='submit' and @class='btn btn-primary']"
BUTTON_CLEAR_FILTERS = '//a[@class="btn btn-secondary"]'
BUTTON_VIEW = '//a[contains(@href,"/questionbank/questions/147") and @class="btn btn-sm btn-primary"]'
BUTTON_BACK = '//a[contains(@href,"/questionbank/questions") and @class="btn btn-secondary"]'
BUTTON_ADD_NEWTAG = '//button[@data-bs-target="#addTagModal"]'
BUTTON_ADD_TAG = '//button[@class="btn btn-primary"]'
BUTTON_CANCEL_ADDTAG = '//button[@class="btn btn-secondary"]'
BUTTON_REMOVE_TAG = '//a[@class="text-white ms-1"]'
BUTTON_EDIT = '//a[contains(@href,"/questionbank/questions/147/update/") and @class="btn btn-sm btn-warning"]'
BUTTON_APPROVE = '//a[contains(@href,"/questionbank/questions/146/approve/") and @class="btn btn-sm btn-success"]'
BUTTON_REJECT = '//a[contains(@href,"/questionbank/questions/145/reject/") and @class="btn btn-sm btn-danger"]'
BUTTON_UPDATE_QUESTION = '//button[@class="btn btn-primary"]'
BUTTON_ADD_QUESTION = '//a[contains(@href,"/questionbank/questions/create/") and @class="btn btn-primary"]'
BUTTON_CREATE_QUESTION = '//button[@class="btn btn-primary"]'
BUTTON_IMPORT_QUESTION = '//a[contains(@href,"/questionbank/questions/import/") and @class="btn btn-success"]'
BUTTON_MANAGER_TAG = '//a[contains(@href,"/questionbank/tags/") and @class="btn btn-info"]'
BUTTON_EDIT_VIEW = '//a[contains(@href,"/questionbank/questions/147/update/") and @class="btn btn-warning"]'
BUTTON_APPROVE_VIEW = '//a[contains(@href,"/questionbank/questions/151") and @class="btn btn-sm btn-primary"]'
BUTTON_REJECT_VIEW = '//a[contains(@href,"/questionbank/questions/152") and @class="btn btn-sm btn-primary"]'
BUTTON_DETAIL_APPROVE = '//div[@class="btn-group"]/a[@class="btn btn-success"]' 
BUTTON_DETAIL_REJECT = '//div[@class="btn-group"]/a[@class="btn btn-danger"]' 

SELECT_COURSE = '//select[@id="course_id"]'
SELECT_CLO = '//select[@id="clo_id"]'
SELECT_TYPE = '//select[@id="type"]'
SELECT_DIFFICULTY = '//select[@id="difficulty"]'
SELECT_BLOOM = '//select[@id="bloom_level"]'
SELECT_STATUS = '//select[@id="status"]'
SELECT_APPROVAL_STATUS = '//select[@id="approval_status"]'
SELECT_TAG = '//select[@id="tag_id"]'
SELECT_EXISTING_TAG = '//select[@id="tag_id"]'

NEW_TAG = '//input[@id="tag_name"]'
RESULT_TABLE = '//div[contains(@class,"card question-card")][1]'
CHECK_QUESTION = "//input[@id='my_questions']"
INPUT_SEARCH = '//input[@placeholder="Search in question content..."]'
# RESULT_FAILD = '//div[@class="alert alert-info text-center"]'

POST_COURSE = '//select[@id="id_course"]'
POST_CONTENT = '//textarea[@id="id_content"]'
POST_TYPE = '//select[@id="id_type"]'
POST_DIFFICULTY = '//select[@id="id_difficulty"]'
POST_BLOOM = '//select[@id="id_bloom_level"]'
POST_STATUS = '//select[@id="id_status"]'
POST_APPROVAL_STATUS = '//select[@id="id_approval_status"]'

LINK_RELATED = '//a[contains(@href,"questionbank/questions/3/")]'
LINK_COURSE = '//a[contains(@href,"/academics/courses/6/")]'
LINK_CLO = '//a[contains(@href,"/academics/clos/10/")]'


# TaomoiCauhoi
URL_NEW_QUESTION = "//div[@class='menu-section']//a[contains(@href, '/questionbank/questions/')][2]"
URL_MANAGE_TAGS = "//div[@class='menu-section']//a[contains(@href, '/questionbank/tags/')]"
URL_IMPORT_QUESTION = "//div[@class='menu-section']//a[contains(@href, '/questionbank/questions/')][3]"

# Bài kiểm tra
URL_TEST = "//div[@class='menu-section']//a[contains(@href, '/assessment/tests/')]"
NAV_MY_CLASSES = '//a[contains(@href, "/academics/classes/") and @class="btn btn-secondary"]'
NAV_COURSES = '//div[@class="table-responsive"]/table/tbody/tr[1]/td[2]/a[contains(@href,"/academics/classes/")]'
BTN_VIEW = '//div[@class="btn-group"]//a[contains(@href,"/assessment/tests/3/") and @class="btn btn-sm btn-primary"]'
BTN_HELP = '//div[@class="btn-group"]//a[contains(@href,"/assessment/tests/3/") and @class="btn btn-sm btn-info"]'
BTN_GRADE = '//div[@class="btn-group"]//a[contains(@href,"/assessment/tests/3/") and @class="btn btn-sm btn-success"]'
BTN_EXPORT = '//div[@class="btn-group"]//a[contains(@href,"/reports/tests/3/") and @class="btn btn-sm btn-secondary"]'

TEST_LIST = '//div[@class="table-responsive"]/table/tbody/tr[5]'
FILTER_ALL = '//div[@class="btn-group"]/a[normalize-space(text())="All"]'
FILTER_MIDTERM = '//div[@class="btn-group"]/a[normalize-space(text())="Midterm"]'
FILTER_FINAL = '//div[@class="btn-group"]/a[normalize-space(text())="Final"]'
FILTER_QUIZ = '//div[@class="btn-group"]/a[normalize-space(text())="Quiz"]'
FILTER_ASIGNMENT = '//div[@class="btn-group"]/a[normalize-space(text())="Assignment"]'
FILTER_PROJECT = '//div[@class="btn-group"]/a[normalize-space(text())="Project"]'

# BaoCaoCLO
URL_REPORT_CLO = "//div[@class='menu-section']//a[contains(@href, '/reports/clo-reports/')]"

INPUT_SEARCH_CLO = '//input[@placeholder="Search reports..."]'
BTN_SEARCH_CLO = '//form[@class="d-flex"]/button[@class="btn btn-primary"]'
BTN_VIEW_CLO = '//a[@href="/en/reports/clo-reports/6/"]'
BTN_PRINT_CLO = '//button[@class="btn btn-primary" and @onclick="printReport(6)"]'
BTN_BACK_CLO = '//a[contains(@href,"/en/reports/clo-reports/") and @class="btn btn-secondary"]'
RESULT_TABLE_CLO = '//div[@class="table-responsive"]/table/tbody/tr[5]'
RESULT_TABLE_VIEW = '//div[@class="table-responsive"]/table/tbody/tr[5]'
BTN_PRINT_REPORT = '//button[@class="btn btn-primary" and @onclick="window.print();"]'
BTN_CANCEL_PRINT = ''
BTN_SEARCH_STUDENT = '//button[@id="searchToggle"]'
IP_SEARCH_STUDENT = '//input[@placeholder="Search student name..."]'
RESULT_TABLE_STUDENT = '//div[@class="table-responsive"]/table/tbody/tr[3]'

# phân tích bai kiem tra
URL_TEST_ANALYSES = "//div[@class='menu-section']//a[contains(@href,'/reports/test-analyses/')]"
INPUT_SEARCH_TEST_ANALYSES = '//input[@placeholder="Search test analyses..."]'
BTN_SEARCH_TEST_ANALYSES = '//form[@class="d-flex"]/button[@class="btn btn-primary"]'
BTN_VIEW_TEST_ANALYSES = '//a[@href="/en/reports/test-analyses/4/"]'
BTN_PRINT_TEST_ANALYSES = '//div[@class="table-responsive"]/table/tbody/tr[1]/td[6]/div/button'
RESULT_TABLE_TEST_ANALYSES = '//div[@class="table-responsive"]/table/tbody/tr[5]'
BTN_BACK_TEST_ANALYSES = '//a[contains(@href,"/en/reports/test-analyses/") and @class="btn btn-secondary"]'





