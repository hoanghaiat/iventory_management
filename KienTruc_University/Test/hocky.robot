*** Settings ***
Resource        ../Resource/hocky.resource
Suite Setup     Open Browser And Login
Suite Teardown  Capture And Close
Test Teardown   Capture Page Screenshot
Test Timeout    3 minutes
Documentation   Kiểm thử bộ lọc "Semester" trên trang Lớp học.

*** Test Cases ***
CL-SM-01 - Lọc theo học kỳ Summer
    [Tags]    smoke    semester    filter
    Open Classes Page
    Select Semester    Summer
    Assert Table Only Shows Semester    Summer

CL-SM-02 - Xoá lọc về All Semesters
    [Tags]    regression    semester    filter
    Open Classes Page
    Clear Semester Filter To All
    Assert Multiple Semesters Visible
