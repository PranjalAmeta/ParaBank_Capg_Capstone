*** Settings ***
Resource  ../../../resources/keywords/api_keywords.robot

*** Test Cases ***
TC-API-02
    [Documentation]  Getting all accounts for invalid customer
    [Tags]   negative  regression
    Get Accounts of Customer with Invalid ID
