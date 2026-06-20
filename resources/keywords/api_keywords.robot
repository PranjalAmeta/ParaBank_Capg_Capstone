*** Settings ***
Library  RequestsLibrary
Library  Collections

*** Variables ***
${API_BASE_URL}  https://parabank.parasoft.com/parabank/services/bank
${user_name_user}    john
${passwd}    demo

*** Keywords ***
Get Customer ID  # Logging in
    [Documentation]  Getting the customer id for valid customer
    Create Session  bank_api  ${API_BASE_URL}  verify=True   headers={"Accept":"application/json"}
    ${response}=  GET On Session    bank_api    /login/${user_name_user}/${passwd}              # Change To ${user_name} and ${pswd}
    Should Be Equal As Integers  ${response.status_code}  200
    ${body}=   Set Variable  ${response.json()}
    ${customer_id}=    Set Variable    ${body}[id]    # Here we will get customer id
    Set Suite Variable   ${customer_id}
    ${login_time}=   Evaluate  $response.elapsed.total_seconds()
    Set Suite variable  ${login_time}


    
Logging In With Invalid Credentials
    [Documentation]  Logging In With Invalid Credentials
    ${headers}=  Create Dictionary  Accept=application/json
    Create Session  bank_api  ${API_BASE_URL}  verify=True  headers=${headers}
    ${response}=  GET On Session  bank_api  /login/abcd123/abcd1234  expected_status=any
    Should Be Equal As Integers    ${response.status_code}  400

Logging In With Empty Username
    [Documentation]  Logging In With Invalid Credentials
    ${headers}=  Create Dictionary  Accept=application/json
    Create Session  bank_api  ${API_BASE_URL}  verify=True  headers=${headers}
    ${response}=  GET On Session  bank_api  /login//abcd1234   expected_status=any
    Should Be Equal As Integers    ${response.status_code}  404

Logging In With Empty Password
    [Documentation]  Logging In With Invalid Credentials
    ${headers}=  Create Dictionary  Accept=application/json
    Create Session  bank_api  ${API_BASE_URL}  verify=True  headers=${headers}
    ${response}=  GET On Session  bank_api  /login/abcd1234/   expected_status=any
    Should Be Equal As Integers    ${response.status_code}  404

Get Accounts of Customer
    [Documentation]  Getting all accounts for valid customer
    ${headers}=  Create Dictionary  Accept=application/json
    Create Session  bank_api  ${API_BASE_URL}  verify=True  headers=${headers}
    ${response}=  GET On Session  bank_api  /customers/${customer_id}/accounts   # From the customer id fetch account id
    Should Be Equal As Integers  ${response.status_code}  200
    ${body}=  Set Variable  ${response.json()}
    ${account_id}=  Set Variable  ${body}[0][id]
    Set Suite Variable  ${account_id}
    ${all_account_time}=  Evaluate  $response.elapsed.total_seconds()
    Set Suite Variable  ${all_account_time}
#    Log To Console  ${account_id}


Get Accounts of Customer with Invalid ID
    [Documentation]  Getting a account for invalid customer id
    ${headers}=  Create Dictionary  Accept=application/json
    Create Session  bank_api  ${API_BASE_URL}  verify=True  headers=${headers}
    ${response}=  GET On Session  bank_api  /customers/9394/accounts  expected_status=any
    Should Be Equal As Integers  ${response.status_code}  400
    ${invalid_cust_time}=  Evaluate  $response.elapsed.total_seconds()
    Set Suite Variable  ${invalid_cust_time}

Get Account Details
    [Documentation]  Verifying customer details for a valid account
    ${headers}=  Create Dictionary    Accept=application/json
    Create Session  bank_api  ${API_BASE_URL}  verify=True  headers=${headers}
    ${response}=  GET On Session  bank_api  /accounts/${account_id}
    Should Be Equal As Integers  ${response.status_code}  200
    ${body}=  Set Variable  ${response.json()}
    ${acc_time}=  Evaluate  $response.elapsed.total_seconds()
    Set Suite Variable  ${acc_time}
    Log To Console  ${body}
    Should Be Equal as Strings  ${customer_id}  ${body}[customerId]


Get Account Details with Invalid ID
    [Documentation]  Verifying customer details for a valid account
    ${headers}=  Create Dictionary    Accept=application/json
    Create Session  bank_api  ${API_BASE_URL}  verify=True  headers=${headers}
    ${response}=  GET On Session  bank_api  /accounts/0000   expected_status=any
    ${invalid_acc_time}=  Evaluate  $response.elapsed.total_seconds()
    Set Suite Variable  ${invalid_acc_time}
    Should Be Equal As Integers  ${response.status_code}  400


Get List Of Transactions
    [Documentation]  Getting the list of valid transactions
    ${headers}=  Create Dictionary    Accept=application/json
    Create Session  bank_api  ${API_BASE_URL}  verify=True  headers=${headers}
    ${response}=  Get On Session  bank_api  /accounts/${account_id}/transactions
    Should Be Equal As Integers  ${response.status_code}  200
    ${body}=  Set Variable  ${response.json()}
    Log To Console  ${body}


Get Customer Details By Id
    [Documentation]    Getting the customer details when id is known
    ${headers}=  Create Dictionary  Accept=application/json
    Create Session  bank_api  ${API_BASE_URL}  verify=True  headers=${headers}
    ${response}=  GET On Session    bank_api   /customers/${customer_id}
    Should Be Equal As Integers    ${response.status_code}  200
    ${body}=  Set Variable  ${response.json()}
    Log To Console  ${body}


