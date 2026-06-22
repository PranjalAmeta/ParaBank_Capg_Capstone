*** Settings ***
Resource  ../../../resources/keywords/api_keywords.robot


*** Test Cases ***
TC-ACC-04
    [Documentation]  Getting and verifying specific account details
    [Tags]   negative  regression
    Get Customer ID
    Get Accounts of Customer
    Get Account Details with Invalid ID