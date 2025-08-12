*** Settings ***
Library    SeleniumLibrary
Resource    ../Resource/HomePage.resource
Resource    ../Resource/OrganizationalManagement.resource
Test Setup    Login To System
Test Teardown    Close Browser
*** Variables ***

*** Test Cases ***
#Don vi
TC050 - Kiểm tra huỷ bỏ khi thêm đơn vị mới
    Click Unit
    Cancel Add Unit

TC051 - Kiểm tra click quay lại khi thêm đơn vị mới
    Click Unit
    Back To List

TC052 - Kiểm tra thêm đơn vị mới
    Click Unit
    Verify Add To Unit

TC053 - Kiểm tra huỷ bỏ khi chỉnh sửa đơn vị
    Click Unit
    Edit Unit "Cancel"
    Capture Page Screenshot

TC054 - Kiểm tra nút quay lại khi chỉnh sửa đơn vị
    Click Unit
    Edit Unit "Back to list"

TC055 - Kiểm tra chỉnh sửa đơn vị
    Click Unit
    Edit Unit

TC056 - Kiểm tra xoá đơn vị
    Click Unit
    Delete Unit

#Phong don vi
TC059 - Kiểm tra huỷ bỏ khi thêm phông mới
    Click Storage Room
    Cancel Add Phong

TC060 - Kiểm tra click quay lại khi thêm phông mới
    Click Storage Room
    Back To Phong

TC061 - Kiểm tra thêm mới phông lưu trữ
    Click Storage Room
    Verify Add To Phong


TC062 - Kiểm tra chỉnh sửa phông lưu trữ
    Click Storage Room
    Edit Phong

TC063 - Kiểm tra huỷ bỏ khi chỉnh sửa phòng lưu trữ
    Click Storage Room
    Edit Phong "Cancel"

TC064 - Kiểm tra nút quay lại khi chỉnh sửa phòng
    Click Storage Room
    Edit Back To Phong

TC065 - Kiểm tra xoá phông lưu trữ
    Click Storage Room
    Delete Phong

TC068 - Kiểm tra tìm kiếm phông lưu trữ lọc theo "Lọc theo đơn vị"
    Click Storage Room
    Filter Phong

#Muc luc ho so
TC069 - Kiểm tra huỷ bỏ khi thêm mục lục mới
    Click Profile Table of Contents
    Cancel Add Mucluc

TC070 - Kiểm tra click quay lại khi thêm mục lục mới
    Click Profile Table of Contents
    Back To Mucluc

TC071 - Kiểm tra thêm mục lục mới
    Click Profile Table of Contents
    Verify Add To Mucluc