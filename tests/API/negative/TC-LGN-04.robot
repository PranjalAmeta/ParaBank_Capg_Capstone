*** Settings ***
Resource  ../../../resources/keywords/api_keywords.robot

*** Test Cases ***
TC-API-LGN-04
    [Documentation]  Logging In With Invalid Credentials
    [Tags]   negative  regression
    Logging In With Empty Password