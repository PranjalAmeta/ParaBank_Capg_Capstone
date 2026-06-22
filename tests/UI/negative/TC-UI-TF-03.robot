*** Settings ***
Resource  ../../../resources/pages/TransferPage.robot
Resource  ../../../resources/pages/OpenAccountPage.robot
Resource  ../../../resources/pages/LoginPage.robot
Resource  ../../../resources/keywords/common_keywords.robot


Suite Setup  Load Environment
Test Setup  Open Application
Test Teardown  Close Application

*** Test Cases ***
TC-UI-TF-03
    [Documentation]  Verify that if user is able to transfer funds with negative amount
    [Tags]  smoke  regression   negative
    # Log in to Para Bank
    Permanent temp log
    Open Account    SAVINGS
    Transfer Funds With Negative Amount