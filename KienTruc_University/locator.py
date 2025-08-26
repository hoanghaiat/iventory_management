LOGO = '//div[@class="logo"]'
USER = '//div[@class="user-avatar"]'
#login
USERNAME_INPUT = "//input[@id='id_username']"
PASSWORD_INPUT = "//input[@id='id_password']"
LOGIN_BUTTON = "//button[text()='Đăng nhập']"



## DashBoard
MESSAGE_ERROR_LOGIN_V = '//div[contains(@class,"alert") and contains(@class,"error")]'
MESSAGE_ERROR_LOGIN_E = '//div[contains(@class,"alert") and contains(@class,"danger")]'

BOX_ADVERTISE          = '//div[contains(@id,"djDebugToolbar")]'
LINK_HANDLE            = '//a[contains(@id,"djHideToolBarButton")]'

LINK_QUICK_OPERATION   = '//a[contains(@href,"/en/academics/programs/create/")]'
ACTUAL_QUICK_OPERATION = '//h1[contains(text(),"403") or contains(text(),"Forbidden")]'
##Chương trình đào tạo
URL_CTDT             = '//a[contains(@href,"/en/academics/programs/")]'
TITLE_PAGE           = '//h1[contains(@class,"content-title")]'

INPUT_SEARCH         = '//input[contains(@placeholder,"Search programs")]'
BTN_SEARCH           = '//button[contains(@class,"btn") and contains(@class,"btn-primary")]'

EXPECTED_SEARCH      = '//table[contains(@class,"table-hover")]//tbody/tr/td[1]'
ACTUAL_SEARCH_NOT    = '//div[contains(@class,"alert") and contains(@class,"info")]'

URL_INFO             = '//a[@href="/en/academics/programs/${id}/"]'

URL_PLOO = '//a[@href="/en/academics/programs/${id}/plos/create/"]'

INPUT_PLO_CODE= '//input[@id="id_plo_code"]'
TEXTAREA_DESCRIPTION ='//textarea[@id="id_description"]'
SELECT_CATEGORY ='//select[@id="id_category"]'
SELECT_LEVEL ='//select[@id="id_level"]'
INPUT_VERSION = '//input[@id="id_version"]'
BTN_CREATE = '//button[@class="btn btn-primary"]'
ACTUAL_PLO = "(//div[@id='ploAccordion']//div[contains(@class, 'accordion-item')])[last()]//h2//strong"
URL_EXIT_PLO = '//a[@href="/en/academics/programs/5/" and @class = "btn btn-secondary"]'

URL_CREATE_SECTION_STUDY ='//a[@href="/en/academics/programs/${id}/courses/create/"]'

INPUT_COURSE_CODE = '//input[@id="id_course_code"]'
INPUT_COURSE_NAME = '//input[@id="id_course_name"]'
INPUT_CREDITS = '//input[@id="id_credits"]'
TEXTAREA_DESCRIPTION_COURSE = '//textarea[@id="id_description"]'
SELECT_TYPE_COURSE = '//select[@id="id_type"]'
CHECKBOX_CORE_SUBJECT = '//input[@id="id_is_core"]'
SELECT_STATUS_COURSE = '//select[@id="id_status"]'
BTN_CREATE_COURSE = '//button[@class="btn btn-primary"]'

ACTUAL_COURSE_CODE = '//table[@class="table table-bordered"]//tbody/tr[last()]/td[1]/strong'
ACTUAL_COURSE_NAME = '//table[@class="table table-bordered"]//tbody/tr[last()]/td[2]'
ACTUAL_COURSE_CREDITS = '//table[@class="table table-bordered"]//tbody/tr[last()]/td[3]'
ACTUAL_COURSE_TYPE = '//table[@class="table table-bordered"]//tbody/tr[last()]/td[4]/span'
ACTUAL_COURSE_STATUS = '//table[@class="table table-bordered"]//tbody/tr[last()]/td[last()-1]/span'

MESSAGE_ACTUAL_COURSE = '//div[@class="alert alert-success alert-dismissible fade show"]'

URL_ALL_SECTION_STUDY = '//a[@href="/en/academics/programs/${id}/courses/"]'

ACTUAL_ALL_SECTION_STUDY = '//h1[contains(text(),"Courses for Công nghệ thông tin")]'
URL_COURSE_DETAILS = '//a[@href="/en/academics/courses/${id}/"]'
ACTUAL_COURSE_DETAILS ='//h6[contains(text(),"Thông tin học phần")]'

URL_EDIT_COURSE = '//a[@href="/en/academics/courses/${id}/update/"]'
ACTUAL_EDIT_COURSE = '//h1[@class="content-title"]'
URL_BACK_TO_COURSE = '//a[@class="btn btn-secondary"]'

