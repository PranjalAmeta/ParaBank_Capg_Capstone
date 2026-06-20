*** Settings ***
Resource  ../../../resources/keywords/api_keywords.robot

*** Test Cases ***
TC-TXN-01
    [Documentation]  Verifying the transaction details for a specific account
    Get Customer ID
    Get Accounts of Customer
    Get List Of Transactions