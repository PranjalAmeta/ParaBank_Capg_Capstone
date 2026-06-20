*** Settings ***
Resource  ../../../resources/pages/OpenAccountPage.robot
Resource  ../../../resources/pages/LoginPage.robot
Resource  ../../../resources/keywords/common_keywords.robot

Suite Setup  Load Environment
Test Setup  Open Application
Test Teardown  Close Application

*** Test Cases ***
TC-AO-01
    [Documentation]  Verify that if user is able to transfer funds with negative amount
    [Tags]  smoke  regression
    # Log in to Para Bank
    Log In To Para Bank
    Open Account    SAVINGS
    Account Overview