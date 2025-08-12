# =========================
# Student Profile Locators
# =========================
URL = "https://demo-clo.minds.vn/en/accounts/login/"
BROWSER = "Chrome"

# Account
USERNAME = "student1"
PASSWORD = "demostudent"

# Buttons
EDIT_PROFILE_BUTTON = "xpath=/html/body/div[3]/div[1]/div/div[2]/a"
UPDATE_PROFILE_BUTTON = "xpath=/html/body/div[3]/div[2]/div/div/div/div[2]/form/div[8]/button"
LOGOUT_BUTTON = "xpath=/html/body/div[1]/div[2]/div[2]/ul/li[3]/form/button"

# Form Fields
USENAME_FIELDS = "xpath=//*[@id='id_username']"
EMAIL_FIELDS = "xpath=//*[@id='id_email']"
FIRST_NAME_FIELDS = "xpath=//*[@id='id_first_name']"
LAST_NAME_FIELDS = "xpath=//*[@id='id_last_name']"
PHONE_FIELDS = "xpath=//*[@id='id_phone']"
DEPARTMENT_FIELDS = "xpath=//*[@id='id_department']"
SPECIALIZATION_FIELDS = "xpath=//*[@id='id_specialization']"

# Messages
SUCCESS_MESSAGE = "xpath=/html/body/div[3]/div[2]/div[1]"
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

# Program list page
PROGRAMS_PAGE_TITLE = "xpath=//h1|//h2|//h3"
SEARCH_BOX_PROGRAMS = "xpath=//input[@placeholder='Search programs...' or contains(@placeholder,'Search')]"
PROGRAMS_TABLE_ROWS = "xpath=//table//tbody//tr"

# First program row
FIRST_PROGRAM_ROW = "xpath=(//table//tbody//tr)[1]"
FIRST_PROGRAM_NAME_CELL = "xpath=(//table//tbody//tr)[1]//td[1]"
FIRST_PROGRAM_VIEW_BTN = "xpath=(//table//tbody//tr)[1]//a[contains(@class,'btn') and (descendant::i[contains(@class,'eye') or contains(@class,'fa-eye')] or descendant::svg)]"
FIRST_PROGRAM_COURSES_BTN = "xpath=(//table//tbody//tr)[1]//a[normalize-space(.)='Courses' or contains(.,'Courses')]"
DETAIL_PROGRAM_TITLE = "xpath=/html/body/div[3]/div[1]/div/div[1]/h1"
DETAIL_COURSE_TITLE = "xpath=/html/body/div[3]/div[1]/div/div[1]/h1"
# Courses page top actions
COURSES_PAGE_TITLE = "xpath=//h1|//h2|//h3"


# Courses table and first course row
COURSES_TABLE_ROWS = "xpath=/html/body/div[3]/div[2]/div[2]/div[2]"
FIRST_COURSE_ROW = "xpath=(//table//tbody//tr)[1]"
FIRST_COURSE_VIEW_BTN = "xpath=(//table//tbody//tr)[1]//a[contains(@class,'btn') and (descendant::i[contains(@class,'eye') or contains(@class,'fa-eye')] or descendant::svg)]"

# Create Course form
CREATE_COURSE_FORM = "xpath=/html/body/div[3]/div[2]/div/div/div/div[2]"

# Generic messages
NO_RESULT_TEXT_PROGRAMS = "No programs found"
NO_RESULT_TEXT_COURSES = "No courses found"

SEE_ALL_BTN = "xpath=/html/body/div[3]/div[2]/div[3]/div/div/div[1]/div/a"
VIEW_COURSE_BTN = "xpath=/html/body/div[3]/div[2]/div[3]/div/div/div[2]/div/table/tbody/tr[1]/td[7]/div/a"
COURSES_TABLE = "xpath=/html/body/div[3]/div[2]/div[1]/div[1]"
ALL_COURSES_BTN = "xpath=/html/body/div[3]/div[1]/div/div[2]/div/a[1]"
ADD_COURSES_BTN ="xpath=/html/body/div[3]/div[1]/div/div[2]/div/a[2]"
BACK_TO_PROGRAM ="xpath=/html/body/div[3]/div[1]/div/div[2]/div/a[3]"
URL_ALL_COURSE = "https://demo-clo.minds.vn/en/academics/programs/20/courses/"
URL_PROGRAM ="xpath=https://demo-clo.minds.vn/en/academics/programs/20/"
HOME_URL ="xpath=/html/body/div[3]/div[1]/div/div[1]/nav/ol/li/a"

EYE_BTN = '//a[@href="/en/academics/courses/42/"]'
EDIT_BTN= '//a[@href="/en/academics/courses/42/update/"]'
VIEW_CLOS_BTN ='//a[@href="/en/academics/courses/42/update/"]'
DETAIL_COURSE_TITLE = '//h1[@class="content-title"]'
EDIT_COURSE_TITLE ='//h1[@class="content-title"]'
CLO_TITLE ='//h1[@class="content-title"]'