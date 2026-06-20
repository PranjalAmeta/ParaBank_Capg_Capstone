*** Settings ***
Library  SeleniumLibrary
Resource    ../keywords/api_keywords.robot
Resource    ../../resources/pages/LoginPage.robot
Resource   RegistrationPage.robot
Resource    TransferPage.robot
Resource    OpenAccountPage.robot

*** Keywords ***
Creating Account via UI and Validating via API
    [Documentation]    Create Account via UI and Validate via API
    [Tags]    E2E    Hybrid
    Log In To Para Bank
    ${new_acc_id}=    Open Account And Get ID    CHECKING
    Get Customer ID
    ${accounts}=    Get All Accounts For Customer
    Should Contain    ${accounts}    ${new_acc_id}

Create Savings Account via UI – Validate Type via API
    [Documentation]    Create Savings Account via UI – Validate Type via API
    [Tags]    E2E    Hybrid
    Log In To Para Bank
    ${new_acc_id}=    Open Account And Get ID    SAVINGS
    Set Suite Variable    ${accountId}    ${new_acc_id}
    Get Customer ID
    Validate Savings Account Type


Validate Transaction Record Created via API After UI Transfer
    [Documentation]  Checking if transaction occur via api after crediting
    [Tags]  E2E  Hybrid
    Log In To Para Bank
    ${first_acc_e2e}=   Account Overview
    ${second_acc_e2e}=  Open Account And Get ID    SAVINGS
    Get Account Transactions With Known Account  ${first_acc_e2e}
    Transfer Funds With Known Accounts  ${second_acc_e2e}
    Get Account Transactions With Known Account  ${first_acc_e2e}


