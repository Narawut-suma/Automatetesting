*** Settings ***
Library    RequestsLibrary
Library    RPA.Excel.Files
Library    Collections
Library    DateTime

##### Keywords ####
Resource    ${EXECDIR}/Salesforce/salesforce_api_keyword.robot

###### Template #### 
Resource    ${EXECDIR}/Salesforce/salesforce_api_template.robot

##### Keywords ####
Resource    ${EXECDIR}/Salesforce/salesforce_api_keyword.robot

