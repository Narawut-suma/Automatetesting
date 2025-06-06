*** Settings ***
Library    ExcelLibrary
Library    RequestsLibrary
Library    RPA.Excel.Application

*** Variables ***
${BASE_URL}      https://api.example.com
${USERNAME}      admin
${PASSWORD}      1234
${EXCEL_PATH}    ../data/users.xlsx

###### Template #### 
Resource    Salesforce_testcase/api_template.robot

##### Keywords ####

Resource    login_keywords.robot
Resource    excel_keywords.robot


*** Keywords ***
Fetch Data From Excel
    Open Workbook    ${EXCEL_PATH}
    ${data}=    Read Worksheet As Table    header=True
    Close Workbook
    [Return]    ${data}