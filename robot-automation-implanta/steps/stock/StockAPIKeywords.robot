*** Settings ***
Library         RequestsLibrary
Library         OperatingSystem
Library         DatabaseLibrary
Library         Process
Library         psycopg2
Library         C:/Users/EAGHP/PycharmProjects/robot-automation-implanta/config/database.py
Library         Collections

*** Variables ***
${DB_NAME}    postgres
${DB_USER}    selloutmaster
${DB_PASSWORD}   ckPEcqxTg8tccDSzNew
${DB_HOST}    localhost
${DB_PORT}    9013


${BASE_URL}     https://wawdmrag7c.execute-api.us-east-1.amazonaws.com/qa

${api_output_stock}    ${BASE_URL}/stock?
${api_url}           ${BASE_URL}/stock/eadbe3dc-f402-42b3-8c3e-ecb98b975666
${api_url_noSender}  ${BASE_URL}/stock/

&{api_headers}       Content-Type=application/json    x-api-key=QyPsPAii8L9N08Ke2RH1C3noYBKBADEr5uQTNnMC
&{api_headers_output}       Content-Type=application/json    authorization=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoib3V0cHV0QGJheWVyLmNvbSIsInJvbGUiOiJFeHRlcm5hbCIsIm5iZiI6MTcwOTU1NTM2MiwiZXhwIjo5NzA5NTU4OTYyLCJpYXQiOjE3MDk1NTUzNjJ9.t1cpsavW826Ozsw_gJoAH1LBh210QEc7RTcWvbmnGG0
&{stock_data_file}   C:/Users/EAGHP/PycharmProjects/robot-automation-implanta/Data/payloads/stock_data.json

*** Keywords ***
Given que tenho acesso servico de Stock
    Create Session    my_alias    ${api_url}

When realizo a criacao do stock, com todos os dados validos
    ${stock_internal_code}=    Modify Stock Internal Code     Material Code Test
    ${stock_data_content}=    Get File    ${stock_data_file}
    ${response}=    Post Request    my_alias    ${api_url}     data=${stock_data_content}    headers=&{api_headers}
    Set Suite Variable    ${stock_internal_code}    ${stock_internal_code}
    Set Suite Variable    ${stock_data_content}
    Set Suite Variable    ${response}

When a POST request is sent to the stock API with valid data and without sender
    ${stock_data_content}=    Get File    ${stock_data_file}
    ${response}=    Post Request    my_alias    ${api_url_noSender}     data=${stock_data_content}    headers=&{api_headers}
    Set Test Variable    ${response}

Then o codigo de status da resposta deve ser 200 stock
    Should Be Equal As Strings    ${response.status_code}    200
    Log    Received 200 status code as expected

Then the response status code should be 403
    Should Be Equal As Strings    ${response.status_code}    403

Then the response body should contain
    [Arguments]    ${expected_text}
    Should Contain    ${response.content}    ${expected_text}

And the response body should contain "Missing Authentication Token"
    ${response_body}=    Convert To String    ${response.content}
    Set Suite Variable      ${response_body}
    Should Be Equal As Strings    ${response_body}  {"message":"Missing Authentication Token"}

And a query is executed on the database
    [Arguments]    ${stock_internal_code}
    ${db_connection}=    Connect To Database    psycopg2    ${DB_NAME}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT}
    Should Not Be Equal As Strings    ${db_connection}    None    Database connection failed
    ${query}=    Set Variable    SELECT * FROM sellout.stocks WHERE DATE("updatedAt") BETWEEN '2024-06-19' AND '2024-06-19' AND "stockInternalCode" = '${stock_internal_code}' ORDER BY "createdAt" ASC;
    ${result}=    Execute Sql String    ${query}    db=${db_connection}
    Disconnect From Database    ${db_connection}
    [Return]    ${result}

And Execute the script
    [Arguments]    ${stock_internal_code}
    ${result}=    Run Process    python    C:\\Users\\EAGHP\\PycharmProjects\\robot-automation-implanta\\config\\database.py    (${stock_internal_code},    ${DB_NAME},    ${DB_USER},    ${DB_PASSWORD},    ${DB_HOST},    ${DB_PORT})    shell=True
    ${stdout}=    Get Process Result    ${result}    stdout=True
    ${stderr}=    Get Process Result    ${result}    stderr=True
    Log    ${stdout}
    Log    ${stderr}

And the query result should contain
    [Arguments]    ${expected_result}
    ${result_rows}=    Get Number Of Rows    ${result}
    Should Be True    ${result_rows} > 0
    ${result_data}=    Fetch All From Row    ${result}
    Should Contain    ${result_data}    ${expected_result}

And consulto na Api de output de stock
    ${payload_de_envio}=    Get File    ${stock_data_file}
    ${stock_data}=    Evaluate     ${stock_data_content}
    ${response}=    Get Request    my_alias    ${api_output_stock}documentNumber=${document_number}&countryCode=BR       headers=&{api_headers_output}
    ${response_json}=    Set Variable    ${response.json()}

    # Validate stockInternalCode
    ${stocks}=    Get From Dictionary    ${stock_data}    stocks
    ${stock}=    Set Variable    ${stocks}[0]
    ${expected_stock_internal_code}=    Get From Dictionary    ${stock}    stockInternalCode
    ${stocks}=    Get From Dictionary    ${response_json}    stocks
    ${stock}=    Set Variable    ${stocks}[0]
    ${actual_stock_internal_code}=    Get From Dictionary    ${stock}    stockInternalCode
    Should Be Equal    ${expected_stock_internal_code}    ${actual_stock_internal_code}

    # Validate documents[].number
    ${stocks}=    Get From Dictionary    ${stock_data}    stocks
    ${stock}=    Set Variable    ${stocks}[0]
    ${documents}=    Get From Dictionary    ${stock}    documents
    ${document}=    Set Variable    ${documents}[0]
    ${expected_document_number}=    Get From Dictionary    ${document}    number
    ${stocks}=    Get From Dictionary    ${response_json}    stocks
    ${stock}=    Set Variable    ${stocks}[0]
    ${documents}=    Get From Dictionary    ${stock}    documents
    ${document}=    Set Variable    ${documents}[0]
    ${actual_document_number}=    Get From Dictionary    ${document}    number
    Should Be Equal    ${expected_document_number}    ${actual_document_number}

    # Validate locationType and addressType
    ${stocks}=    Get From Dictionary    ${stock_data}    stocks
    ${stock}=    Set Variable    ${stocks}[0]
    ${addresses}=    Get From Dictionary    ${stock}    addresses
    ${address}=    Set Variable    ${addresses}[0]
    ${expected_location_type}=    Get From Dictionary    ${address}    locationType
    ${expected_address_type}=    Get From Dictionary    ${address}    addressType
    ${expected_street_type}=    Get From Dictionary    ${address}    street


    ${stocks}=    Get From Dictionary    ${response_json}    stocks
    ${stock}=    Set Variable    ${stocks}[0]
    ${addresses}=    Get From Dictionary    ${stock}    addresses
    ${address}=    Set Variable    ${addresses}[0]

    ${actual_location_type}=    Get From Dictionary    ${address}    locationType
    ${actual_address_type}=    Get From Dictionary    ${address}    addressType
    ${actual_street_type}=    Get From Dictionary    ${address}    street
    Should Be Equal    ${expected_location_type}    ${actual_location_type}
    Should Be Equal    ${expected_address_type}    ${actual_address_type}
    Should Be Equal    ${expected_street_type}    ${actual_street_type}