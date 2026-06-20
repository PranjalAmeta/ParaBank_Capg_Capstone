*** Settings ***
Library  SeleniumLibrary
Resource  ../../locators/transferfunds_loc.robot

*** Keywords ***
Transfer Funds
    [Documentation]  performing the transfer of funds between accounts.
    Click Element  ${transfer_funds_btn}
    Input Text  ${amount_field}  100
    Click Element  ${amount_to}
    Wait Until Page Contains Element    ${diff_acc}  2s
    Click Element  ${diff_acc}
    Click Element  ${transfer_btn}

Transfer Funds with blank amount
    [Documentation]  performing the transfer of funds between accounts with blank amount.
    Click Element  ${transfer_funds_btn}
    Click Element  ${amount_to}
    Wait Until Page Contains Element    ${diff_acc}  2s
    Click Element  ${diff_acc}
    Click Element  ${transfer_btn}

Transfer Funds With Negative Amount
    [Documentation]  Performing the amount transfer with neagtive account
    Click Element  ${transfer_funds_btn}
    Input Text  ${amount_field}  -100
    Click Element  ${amount_to}
    Wait Until Page Contains Element    ${diff_acc}  2s
    Click Element  ${diff_acc}
    Click Element  ${transfer_btn}
    Page Should Contain Element   ${transfer_comp}

Transfer Funds With Decimal Amount
    [Documentation]  Performing the amount transfer with decimal account
    Click Element  ${transfer_funds_btn}
    Wait Until Page Contains Element    ${amount_field}  6s
    Input Text  ${amount_field}  10.50
    Click Element  ${amount_to}
    Wait Until Page Contains Element    ${diff_acc}  2s
    Click Element  ${diff_acc}
    Click Element  ${transfer_btn}
    Page Should Contain Element   ${transfer_comp}
    
    
Transfer Funds With Known Accounts
    [Documentation]  performing the transfer of funds between accounts.
    [Arguments]  ${second_acc}
    Click Element  ${transfer_funds_btn}
    Input Text  ${amount_field}  50
    Click Element  ${amount_to}
    Page Should Contain List  ${dropdown_to}  4s
    Sleep  3s
    Click Element  ${amount_to}
    Click Element  ${diff_acc}
    Click Element  ${transfer_btn}