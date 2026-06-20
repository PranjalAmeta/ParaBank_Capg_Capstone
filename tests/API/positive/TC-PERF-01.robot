*** Settings ***
Resource   ../../../resources/keywords/api_keywords.robot

*** Test Cases ***
TC-API-PERF-01
    [Documentation]  Performance Testing for API Endpoint
    Get Customer ID
    Get Customer ID With Response Time