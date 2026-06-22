*** Settings ***
Resource  ../../resources/pages/E2E.robot
Resource  ../../resources/keywords/common_keywords.robot\

Suite Setup  Load Environment
Test Setup   Open Application
Test Teardown  Close Application

*** Test Cases ***
TC-Hybrid-E2E-03
    [Documentation]  Verify a transaction record is created in the API after a fund transfer via UI.
    [Tags]   e2e  regression
    Validate Transaction Record Created via API After UI Transfer