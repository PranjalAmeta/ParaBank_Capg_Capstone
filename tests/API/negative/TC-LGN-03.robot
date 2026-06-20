*** Settings ***
Resource  ../../../resources/keywords/api_keywords.robot

*** Test Cases ***
TC-API-LGN-03
    [Documentation]  Logging In With Invalid Credentials
    Logging In With Empty Username