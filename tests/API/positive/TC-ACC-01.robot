*** Settings ***
Resource  ../../../resources/keywords/api_keywords.robot

*** Test Cases ***
TC-ACC-01
    [Documentation]  Getting all accounts for valid customer
    Get Customer ID
    Get Accounts of Customer    