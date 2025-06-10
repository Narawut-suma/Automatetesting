
*** Settings ***
Resource    ${EXECDIR}/resources/main_resources.robot
*** Keywords ***
Fetch Using Excel Data
    [Arguments]    ${EXCEL_FILE_PATH}    ${SHEET_NAME}    ${ROW_INDEX}
    Open Workbook    ${EXCEL_FILE_PATH}
    ${excel_data}=    Read Worksheet As Table    header=True    name=${SHEET_NAME}
    ${row}=    Get From List    ${excel_data}    ${ROW_INDEX}
    RETURN    ${row}

Write Result To Excel 
    [Arguments]    ${EXCEL_FILE_PATH}    ${SHEET_NAME}    ${ROW_INDEX}    ${status_code}    ${response}    ${result}
    ${row_index_int}=    Convert To Integer    ${ROW_INDEX}
    ${response_str}=     Convert To String    ${response}
    ${currentdate}=    Get Current Date    result_format=%Y-%m-%d %H:%M:%S
    Open Workbook    ${EXCEL_FILE_PATH}
    Set Cell Value    ${row_index_int+2}    I    ${status_code}    name=${SHEET_NAME}
    Set Cell Value    ${row_index_int+2}    J    ${response_str}   name=${SHEET_NAME}
    Set Cell Value    ${row_index_int+2}    K    ${result}         name=${SHEET_NAME}
    Set Cell Value    ${row_index_int+2}    L    ${currentdate}         name=${SHEET_NAME}
    Save Workbook
    Close Workbook

Post API Request
    [Arguments]    ${base_url}    ${endpoint}    ${headers}    ${body}    ${expected_status_code}    ${expected_response}
    ${headers}=    Evaluate    json.loads('''${headers}''')    json
    ${body}=       Evaluate    json.loads('''${body}''')       json
    Create Session    my_session    ${base_url}
    ${response}=    POST On Session    my_session    ${endpoint}    json=${body}    headers=${headers}
    Log To Console    Status: ${response.status_code}
    Log To Console    Response: ${response.json()}
    ${test_result}=    Run Keyword And Return Status    Should Be Equal    ${response.status_code}    ${expected_status_code}
    ${validate_result}=    Run Keyword And Return Status    Validate JSON Response    ${response.json()}    ${expected_response}
    ${final_result}=    Run Keyword If    ${test_result} and ${validate_result}    Set Variable    PASS    ELSE    Set Variable    FAIL
    [Return]    ${response.status_code}    ${response.json()}    ${final_result}

Validate JSON Response
    [Arguments]    ${actual}    ${expected}
    ${expected_str}=    Convert To String    ${expected}
    ${actual_str}=      Convert To String    ${actual}
    Should Contain    ${actual_str}    ${expected_str}
