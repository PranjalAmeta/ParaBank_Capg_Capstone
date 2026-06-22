*** Settings ***
Resource  ../../../resources/keywords/api_keywords.robot


*** Test Cases ***
TC-ACC-05
    [Documentation]  Getting and verifying specific account details
    [Tags]   smoke  regression
    Get Customer ID
    Get Accounts Of Customer
    Create New Account