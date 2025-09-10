# =========================
# Student Profile Locators
# =========================
URL = "https://demo-clo.minds.vn/en/accounts/login/"
BROWSER = "Chrome"

# Account
USERNAME = "student1"
PASSWORD = "demostudent"

# Buttons
EDIT_PROFILE_BUTTON = '//a[@href="/en/accounts/profile/update/"]'
UPDATE_PROFILE_BUTTON = '//div/button[@type="submit"]'
LOGOUT_BUTTON = '//li//form//button[@type="submit"]'
LOGIN_BTN="//button[@type='submit']"

# Form Fields
USENAME_FIELDS = "xpath=//*[@id='id_username']"
EMAIL_FIELDS = "xpath=//*[@id='id_email']"
FIRST_NAME_FIELDS = "xpath=//*[@id='id_first_name']"
LAST_NAME_FIELDS = "xpath=//*[@id='id_last_name']"
PHONE_FIELDS = "xpath=//*[@id='id_phone']"
DEPARTMENT_FIELDS = "xpath=//*[@id='id_department']"
SPECIALIZATION_FIELDS = "xpath=//*[@id='id_specialization']"

# Messages
SUCCESS_MESSAGE = '//div[@class="alert alert-success alert-dismissible fade show"]'
ERROR_MESSAGES = {
    "username": "xpath=//*[@id='error_1_id_username']/strong",
    "email": "xpath=//*[@id='error_1_id_email']/strong"
}

# =========================
# Program UI Locators
# =========================
BASE_LOGIN_URL = "https://demo-clo.minds.vn/en/accounts/login/"
BASE_URL_ROOT = "https://demo-clo.minds.vn/en/"
MENU_PROGRAMS = "xpath=//a[contains(.,'Chương trình đào tạo') or contains(.,'Program')]"
TAB = '//*[@id="djHideToolBarButton"]'
SETTING_PROFILE='//button[@class="btn btn-link text-white"]'
PROFILE_BTN='//a[@href="/en/accounts/profile/"]'
LOADING ="//div[contains(@class,'loading')]"

# Program list page
PROGRAMS_PAGE_TITLE = '//div/h1[text()="Quản lý chương trình"]'
SEARCH_BOX ='//input[@name="q"]'
SEARCH_BTN='//button[@class="btn btn-primary"]'
RESULT_TABLE='//div[@class="card-body"]'
RESULT_TITLE='//table//td'
ADD_ONE_LINK="//a[contains(@href, '/programs/') and contains(@href, '/courses/create/') and text()='Add one?']"
PROGRAMS_TABLE_ROWS = "xpath=//table//tbody//tr"

# First program row
FIRST_PROGRAM_ROW = "(//table//tbody//tr)[1]"
FIRST_PROGRAM_NAME_CELL = "(//table//tbody//tr)[1]//td[1]"
FIRST_PROGRAM_VIEW_BTN = "(//table//tbody//tr)[1]//a[contains(@class,'btn') and (descendant::i[contains(@class,'eye') or contains(@class,'fa-eye')] or descendant::svg)]"
FIRST_PROGRAM_COURSES_BTN = "(//table//tbody//tr)[1]//a[normalize-space(.)='Courses' or contains(.,'Courses')]"
DETAIL_PROGRAM_TITLE = '//h1[@class="content-title"]'
DETAIL_COURSE_TITLE =  '//div/h1[@class="content-title"]'
# Courses page top actions
COURSES_PAGE_TITLE = '//div/h1[@class="content-title"]'


# Courses table and first course row
COURSES_TABLE_ROWS = '//div[@class="card-body"]'
FIRST_COURSE_ROW = '(//table//tbody//tr)[1]'
FIRST_COURSE_VIEW_BTN = "(//table//tbody//tr)[1]//a[contains(@class,'btn') and (descendant::i[contains(@class,'eye') or contains(@class,'fa-eye')] or descendant::svg)]"

# Create Course form
CREATE_COURSE_FORM = '//div[contains(@class,"card-body p-4")]'

# Generic messages
NO_RESULT_TEXT_PROGRAMS = '//div[@class="alert alert-info"]'
NO_RESULT_TEXT_COURSES = '//div[@class="alert alert-info"]'

