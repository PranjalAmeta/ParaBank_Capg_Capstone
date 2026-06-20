*** Settings ***
Resource  ../../../resources/keywords/api_keywords.robot

Suite Setup  Get Customer ID

*** Test Cases ***
TC-ACC-03
    [Documentation]  Getting and verifying specific account details
    Get Accounts of Customer
    Get Account Details