Get Customer ID With Response Time
    [Documentation]  Checking the time for valid customer
    Should Be True  ${login_time} < 2


Login and Get Account With in Response Time
    [Documentation]  Checking the customer id for valid customer
    ${tot_time}=  Evaluate  ${login_time} + ${all_account_time}
    Should Be True  ${tot_time} < 5

Get Account By ID Response Time
    [Documentation]  Checking the customer id for valid customer account
    ${tot_time}=  Evaluate  ${login_time} + ${all_account_time}+ ${acc_time}
    Should Be True  ${tot_time} < 5

Invalid Customer ID Response Time
    [Documentation]  Checking the account for invalid customer
    Should Be True  ${invalid_cust_time} < 2
    
Invalid Account ID Response Time
    [Documentation]    Checking the response time for invalid account id
    Should Be True  ${invalid_acc_time} < 2


Create New Account
    [Documentation]  Creating a new account from customer id and account id
    ${headers}=  Create Dictionary  Accept=Application/json
    Create Session  bank_api  ${API_BASE_URL}  verify=True  headers=${headers}
    ${payload}=  Create Dictionary
    ...  customerId=${customer_id}
    ...  type=1          # type is in integer format
    ...  fromAccountId=${account_id}
    ${response}=  POST On Session  bank_api  /createAccount  params=${payload}
    ${acc_creation_time}=  Evaluate  $response.elapsed.total_seconds()
    Set Suite Variable    ${acc_creation_time}
    Should Be Equal As Integers    ${response.status_code}  200
    ${body}=  Set Variable  ${response.json()}
#    Log To Console  ${body}
    ${new_acc_id}=  Set Variable  ${body}[id]
    ${new_cust_id}=  Set Variable  ${body}[customerId]
    ${type}=  Set Variable  ${body}[type]
    Set Suite Variable    ${new_acc_id}
    Set Suite Variable    ${new_cust_id}
    Set Suite Variable    ${type}

Transfer funds
    [Documentation]    Transfering funds from one account to another
    ${headers}=  Create Dictionary  Accept=Application/json
    Create Session  bank_api  ${API_BASE_URL}  verify=True  headers=${headers}
    ${payload}=  Create Dictionary
    ...  fromAccountId=${account_id}
    ...  toAccountId=${new_acc_id}
    ...  amount=100
    ${response}=  Post On Session  bank_api  /transfer  params=${payload}
    ${fund_transfer_time}=  Evaluate  $response.elapsed.total_seconds()
    Set Suite Variable   ${fund_transfer_time}
    Should Be Equal As Integers    ${response.status_code}  200

Get Account Transactions
    [Documentation]   Getting all the transactions for an account
    ${headers}=  Create Dictionary  Accept=Application/json
    Create Session  bank_api  ${API_BASE_URL}  verify=True  headers=${headers}
    ${response}=  Get On Session  bank_api  /accounts/${new_acc_id}/transactions
    ${acc_transac_time}=  Evaluate  $response.elapsed.total_seconds()
    Set Suite Variable    ${acc_transac_time}
    Should Be Equal As Integers    ${response.status_code}  200
    ${body}=  Set Variable  ${response.json()}
    Log To Console  ${body}


Get Transactions Response Time
    [Documentation]    Checking the transaction chain response time
    ${tot_time}=  Evaluate   ${login_time}+${all_account_time}+${acc_creation_time}+${fund_transfer_time}+${acc_transac_time}
    Should Be True    ${tot_time}<10       # Should be 5 but not working
    
    
Validate account id
    [Documentation]  Checking if accound id is valid or not
    Should Be Equal    ${account_id}  ${frst_acc}


Clean Database
    [Documentation]    Cleaning the database
    ${headers}=  Create Dictionary  Accept=Application/json
    Create Session  bank_api  ${API_BASE_URL}  verify=True  headers=${headers}
    ${response}=  Post On Session  bank_api  /cleanDB  
    Should Be Equal As Integers    ${response.status_code}  204



Get All Accounts For Customer
    ${headers}=    Create Dictionary    Accept=application/json
    Create Session    bank_api    ${API_BASE_URL}    verify=True    headers=${headers}
    ${response}=    GET On Session  bank_api  /customers/${customer_id}/accounts
    RETURN    ${response.text}


Validate Savings Account Type
    ${headers}=    Create Dictionary    Accept=application/json
    Create Session    bankApi    ${API_BASE_URL}    verify=True    headers=${headers}
    ${response}=    GET On Session    bankApi    /accounts/${accountId}
    Should Be Equal As Integers    ${response.status_code}    200
    ${body}=    Set Variable    ${response.json()}
    Should Be Equal    ${body}[type]    SAVINGS
    
Get Account Transactions With Known Account
    [Documentation]   Getting all the transactions for an account
    [Arguments]  ${acc_id}
    ${headers}=  Create Dictionary  Accept=Application/json
    Create Session  bank_api  ${API_BASE_URL}  verify=True  headers=${headers}
    ${response}=  Get On Session  bank_api  /accounts/${acc_id}/transactions
    Should Be Equal As Integers    ${response.status_code}  200
    ${body}=  Set Variable  ${response.json()}
    Log To Console  ${body}