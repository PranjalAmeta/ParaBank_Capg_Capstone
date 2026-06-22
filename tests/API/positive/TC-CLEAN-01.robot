*** Settings ***
Resource  ../../../resources/keywords/api_keywords.robot

*** Test Cases ***
TC-CLEAN-01
    [Documentation]  Cleaning the database
    [Tags]   smoke
    Clean Database