*** Settings ***
Resource  ../../../resources/keywords/api_keywords.robot

*** Test Cases ***
TC-API-TXN-01
    [Documentation]
    Get Customer ID
    Get Accounts of Customer
    Create New Account
    Transfer funds
    Get Account Transactions