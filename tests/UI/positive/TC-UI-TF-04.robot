*** Settings ***
Resource  ../../../resources/pages/TransferPage.robot
Resource  ../../../resources/pages/OpenAccountPage.robot
Resource  ../../../resources/pages/LoginPage.robot
Resource  ../../../resources/keywords/common_keywords.robot
Resource  ../../../resources/pages/RegistrationPage.robot

Suite Setup  Load Environment
Test Setup  Open Application
Test Teardown  Close Application

*** Test Cases ***
TC-UI-TF-04
    [Documentation]  Verify that if user is able to transfer funds with negative amount
    [Tags]  smoke  regression
    # Log In To Para Bank     how to use this?????
    Permanent temp log
    Open Account    SAVINGS
    Transfer Funds With Decimal Amount