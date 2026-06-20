*** Settings ***
Resource  ../../../resources/keywords/api_keywords.robot

*** Test Cases ***
TC-API-PERF-04
    [Documentation]  Getting all accounts for valid customer
    Get Customer ID
    Get Accounts of Customer
    Create New Account
    Transfer funds
    Get Account Transactions
    Get Transactions Response Time
    