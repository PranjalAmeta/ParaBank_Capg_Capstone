*** Settings ***
Library  SeleniumLibrary
Resource  ../../../resources/pages/LoginPage.robot
Resource  ../../../resources/keywords/common_keywords.robot

Suite Setup  Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
TC-UI-LGN-004
    [Documentation]  Verify that user can log in with valid credentials
    [Tags]   smoke  regression
    Log in to Para Bank
    Log Out From Para Bank