URL_CREATE_CLASS = '//a[@href="/en/academics/courses/${id}/classes/create/" and @class="btn btn-info"]'
ACTUAL_CREATE_CLASS = '//h1[@class="content-title"]'
INPUT_SEMESTER = '//input[@id="id_semester"]'
INPUT_ACADEMIC_YEAR = '//input[@id="id_academic_year"]'
SELECT_STATUS_CLASS = '//select[@id="id_status"]'
INPUT_START_DATE = '//input[@id="id_start_date"]'
INPUT_END_DATE = '//input[@id="id_end_date"]'
INPUT_ROOM= '//input[@id="id_room"]'
INPUT_MAX_STUDENTS = '//input[@id="id_max_students"]'
TEXTATEA_SCHEDULE = '//textarea[@id="id_schedule"]'
CREAT_CLASS_BTN = '//button[@class="btn btn-primary"]'

URL_BACK_TO_COURSE_DETAILS = '//a[@href="/en/academics/programs/${id}/courses/"]'
ACTUAL_BACK_TO_COURSE_DETAILS = '//h1[contains(text(),"Courses for Công nghệ thông tin")]'

URL_PAGE_CLOS = '//a[@href="/en/academics/courses/${id}/clos/"]'
ACTUAL_TITLE_CLOS = '//h1[contains(text(),"CLOs for CNTT011 - Kiểm thử phần mềm12")]'
URL_ADD_CLO = '//a[@href="/en/academics/courses/${id}/clos/create/"]'
INPUT_CLO_CODE = '//input[@id="id_clo_code"]'
TEXTAREA_DESCRIPTION_CLO = '//textarea[@id="id_description"]'
SELECT_CATEGORY_CLO = '//select[@id="id_category"]'
SELECT_LEVEL_CLO = '//select[@id="id_level"]'
INPUT_WEIGHT_CLO = '//input[@id="id_weight"]'
SELECT_ASSESSMENT_METHOD = '//select[@id="id_assessment_method"]'
CREATE_CLO_BTN = '//button[@class="btn btn-primary"]'
ACTUAL_MESSAGE_CLO= '//div[@class="alert alert-success alert-dismissible fade show"]'

ACTUAL_CLO_CODE = '//table[@class="table table-bordered table-hover"]/tbody/tr[1]/td[1]'
ACTUAL_DESCRIPTION_CLO = '//table[@class="table table-bordered table-hover"]/tbody/tr[1]/td[2]'
ACTUAL_CATEGORY_CLO = '//table[@class="table table-bordered table-hover"]/tbody/tr[1]/td[3]/span'
ACTUAL_LEVEL_CLO = '//table[@class="table table-bordered table-hover"]/tbody/tr[1]/td[4]/span'
ACTUAL_WEIGHT_CLO = '//table[@class="table table-bordered table-hover"]/tbody/tr[1]/td[5]'

ACTUAL_MESSAGE_CLO_ERROR= '//p[@id="error_1_id_clo_code"]'
URL_BACK_TO_CLOS = '//a[@href="/en/academics/courses/${id}/clos/"]'
URL_DETAILS_CLOS= '//a[@href="/en/academics/clos/${id}/"]'
TITLE_PAGE_DETAIL_CLOS = '//h6[contains(text(),"CLO Details")]'
URL_EDIT_CLOS='//a[@href="/en/academics/clos/${id}/update/"]'
TITLE_PAGE_EDIT_CLOS= '//h1[contains(text(),"Edit CLO")]'

URL_PLO = '//a[@href="/en/academics/clos/${id}/plo-mapping/create/"]'
TITLE_PLO ='//h1[contains(text(),"Map CLO to PLO")]'
SELECT_PLO = '//select[@id="id_plo"]'
SELECT_MAPPING_PLO = '//select[@id="id_mapping_level"]'
CREATE_MAPPING_BTN = '//button[@class="btn btn-primary"]'
ACTUAL_MESSAGE_MAPPING = '//div[@class="alert alert-success alert-dismissible fade show"]'

URL_EDIT_CLO = '//a[@href="/en/academics/clos/${id}/update/"]'
EDIT_CLOS_BTN = '//button[@class="btn btn-primary"]'
MESSAGE_UPDATE_CLOS = '//div[@class="alert alert-success alert-dismissible fade show"]'
ACTUAL_UPDATE_CLOCODE_CLOS ='//h5[@class="text-primary"]'
ACTUAL_UPDATE_DESCRIPTION_CLOS = '//div[@class="card-body"]//div[@class="mb-3"][last()-1]/p[last()-1]'
ACTUAL_UPDATE_CATEGORY_CLOS = '//div[@class="card-body"]//div[@class="mb-3"][1]//div/span[1]'
ACTUAL_UPDATE_LEVEL_CLOS = '//div[@class="card-body"]//div[@class="mb-3"][1]//div/span[last()-1]'
ACTUAL_UPDATE_WEIGHT_CLOS ='//div[@class="card-body"]//div[@class="mb-3"][1]//div/span[last()]'
ACTUAL_UPDATE_ASSESSMENT_CLOS = '//div[@class="card-body"]//div[@class="mb-3"][last()]/p'

