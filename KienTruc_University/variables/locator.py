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


