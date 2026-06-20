*** Settings ***
Library  SeleniumLibrary
Resource  ../../locators/account_loc.robot


*** Keywords ***
Open Account
    [Documentation]  Opening Checkings/Savings account
    [Arguments]  ${acc_type}
    Wait Until Page Contains Element    ${acc_btn}  2s
    Click Element  ${acc_btn}
    Wait Until Page Contains Element    ${dropdown_acc_type}  2s
    Page Should Contain List    ${dropdown_acc_type}
    Select From List By Label    ${dropdown_acc_type}  ${acc_type}
    Sleep  1s
    Click Element  ${open_acc_btn}
    Wait Until Page Contains Element    ${new_acc_chk}  15s
    Set Suite Variable  ${acc_type}
    ${acc_id_p}=  Set Variable   //a[@id="newAccountId"]
    Set Suite Variable  ${acc_id_p}

Account Check
    [Documentation]  Checking if new account is created
    Wait Until Element Is Visible    ${acc_num}  2s
    ${acc_id}=  Get Text  ${acc_num}
    Log To Console    Account ID=${acc_id}
    Click Element  ${acc_overview}
    Wait Until Page Contains Element   //a[text()='${acc_id}']  2s

Account Overview
    [Documentation]  Checking if all the account is visible
    Wait Until Page Contains Element   ${acc_overview}  2s
    Click Element  ${acc_overview}
    Wait Until Page Contains Element    ${frst_acc}
    ${frst_acc}=  Get Text  ${frst_acc}
    RETURN  ${frst_acc}

Open Account And Get ID
    [Arguments]    ${acc_type}
    Open Account    ${acc_type}
    Sleep  2s
    Wait Until Element Is Visible    ${acc_num}   10s
    ${account_id}=    Get Text    ${acc_num}
    RETURN    ${account_id}





