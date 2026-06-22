*** Settings ***
Resource  ../../resources/pages/E2E.robot
Resource  ../../resources/keywords/common_keywords.robot

Suite Setup  Load Environment
Test Setup  Open Application
Test Teardown  Close Application

*** Test Cases ***
Create Account via UI and Validate via API
    [Documentation]    Creating a account via ui and checking via api
    [Tags]   e2e  regression
    Create Savings Account via UI – Validate Type via API