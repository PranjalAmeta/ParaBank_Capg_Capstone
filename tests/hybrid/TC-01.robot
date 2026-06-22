*** Settings ***
Resource  ../../resources/pages/E2E.robot
Resource  ../../resources/keywords/common_keywords.robot

Suite Setup  Load Environment
Test Setup  Open Application
Test Teardown  Close Application

*** Test Cases ***
Create Account via UI and Validate via API
    [Tags]   e2e  regression
    [Documentation]    Creating a account via ui and checking via api
    Creating Account via UI and Validating via API