SEE_ALL_BTN = '//a[@class="btn btn-sm btn-info"]'
VIEW_COURSE_BTN ='//a[contains(@class,"btn btn-sm btn-outline-primary")]'
ALL_COURSES_BTN = '//a[contains(@class,"btn btn-primary")]'
ADD_COURSES_BTN ='//a[contains(@class,"btn btn-success")]'
BACK_TO_PROGRAM ='//a[contains(@class,"btn btn-secondary")]'
URL_ALL_COURSE = '//h1[@class="content-title"]'
URL_PROGRAM = '//h1[@class="content-title"]'
HOME_URL ='//a[text()="Trang chủ"]'

EYE_BTN = '//tbody//tr//td//div//a[contains(@class,"btn btn-info")]'
EDIT_BTN= '//tbody//tr//td//div//a[contains(@class,"btn btn-primary")]'
VIEW_CLOS_BTN ='//tbody//tr//td//div//a[contains(@class,"btn btn-success")]'
DETAIL_COURSE_TITLE = '//h1[@class="content-title"]'
EDIT_COURSE_TITLE ='//h1[@class="content-title"]'
CLO_TITLE ='//h1[@class="content-title"]'


MENU_COURSE = '//a[@href="/en/academics/courses/"]' 
SEARCH_BOX_COURSE = "//input[@type='text' and @placeholder='Search courses...']"
COURSES_TABLE_ROWSS = "//div[@class='card-body']" 
FIRST_COURSE_NAME_CELL = "xpath=/html/body/div[3]/div[2]/div[2]/div[2]/div[1]/table/tbody/tr[1]/td[7]"
EDIT_COURSE_BTN = '//a[@href="/en/academics/courses/1/update/"]'
DEATAIL_COURSE_TABLE = '//div[@class="col-lg-6 mb-4"]'

SEARCH_BOX_CLO = '//input[@type="text" and @placeholder="Search courses..."]'
PROGRAM_BUTTON ='//a[@href="/en/academics/programs/"]'

BACK_TO_COURSE = '//a[@href="/en/academics/courses/1/"]'
PROGRAM_DROP='//select[@id="id_program"]'
PROGRAM_OPT ='//option[@value="5"]'
COURSE_CODE_FIELD ='//input[@id="id_course_code"]'
COURSE_NAME_FILED='//input[@id="id_course_name"]'
CREDIT_FIELD='//input[@id="id_credits"]'
DESCRIPTION_FIELD='//textarea[@id="id_description"]'
TYPE_DROP = '//select[@id="id_type"]'
TYPE_OPT = '//option[@value="mandatory"]'
STATUS_DROP= '//select[@id="id_status"]'
STATUS_OPT = '//option[@value="completed"]'

PREREQUISITE_COURSE_DROP='//select[@id="id_prerequisite_courses"]'
PREREQUISITE_COURSE_OPT='//select[@id="id_prerequisite_courses"]/option[@value="4"]'
UPDATE_COURSE_BTN ="//button[@type='submit' and contains(@class,'btn-primary')]"
SUCCESS_UPDATE_MESSAGE ='//div[contains(@class,"alert-success")]'
ERROR_UPDATE_MESSAGES = {
    "program": "//strong[contains(text(),'This field is required')]",
    "course code": "//strong[contains(text(),'This field is required')]",
    "course name": "//strong[contains(text(),'This field is required')]",
    "credit": "//strong[contains(text(),'This field is required')]",
    "description": "//strong[contains(text(),'This field is required')]"
}  
MANDATORY ='//span[@class="badge bg-primary me-2"]'
ELECTIVE='//span[@class="badge bg-secondary me-2"]'
ACTIVE='//span[@class="badge bg-success"]'
COMPLETED='//span[@class="badge bg-secondary"]'
UPDATED='//span[@class="badge bg-warning"]'


VIEW_CLOC_BTN = '(//a[contains(@href, "/clos/")])[1]'
EDIT_COURSE='//tbody//tr//td//div//a[contains(@class,"btn btn-primary")]'
VIEW_DETAIL_COURSE_BTN='//tbody//tr//td//div//a[contains(@class,"btn btn-info")]'

ADD_CLO_BTN ='//div//a[contains(@class,"btn btn-primary")]'
CLO_CREATE_TITLE ='//h1[@class="content-title"]'
BACK_TO_CLOS_BTN='//div//a[contains(@class,"btn btn-secondary")]'

