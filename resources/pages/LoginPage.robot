*** Settings ***
Library  SeleniumLibrary
Resource  ../../locators/login_loc.robot

*** Keywords ***
Log in to Para Bank
    [Documentation]  logging in to Para Bank account
    [Tags]  ui smoke
    Wait Until Page Contains Element    ${username_log}  5s
    Input Text    ${username_log}    john
    Wait Until Page Contains Element   ${password_log}
    Input Text    ${password_log}    demo
    Wait Until Page Contains Element    ${login_btn}    2s
    Click Element    ${login_btn}
    Wait Until Page Contains Element    ${log_out_btn}    2s


Log in to Para Bank with invalid credentials
    [Documentation]  logging in to Para Bank account with invalid credintials
    [Tags]  ui smoke
    Input Text    ${username_log}    bqr123
    Input Text    ${password_log}    bbq12
    Wait Until Page Contains Element    ${login_btn}    2s
    Click Element    ${login_btn}
    Page Should Not Contain Element    ${log_out_btn}    2s


Log in with blank fields
    [Documentation]  logging in to Para Bank account with blank fields
    [Tags]  ui smoke
    Wait Until Page Contains Element    ${login_btn}    2s
    Click Element    ${login_btn}
    Page Should Not Contain Element    ${log_out_btn}    2s

Log Out From Para Bank
    [Documentation]  logging out from Para Bank account
    [Tags]  ui smoke
    Wait Until Page Contains Element    ${log_out_btn}    10s
    Click Element    ${log_out_btn}
    Wait Until Page Contains Element    ${login_btn}    10s


Permanent temp log
    Input Text    ${username_log}    john
    Input Text    ${password_log}    demo
    Wait Until Page Contains Element    ${login_btn}    2s
    Click Element    ${login_btn}
    Wait Until Page Contains Element    ${log_out_btn}    2s