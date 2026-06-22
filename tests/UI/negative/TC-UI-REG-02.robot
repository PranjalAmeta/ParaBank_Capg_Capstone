*** Settings ***
Library  SeleniumLibrary
Resource  ../../../resources/pages/RegistrationPage.robot
Resource  ../../../resources/keywords/common_keywords.robot

Suite Setup  Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
TC-UI-REG-001
    [Documentation]  Verify that user can register with valid details
    [Tags]  smoke  regression
    Register With Invalid Confirm Password