COURSE_DROP ='//select[@id="id_course"]'
CLO_CODE='//input[@id="id_clo_code"]'
DESCRIPTION_CLO ='//textarea[@id="id_description"]'
CATEGORY_CLO_DROP='//select[@id="id_category"]'
LEVEL_CLO_DROP='//select[@id="id_level"]'
WEIGHT_CLO='//input[@id="id_weight"]'
ASSESSMENT_METHOD_DROP='//select[@id="id_assessment_method"]'
CREATE_CLO_BTN='//button[@class="btn btn-primary"]'
SUCCESS_CLO_MESSAGE ='//div[@class="alert alert-success alert-dismissible fade show"]'
ERROR_CREATE_CLO_MESSAGES = {
    "course": "//strong[contains(text(),'This field is required')]",
    "clo code": "//strong[contains(text(),'This field is required')]",
    "description": "//strong[contains(text(),'This field is required')]",
    "category": "//strong[contains(text(),'This field is required')]",
    "level": "//strong[contains(text(),'This field is required')]",
    "weight": "//strong[contains(text(),'This field is required')]",
    "assessment method": "//strong[contains(text(),'This field is required')]",
}  
WARNING_MESSAGE_WEIGHT='//p[@id="error_1_id_weight"]'
EDIT_CLO_BTN='//a[contains(@href, "/en/academics/clos/") and contains(@href, "/update/")][1]'
PLO_BTN='//a[contains(@href, "/en/academics/clos/") and contains(@href, "/plo-mapping/create/")]'
CLO_TITLE='//h1[@class="content-title"]'
UPDATE_CLO_BTN='//button[@class="btn btn-primary"]'
UPDATE_CLO_SUCCESS_MES='//div[@class="alert alert-success alert-dismissible fade show"]'
ERROR_INVALID_MESS='//p[@id="error_1_id_weight"]'
BACK_TO_CLOS ='//a[@class="btn btn-secondary"]'
COURSE_TITLE='//h1[@class="content-title"]'
PLO_TITLE='//h1[@class="content-title"]'
ADD_MAPPING_BTN ='//a[@class="btn btn-sm btn-primary"]'
CREATE_ONE_LINK='//a[@class="alert-link"]'
PLO_BTN='//a[@class="btn btn-success"]'
PLO_DROP='//select[@id="id_plo"]'
MAPPING_LEVEL_DROP='//select[@id="id_mapping_level"]'
CREATE_MAPPING_BTN='//button[@class="btn btn-primary"]' 
ERROR_CREATE_PLO_MESSAGES = {
    "plo": "//strong[contains(text(),'This field is required')]",
    "mapping": "//strong[contains(text(),'This field is required')]"
}

EDIT_COURSE_VN="(//a[contains(@href, '/courses/') and contains(@href, '/update/') and contains(@class, 'btn-primary')])"
VIEW_CLOs=" (//a[contains(@href, '/courses/') and contains(@href, '/clos/') and contains(@class, 'btn-success')])"
CREATE_CLASS = "(//a[contains(@href, '/classes/create/') and contains(@class, 'btn-info')])"
BACK_TO_LIST_COURSE="(//a[contains(@href, '/programs/') and contains(@href, '/courses/') and contains(@class, 'btn-secondary')])"
ADD_CLOS_BTN="(//a[contains(@href, '/courses/') and contains(@href, '/clos/create')])"
ADD_CHAPTER_BTN="(//a[contains(@href, '/courses/') and contains(@href, '/contents/create')])"
ADD_EXAM_BTN=" (//a[contains(@href, '/courses/') and contains(@href, '/assessments/create')])"
CREATE_CLASS_BTN=" (//a[contains(@href, '/courses/') and contains(@href, '/classes/create')])"
CREATE_CLASS_TITLE='//h1[@class="content-title"]'
ADD_CHAPTER_TITLE='//h1[@class="content-title"]' 
SETTING_BTN='//a[@class="btn btn-outline-secondary btn-sm ms-2"]'
CLO_SETTING_TITLE='//h1[@class="h3 mb-0 text-gray-800"]'
EDIT_EVALUATE_TITLE='//div[@class="d-flex justify-content-between align-items-center mb-4"]'
ERROR_DELETE_TITLE='//h5[@class="mb-0"]'
ADD_EVALUATE_TITLE='//h1[@class="content-title"]'

SEARCH_BOX_COURSES='//button[@class="btn btn-primary"]'
SEARCH_BOX_IN_COURSE='//input[@name="q"]'