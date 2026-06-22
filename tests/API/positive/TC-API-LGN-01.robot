*** Settings ***
Resource    ../../../resources/keywords/api_keywords.robot



*** Test Cases ***
TC-API-01
    [Documentation]  Getting all accounts for valid customer
    [Tags]   smoke  regression
    Get Customer ID