URL_ADD_CLO_QUICK = '//a[@href="/en/academics/courses/${id}/clos/create/"]'
URL_ADD_CHAPTER = '//a[@href="/en/academics/courses/${id}/contents/create/"]'
INPUT_CHAPTER_NUMBER = '//input[@id="id_chapter_number"]'
INPUT_CHAPTER_TITLE = '//input[@id="id_chapter_title"]'
TEXTAREA_CHAPTER_DESCRIPTION = '//textarea[@id="id_content_description"]'
TEXTAREA_CHAPTER_LEARNING = '//textarea[@id="id_learning_objectives"]'
TEXTAREA_CHAPTER_TEACHING_METHOD = '//textarea[@id="id_teaching_methods"]'
INPUT_CHAPTER_TIME = '//input[@id="id_duration_hours"]'
CREATE_CHAPTER_BTN = '//button[@class="btn btn-primary"]'
URL_EXIT_CHAPTER = '//a[@href="/en/academics/courses/${id}/" and @class="btn btn-secondary"]'

URL_ADD_TEST = '//a[@href="/en/academics/courses/${id}/assessments/create/"]'
INPUT_TEST_NAME = '//input[@id="id_assessment_name"]'
SELECT_TEST_TYPE = '//select[@id="id_assessment_type"]'
INPUT_TEST_PERCENTAGE = '//input[@id="id_weight_percentage"]'
TEXTAREA_TEST_DESCRIPTION ='//textarea[@id="id_description"]'
SELECT_TEST_FORMAT = '//select[@id="id_exam_format"]'
INPUT_TEST_MINUTES = '//input[@id="id_duration_minutes"]'
INPUT_TEST_TOTAL_MARKS = '//input[@id="id_total_marks"]'
TEXTAREA_TEST_METHOD = '//textarea[@id="id_assessment_method"]'
TEXTAREA_TEST_CRITERIA = '//textarea[@id="id_evaluation_criteria"]'
INPUT_TEST_DATE = '//input[@id="id_assessment_date"]'
INPUT_TEST_LOCATION = '//input[@id="id_location"]'
SELECT_TEST_STATUS = '//select[@id="id_status"]'
CREATE_TEST_BTN = '//button[@class="btn btn-primary"]'
URL_EXIT_TEST = '//a[@href="/en/academics/courses/${id}/" and @class="btn btn-secondary"]'

URL_COURSE = '//a[@href="/en/academics/programs/${id}/courses/"]'
NAME_COURSE = '//table[@class="table table-bordered table-hover"]//tbody//tr[1]/td[1]'
ACTUAL_PAGE_COURSE = '//h1[@class="content-title"]'
URL_ADD_COURSE = '//a[@href="/en/academics/programs/${id}/courses/create/"]'
ACTUAL_ADD_COURSE = '//h1[@class="content-title"]'

URL_COURSE_INFO = '//table[@class="table table-bordered table-hover"]//tbody//tr[${id}]//td[last()]//a[1]'
#CODE_COURSE = '//table[@class="table table-bordered table-hover"]//tbody//tr[1]/td[1]'
NAME_COURSE_INFO = '//table[@class="table table-bordered table-hover"]//tbody//tr[${id}]/td[2]'
ACTUAL_COURSE_INFO = '//h1[@class="content-title"]'
URL_EDIT_COURSES = '//a[contains(@href,"/en/academics/courses/") and contains(@href,"/update/")]'
#URL_CLOS = '//a[@href="/en/academics/courses/${id}/clos/"]'
URL_BACK_TO_PROGRAM = '//a[contains(@href,"/en/academics/programs/") and not(contains(@href,"/courses"))]'
URL_CLOS = '//table[@class="table table-bordered table-hover"]//tbody//tr[${id}]//td[last()]//a[last()]'
CODE_COURSE = '//table[@class="table table-bordered table-hover"]//tbody//tr[${id}]//td[1]'

