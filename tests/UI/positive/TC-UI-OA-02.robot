*** Settings ***
Resource  ../../../resources/keywords/common_keywords.robot
Resource  ../../../resources/pages/OpenAccountPage.robot
Resource  ../../../resources/pages/LoginPage.robot


Suite Setup  Load Environment
Test Setup  Open Application
Test Teardown  Close Application

*** Test Cases ***
TC-UI-OA-01
    [Documentation]  Verify that user is able to open new account
    [Tags]  ui smoke
    # Log in to Para Bank
    Permanent temp log
    Open Account  SAVINGS
