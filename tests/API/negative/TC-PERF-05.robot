*** Settings ***
Resource   ../../../resources/keywords/api_keywords.robot
*** Test Cases ***
TC-API-PERF-05
    [Documentation]  Performance Testing for API Endpoint with Invalid Credentials
    Get Accounts of Customer with Invalid ID
    Invalid Customer ID Response Time