*** Settings ***
Resource  ../../../resources/keywords/api_keywords.robot

*** Test Cases ***
TC-API-PERF-02
    [Documentation]  Getting all accounts for valid customer
    [Tags]   performance
    Get Customer ID
    Get Accounts Of Customer
    Login and Get Account With in Response Time