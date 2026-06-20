*** Settings ***
Resource  ../../../resources/keywords/api_keywords.robot

Suite Setup  Get Customer ID

*** Test Cases ***
TC-ACC-01
    [Documentation]  Getting all accounts for valid customer
    Get Accounts of Customer    