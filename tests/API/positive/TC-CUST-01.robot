*** Settings ***
Resource    ../../../resources/keywords/api_keywords.robot

*** Test Cases ***
TC-API-CUST-01
    [Documentation]  Getting all accounts for valid customer
    [Tags]   smoke  regression
    Get Customer ID
    Get Customer Details By Id