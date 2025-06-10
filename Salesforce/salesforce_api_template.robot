*** Settings ***
Resource          ${EXECDIR}/resources/main_resources.robot

*** Keywords ***
Salesforce api test case
    [Arguments]    ${EXCEL_FILE_PATH}   ${SHEET_NAME}    ${ROW_INDEX}
    ${row}=    Fetch Using Excel Data    ${EXCEL_FILE_PATH}    ${SHEET_NAME}    ${ROW_INDEX}
    ${headers}=    Create List      TestID    TestCase  BaseURL    Endpoint    Headers    Body    ExpectStatusCode    ExpectResponse
    ${row_dict}=    Create Dictionary   ${headers[0]}=${row[0]}     ${headers[1]}=${row[1]}     ${headers[2]}=${row[2]}     ${headers[3]}=${row[3]}     ${headers[4]}=${row[4]}     ${headers[5]}=${row[5]}     ${headers[6]}=${row[6]}     ${headers[7]}=${row[7]}
    ${status_code}    ${json_response}    ${result}=    Post API Request    ${row_dict['BaseURL']}    ${row_dict['Endpoint']}    ${row_dict['Headers']}    ${row_dict['Body']}    ${row_dict['ExpectStatusCode']}    ${row_dict['ExpectResponse']}
    Log To Console    ROW_INDEX: ${ROW_INDEX}
    Log To Console    File:${EXCEL_FILE_PATH}
    Log To Console    Sheet:${SHEET_NAME}
    Write Result To Excel    ${EXCEL_FILE_PATH}    ${SHEET_NAME}    ${ROW_INDEX}    ${status_code}    ${json_response}    ${result}