##### Học phần
URL_HP = '//a[@href="/en/academics/courses/"]'
URL_PROGRAMS = '//a[@href="/en/academics/programs/" and @class="btn btn-secondary"]'
INPUT_SEARCH_COURSES = '//input[@placeholder="Search courses..."]'
SEARCH_COURSES_BTN = '//button[@class="btn btn-primary"]'
EXPECTED_SEARCH_COURSES = '//table[contains(@class, "table-hover")]//tbody/tr/td[2]'
MESSAGE_SEARCH_NOT_EXITS = '//div[@class="alert alert-info"]'
EXPECTED_CODE_COURSE = '//table[@class="table table-bordered table-hover"]//tbody/tr[${id}]/td[1]'
EXPECTED_NAME_COURSE = '//table[@class="table table-bordered table-hover"]//tbody/tr[${id}]/td[2]'
EXPECTED_TYPE_COURSE ='//table[@class="table table-bordered table-hover"]//tbody/tr[${id}]/td[5]/span'
EXPECTED_STATUS_COURSE = '//table[@class="table table-bordered table-hover"]//tbody/tr[${id}]/td[last()-1]/span'

ACTUAL_CODE_COURSE = '//h5[@class="text-primary"]'
ACTUAL_NAME_COURSE = '//div[@class="mb-3"][2]/p[last()-1]'
ACTUAL_TYPE_COURSE = '//div[@class="mb-3"][1]//div/span[1]'
ACTUAL_STATUS_COURSE  = '//div[@class="mb-3"][1]//div/span[last()]'

UPDATE_COURSE_BTN = '//button[@class="btn btn-primary"]'

####Lớp học
URL_CLASS = '//a[@href="/en/academics/classes/"]'
URL_CREATE_PAGE_CLASS = '//a[@href="/en/academics/courses/" and @class="btn btn-primary"]'
URL_COURSES_PAGE_CLASS = '//a[@href="/en/academics/courses/" and @class="btn btn-secondary"]'

SELECT_SEMESTER = '//select[@id="semester"]'
SELECT_ACADEMIC_YEAR = '//select[@id="academic_year"]'
SELECT_STATUS = '//select[@id="status"]'
INPUT_SEARCH_CLASS = '//input[@id="query"]'
SEARCH_CLASS_BTN = '//button[@class="btn btn-primary"]'
EXPECTED_SEARCH_CLASS= '//table[contains(@class,"table-hover")]//tbody/tr/td[${id}]'
EXPECTED_STATUS_SEARCH_CLASS= '//table[contains(@class,"table-hover")]//tbody/tr/td[last()-1]/span'

EXPECTED_CODE_CLASS_INFO = '//table[@class="table table-bordered table-hover"]//tbody/tr[${id}]/td[1]'
EXPECTED_NAME_CLASS_INFO = '//table[@class="table table-bordered table-hover"]//tbody/tr[${id}]/td[2]'
EXPECTED_SEMESTER_CLASS_INFO = '//table[@class="table table-bordered table-hover"]//tbody/tr[${id}]/td[3]'
EXPECTED_YEARS_CLASS_INFO = '//table[@class="table table-bordered table-hover"]//tbody/tr[${id}]/td[4]'
URL_CLASS_INFO = '//table[@class="table table-bordered table-hover"]//tbody/tr[${id}]/td[last()]//a[last()-1]'
URL_CLASS_TESTS = '//table[@class="table table-bordered table-hover"]//tbody/tr[${id}]/td[last()]//a[last()]'

ACTUAL_CODE_CLASS = '//h5[@class="text-primary"]'
ACTUAL_SEMESTER_CLASS = '//p[@class="text-muted mb-2"]'
CREATE_CONTENT_BTN = '//button[@class="btn btn-success dropdown-toggle"]'
URL_VIEW = '//a[@href="/en/academics/classes/${id}/"]'
URL_TEST ='//a[@href="/en/assessment/classes/${id}/tests/"]'
URL_BACK_LIST = '//a[@class="btn btn-secondary"]'
URL_VIEW_ALL_CLO = '//a[@href="/en/academics/courses/${id}/clos/"]'
URL_ADD_CONTENT = '//a[@class="btn btn-sm btn-success"]'
URL_ADD_ASS = '//a[@class="btn btn-sm btn-warning"]'
URL_TESTS = '//a[@href="/en/assessment/classes/${id}/tests/"]'
URL_BACK_TO_CLASS = '//a[@class="btn btn-secondary"]'
URL_CREATE_TEST= '//a[@class="btn btn-primary"]'
#Form Create Test
SELECT_TEST_TYPE_TEST = '//select[@id="id_test_type"]'
INPUT_TEST_NAME_TEST = '//input[@id="id_test_name"]'
TEXTAREA_TEST_DESCRIPTION_TEST = '//textarea[@id="id_description"]'
INPUT_DURATION_TEST = '//input[@id="id_duration"]'
INPUT_WEIGHT_TEST = '//input[@id="id_weight"]'
INPUT_TIME_TEST = '//input[@id="id_test_date"]'
CREATE_TEST_AND_CONTINUE_BTN = '//button[@class="btn btn-primary"]'

