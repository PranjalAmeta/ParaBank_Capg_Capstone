*** Settings ***
Library  SeleniumLibrary
Resource  ../../locators/registeration_loc.robot

*** Keywords ***
Register
    [Documentation]  Registering to Para Bank account
    Wait Until Page Contains Element    ${register_link}  5s
    Click Element    ${register_link}
    Wait Until Page Contains Element    ${first_name}
    Input Text    ${first_name}    BBQ
    Input Text    ${last_name}    BBQ
    Input Text    ${address}    Bombay
    Input Text    ${city}    Bombay
    Input Text    ${state}    Maharashtra
    Input Text    ${zip_code}    400001
    Input Text    ${phone}    9876543210
    Input Text    ${ssn}    123456789
    Input Text    ${username_reg}    abc
    Input Text    ${password_reg}    abc
    Input Text    ${confirm_password}    abc
    Click Element    ${register_btn}

Register With Invalid confirm Password
    [Documentation]  Registering to Para Bank account with invalid password
    Click Element    ${register_link}
    Wait Until Page Contains Element    ${first_name}    timeout=10s
    Input Text    ${first_name}    BBQ
    Input Text    ${last_name}    BBQ
    Input Text    ${address}    Bombay
    Input Text    ${city}    Bombay
    Input Text    ${state}    Maharashtra
    Input Text    ${zip_code}    400001
    Input Text    ${phone}    9876543210
    Input Text    ${ssn}    123456789
    Input Text    ${username_reg}    bbq123
    Input Text    ${password_reg}    bbq1234
    Input Text    ${confirm_password}    bbq123
    Click Element    ${register_btn}
    Page Should Contain Element    ${invalid_password}    timeout=10s


Register with blank fields
    [Documentation]  Registering to Para Bank account with blank fields
    Click Element    ${register_link}
    Wait Until Page Contains Element    ${first_name}    timeout=10s
    Click Element    ${register_btn}
    Page Should Contain Element    ${invalid_password}    timeout=10s
    
    
Log Out User
    [Documentation]  Logging out User
    Click Element  ${log_out_btn}
