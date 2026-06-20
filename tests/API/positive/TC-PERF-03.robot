*** Settings ***
Resource  ../../../resources/keywords/api_keywords.robot

*** Test Cases ***
TC-API-PERF-03
    [Documentation]  Getting all accounts for valid customer
    Get Customer ID
    Get Accounts of Customer
    Get Account Details
    Get Account By ID Response Time