# Salesforce API Robot Framework Test Suite

## Overview

This project is an automated test suite for Salesforce API using Robot Framework.  
Test data is managed in an Excel file, and test results (status code, response, pass/fail) are written back to the Excel file automatically.

---

## How It Works

- Each test case uses the `Salesforce api test case` template.
- Test data is read from the Excel file (`testdata/Testcast_PPI-INSTALLMENT.xlsx`), sheet (`Sheet2`).
- The last argument in each test case (0, 1, ...) is the row index in the Excel file.
- Results are written back to columns I, J, K in the Excel file.

---

## How to Add a New Test Case

1. Add a new row of test data in the Excel file.
2. Add a new test case in `salesforce_api_testcase.robot` and set the correct row index.

**Example:**
```robot
SALESFOCE_PPI-INSTALLMENT_003     ${EXECEL_FILE_PATH}    ${SHEETNAME}    2
```

---

## How to Run

- Run all test cases:
  ```sh
  python -m robot Salesforce/salesforce_api_testcase.robot
  ```
- Run a specific test case:
  ```sh
  python -m robot --test "SALESFOCE_PPI-INSTALLMENT_001" Salesforce/salesforce_api_testcase.robot
  ```
- Run and save results to a specific folder:
  ```sh
  python -m robot --outputdir Testresult/SALESFOCE_PPI-INSTALLMENT_001 --test "SALESFOCE_PPI-INSTALLMENT_001" Salesforce/salesforce_api_testcase.robot
  ```

---

## File Structure

- `salesforce_api_testcase.robot`  
  Main test suite, defines test cases and links to the template.

- `salesforce_api_template.robot`  
  Test template, handles reading data, calling API, and writing results.

- `salesforce_api_keyword.robot`  
  Custom keywords for reading/writing Excel and API logic.

- `testdata/Testcast_PPI-INSTALLMENT.xlsx`  
  Excel file containing test data and where results are written.

---

## Notes

- Make sure to update the Excel file and test case index together.
- You can add or remove test cases easily by editing the Excel file and the test suite.
- Results will be written back to the same Excel file after each run.

---
```# Salesforce API Robot Framework Test Suite

## Overview

This project is an automated test suite for Salesforce API using Robot Framework.  
Test data is managed in an Excel file, and test results (status code, response, pass/fail) are written back to the Excel file automatically.

---

## How It Works

- Each test case uses the `Salesforce api test case` template.
- Test data is read from the Excel file (`testdata/Testcast_PPI-INSTALLMENT.xlsx`), sheet (`Sheet2`).
- The last argument in each test case (0, 1, ...) is the row index in the Excel file.
- Results are written back to columns I, J, K in the Excel file.

---

## How to Add a New Test Case

1. Add a new row of test data in the Excel file.
2. Add a new test case in `salesforce_api_testcase.robot` and set the correct row index.

**Example:**
```robot
SALESFOCE_PPI-INSTALLMENT_003     ${EXECEL_FILE_PATH}    ${SHEETNAME}    2
```

---

## How to Run

- Run all test cases:
  ```sh
  python -m robot Salesforce/salesforce_api_testcase.robot
  ```
- Run a specific test case:
  ```sh
  python -m robot --test "SALESFOCE_PPI-INSTALLMENT_001" Salesforce/salesforce_api_testcase.robot
  ```
- Run and save results to a specific folder:
  ```sh
  python -m robot --outputdir Testresult/SALESFOCE_PPI-INSTALLMENT_001 --test "SALESFOCE_PPI-INSTALLMENT_001" Salesforce/salesforce_api_testcase.robot
  ```

---

## File Structure

- `salesforce_api_testcase.robot`  
  Main test suite, defines test cases and links to the template.

- `salesforce_api_template.robot`  
  Test template, handles reading data, calling API, and writing results.

- `salesforce_api_keyword.robot`  
  Custom keywords for reading/writing Excel and API logic.

- `testdata/Testcast_PPI-INSTALLMENT.xlsx`  
  Excel file containing test data and where results are written.

---

## Notes

- Make sure to update the Excel file and test case index together.
- You can add or remove test cases easily by editing the Excel file and the test suite.
- Results will be written back to the same Excel file after each run.

---