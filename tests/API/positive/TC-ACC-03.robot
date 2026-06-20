*** Settings ***
Resource  ../../../resources/keywords/api_keywords.robot

*** Test Cases ***
TC-ACC-03
    [Documentation]  Getting and verifying specific account details
    Get Customer ID
    Get Accounts of Customer
    Get Account Details