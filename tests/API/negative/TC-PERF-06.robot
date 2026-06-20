*** Settings ***
Resource   ../../../resources/keywords/api_keywords.robot
*** Test Cases ***
TC-API-PERF-06
    [Documentation]  Performance Testing for API Endpoint with Invalid Credentials
    Get Account Details with Invalid ID
    Invalid Account ID Response Time

