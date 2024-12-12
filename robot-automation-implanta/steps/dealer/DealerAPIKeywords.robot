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

#QA
${QA_BASE_URL}      https://wawdmrag7c.execute-api.us-east-1.amazonaws.com/qa
${QA_SENDER_ID}     eadbe3dc-f402-42b3-8c3e-ecb98b975666
&{api_headers_qa}       Content-Type=application/json      x-api-key=QyPsPAii8L9N08Ke2RH1C3noYBKBADEr5uQTNnMC

#STAGE
${STAGE_BASE_URL}   https://yk57x36ayj.execute-api.us-east-1.amazonaws.com/stage
${STAGE_SENDER_ID}  86736e76-560e-4add-a549-673d0c1e0350
&{api_headers_stage}       Content-Type=application/json      x-api-key=xDwL6RuPCN8X3n01cUHp8aTky6lKO0sk7yYpfSpz

${api_output_dealer}    ${BASE_URL}/dealer?
${api_url}           ${BASE_URL}/dealer/eadbe3dc-f402-42b3-8c3e-ecb98b975666
${api_url_noSender}  ${BASE_URL}/dealer/
${api_request_tracking}     ${BASE_URL}/request-tracking/eadbe3dc-f402-42b3-8c3e-ecb98b975666/


&{api_headers_output}       Content-Type=application/json       Authorization=Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6Ikg5bmo1QU9Tc3dNcGhnMVNGeDdqYVYtbEI5dyIsImtpZCI6Ikg5bmo1QU9Tc3dNcGhnMVNGeDdqYVYtbEI5dyJ9.eyJhdWQiOiI1MDhmMDkzYS1iYzc1LTQzODctYWQ3My0wMGQ1YTBjZjZhYmQiLCJpc3MiOiJodHRwczovL3N0cy53aW5kb3dzLm5ldC9mY2IyYjM3Yi01ZGEwLTQ2NmItOWI4My0wMDE0YjY3YTdjNzgvIiwiaWF0IjoxNzI2MTQ5NTcxLCJuYmYiOjE3MjYxNDk1NzEsImV4cCI6MTcyNjE1MzQ3MSwiYWlvIjoiRTJkZ1lEaSt6ZmFsK3Q1MG82Q2ZpOEtzWE43SUFBQT0iLCJhcHBpZCI6IjUwOGYwOTNhLWJjNzUtNDM4Ny1hZDczLTAwZDVhMGNmNmFiZCIsImFwcGlkYWNyIjoiMSIsImlkcCI6Imh0dHBzOi8vc3RzLndpbmRvd3MubmV0L2ZjYjJiMzdiLTVkYTAtNDY2Yi05YjgzLTAwMTRiNjdhN2M3OC8iLCJvaWQiOiI5NGVkY2Y1Ny02MDZkLTRjMDctOGE3Mi00YWQwOTdmN2ZjNGMiLCJyaCI6IjAuQVFzQWU3T3lfS0JkYTBhYmd3QVV0bnA4ZURvSmoxQjF2SWREclhNQTFhRFBhcjBMQUFBLiIsInN1YiI6Ijk0ZWRjZjU3LTYwNmQtNGMwNy04YTcyLTRhZDA5N2Y3ZmM0YyIsInRpZCI6ImZjYjJiMzdiLTVkYTAtNDY2Yi05YjgzLTAwMTRiNjdhN2M3OCIsInV0aSI6IlBxZ2tmcm9rMTBtd2JNT2REY2dtQUEiLCJ2ZXIiOiIxLjAiLCJlbWFpbF92ZXJpZmllZCI6InRydWUiLCJodHRwczovL2JheWVyLmNvbS9hcHBfZGlzcGxheW5hbWUiOiJTZWxsb3V0IE1hbmFnZW1lbnQgLSBJbXBsYW50YSAtIE5QIn0.Yyk8dHDbQATvjbxsfljE9-bv_UNTqXAPwue3dAnTMiCDiao_marwsbvCrHI1x5UEilqZ9AlxUPoxFCPogesJHh9Hm_gUlGzXxn1BuPPfAeBSijY7emRnjtq5tisclD2kQqC3RwPDQ9d4qTCvY-9RT3s7GO1yEsQ9CzhtKnYcJ_3ali0ApywjU5GP4ARIO7ulcz_-0AyA4eOtMEpWGySZ6p2hc8Fq9YzXar13I3Md8mxKAr9Y1Fto2uCv0032mtexxrG85SQ5Nkv9zVGwfKM_3-LL1lbL_G9S-3jODwojGwhzU9oczQs3WnSlEodT3tpG80dfPsosYN57Y89hVX9Lgw     x-api-key=QyPsPAii8L9N08Ke2RH1C3noYBKBADEr5uQTNnMC        x-api-token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoib3V0cHV0QGJheWVyLmNvbSIsInJvbGUiOiJFeHRlcm5hbCIsIm5iZiI6MTcwOTU1NTM2MiwiZXhwIjo5NzA5NTU4OTYyLCJpYXQiOjE3MDk1NTUzNjJ9.t1cpsavW826Ozsw_gJoAH1LBh210QEc7RTcWvbmnGG0    consumer-key=DATALAKE

{dealer_data_file}   C:/Users/EAGHP/PycharmProjects/robot-automation-implanta/Data/payloads/dealer_data.json
{dealerMainInternalCode_data_file}   C:/Users/EAGHP/PycharmProjects/robot-automation-implanta/Data/payloads/dealerMainInternalCode_data.json
{dois_dealers_data_file}   C:/Users/EAGHP/PycharmProjects/robot-automation-implanta/Data/payloads/dois_dealers_data.json
{atualizacao_dealer_data_file}   C:/Users/EAGHP/PycharmProjects/robot-automation-implanta/Data/payloads/atualizacao_dealer_data.json
{atualizacao_dois_dealers_data_file}   C:/Users/EAGHP/PycharmProjects/robot-automation-implanta/Data/payloads/atualizacao_dois_dealers_data.json


*** Keywords ***
Set Environment Variables
    [Arguments]    ${ambiente}
    Run Keyword If    '${ambiente}' == 'QA'    Set QA Environment
    Run Keyword If    '${ambiente}' == 'STAGE'    Set Stage Environment

Set QA Environment
    Set Suite Variable    ${BASE_URL}    ${QA_BASE_URL}
    Set Suite Variable    ${SENDER_ID}   ${QA_SENDER_ID}
    Set Suite Variable    &{api_headers}   &{api_headers_qa}


Set Stage Environment
    Set Suite Variable    ${BASE_URL}    ${STAGE_BASE_URL}
    Set Suite Variable    ${SENDER_ID}   ${STAGE_SENDER_ID}
    Set Suite Variable    &{api_headers}   &{api_headers_stage}

Given que tenho acesso ao servico de Dealer
    Create Session    my_alias    ${BASE_URL}/dealer/${SENDER_ID}


When realizo a criacao do dealer com todos os dados validos
    ${result}=    Modify Dealer Internal Code     Criação de um novo Dealer      Cenário 1
    ${dealer_data_content}=    Get File    ${dealer_data_file}
    ${response}=    Post Request    my_alias    ${BASE_URL}/dealer/${SENDER_ID}     data=${dealer_data_content}    headers=&{api_headers}
    Log     ${response.json()}
    ${response_json}=    Set Variable    ${response.json()}
    ${trace_id}=    Get From Dictionary    ${response_json}    traceId
    ${result_list}=    Evaluate    $result if isinstance($result, list) else $result.split(", ")
    ${dealer_internal_code}=    Get From List    ${result_list}    0
    ${document_number}=    Get From List    ${result_list}    1

    Set Suite Variable    ${trace_id}
    Set Suite Variable    ${dealer_internal_code}
    Set Suite Variable    ${document_number_string}
    Set Suite Variable    ${dealer_data_content}
    Set Suite Variable    ${response}

When realizo a criacao do dealer, inserindo um dealerMainInternalCode valido
    ${result}=    Modify Dealer Main Internal Code     Criação de um novo Dealer, inserindo um dealerMainInternalCode      Cenário 2
    ${dealer_data_content}=    Get File    ${dealerMainInternalCode_data_file}
    ${response}=    Post Request    my_alias    ${api_url}     data=${dealer_data_content}    headers=&{api_headers}
    Log     ${response.json()}
    ${result_list}=    Evaluate    $result if isinstance($result, list) else $result.split(", ")
    ${dealer_internal_code}=    Get From List    ${result_list}    0
    ${document_number}=    Get From List    ${result_list}    1
    Set Suite Variable    ${dealer_internal_code}    ${dealer_internal_code}
    Set Suite Variable    ${document_number}    ${document_number}
    Set Suite Variable    ${dealer_data_content}
    Set Suite Variable    ${response}

When realizo a criacao de dois novos dealers com o internalCode diferente com um countryCode igual
    ${result}=    Modify Dois Dealers     [1]Cenario 3 - Criacao de dois novos Dealers, com o internalCode igual, enviados no mesmo payload      [2]Cenario 3 - Criacao de dois novos Dealers, com o internalCode igual, enviados no mesmo payload
    ${dealer_data_content}=    Get File    ${dois_dealers_data_file}
    Log     ${dealer_data_content}
    ${response}=    Post Request    my_alias    ${api_url}     data=${dealer_data_content}    headers=&{api_headers}
    Log     ${response.json()}
    ${result_list}=    Evaluate    $result if isinstance($result, list) else $result.split(", ")
    ${document_number1}=    Get From List    ${result_list}    0
    ${document_number2}=    Get From List    ${result_list}    1
    Set Suite Variable    ${document_number1}    ${document_number1}
    Set Suite Variable    ${document_number2}    ${document_number2}
    Set Suite Variable    ${dealer_data_content}
    Set Suite Variable    ${response}

When realizo a atualizacao dos dados do Dealer, mantendo apenas os campos dealerInternalCode e countryCode iguais em payloads diferentes
    ${result}=    Modify Atualizacao Dealer     TtFt
    ${dealer_data_content}=    Get File    ${atualizacao_dealer_data_file}
    Log     ${dealer_data_content}
    ${response}=    Post Request    my_alias    ${api_url}     data=${dealer_data_content}    headers=&{api_headers}
    Log     ${response.json()}
    ${result_list}=    Evaluate    $result if isinstance($result, list) else $result.split(", ")
    ${document_number}=    Get From List    ${result_list}    0
    Set Suite Variable    ${document_number}    ${document_number}
    Set Suite Variable    ${dealer_data_content}
    Set Suite Variable    ${response}

When realizo a atualizacao dos dados do Dealer, mantendo apenas os campos dealerInternalCode e countryCode iguais no mesmo payload
    ${result}=    Modify Atualizacao Dealer Com Multiplos Payloads
    ${dealer_data_content}=    Get File    ${atualizacao_dois_dealers_data_file}
    Log     ${dealer_data_content}
    ${response}=    Post Request    my_alias    ${api_url}     data=${dealer_data_content}    headers=&{api_headers}
    Log     ${response.json()}
    ${result_list}=    Evaluate    $result if isinstance($result, list) else $result.split(", ")
    ${dealer_internal_code}=    Get From List    ${result_list}    0
    ${document_number1}=    Get From List    ${result_list}    1
    ${document_number2}=    Get From List    ${result_list}    2
    Set Suite Variable    ${dealer_internal_code}    ${dealer_internal_code}
    Set Suite Variable    ${document_number1}    ${document_number1}
    Set Suite Variable    ${document_numbe2}    ${document_number2}
    Set Suite Variable    ${dealer_data_content}
    Set Suite Variable    ${response}

When a POST request is sent to the dealer API with valid data and without sender
    ${dealer_data_content}=    Get File    ${dealer_data_file}
    ${response}=    Post Request    my_alias    ${api_url_noSender}     data=${dealer_data_content}    headers=&{api_headers}
    Set Test Variable    ${response}

Then o codigo de status da resposta deve ser 200
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
    [Arguments]    ${dealer_internal_code}
    ${db_connection}=    Connect To Database    psycopg2    ${DB_NAME}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT}
    Should Not Be Equal As Strings    ${db_connection}    None    Database connection failed
    ${query}=    Set Variable    SELECT * FROM sellout.dealers WHERE DATE("updatedAt") BETWEEN '2024-06-19' AND '2024-06-19' AND "dealerInternalCode" = '${dealer_internal_code}' ORDER BY "createdAt" ASC;
    ${result}=    Execute Sql String    ${query}    db=${db_connection}
    Disconnect From Database    ${db_connection}
    [Return]    ${result}

And Execute the script
    [Arguments]    ${dealer_internal_code}
    ${result}=    Run Process    python    C:\\Users\\EAGHP\\PycharmProjects\\robot-automation-implanta\\config\\database.py    (${dealer_internal_code},    ${DB_NAME},    ${DB_USER},    ${DB_PASSWORD},    ${DB_HOST},    ${DB_PORT})    shell=True
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

And valido na api de output de dealer o registro
    ${payload_de_envio}=    Get File    ${dealer_data_file}
    ${dealer_data_content}=    Get File    ${dealer_data_file}
    ${dealer_data}=    Evaluate     ${dealer_data_content}

    ${dealers}=    Get From Dictionary    ${dealer_data}    dealers
    ${dealer}=    Set Variable    ${dealers}[0]
    ${expected_country_code}=    Get From Dictionary    ${dealer}    countryCode
    ${documents}=    Get From Dictionary    ${dealer}    documents
    ${first_document}=    Get From List    ${documents}    0
    ${expected_document_number}=    Get From Dictionary    ${first_document}    number
 #   ${expected_document_number}=    Evaluate    int('${expected_document_number}')

    ${url}=    Set Variable    ${api_output_dealer}documentNumber=${expected_document_number}&countryCode=${expected_country_code}
 #  ${url}    Replace String    ${url}    ' '    ''
    ${response}=    GET On Session    my_alias    ${url}    headers=&{api_headers_output}    timeout=30
    ${response_json}=    Set Variable    ${response.json()}

    # Validate dealerInternalCode
    ${dealers}=    Get From Dictionary    ${dealer_data}    dealers
    ${dealer}=    Set Variable    ${dealers}[0]
    ${expected_dealer_internal_code}=    Get From Dictionary    ${dealer}    dealerInternalCode
    ${dealers}=    Get From Dictionary    ${response_json}    dealers
    ${dealer}=    Set Variable    ${dealers}[0]
    ${actual_dealer_internal_code}=    Get From Dictionary    ${dealer}    dealerInternalCode
    Should Be Equal    ${expected_dealer_internal_code}    ${actual_dealer_internal_code}

    # Validate documents[].number
    ${dealers}=    Get From Dictionary    ${dealer_data}    dealers
    ${dealer}=    Set Variable    ${dealers}[0]
    ${documents}=    Get From Dictionary    ${dealer}    documents
    ${document}=    Set Variable    ${documents}[0]
    ${expected_document_number}=    Get From Dictionary    ${document}    number
    ${dealers}=    Get From Dictionary    ${response_json}    dealers
    ${dealer}=    Set Variable    ${dealers}[0]
    ${documents}=    Get From Dictionary    ${dealer}    documents
    ${document}=    Set Variable    ${documents}[0]
    ${actual_document_number}=    Get From Dictionary    ${document}    number
    Should Be Equal    ${expected_document_number}    ${actual_document_number}

    # Validate locationType and addressType
    ${dealers}=    Get From Dictionary    ${dealer_data}    dealers
    ${dealer}=    Set Variable    ${dealers}[0]
    ${addresses}=    Get From Dictionary    ${dealer}    addresses
    ${address}=    Set Variable    ${addresses}[0]
    ${expected_location_type}=    Get From Dictionary    ${address}    locationType
    ${expected_address_type}=    Get From Dictionary    ${address}    addressType
    ${expected_street_type}=    Get From Dictionary    ${address}    street

    ${dealers}=    Get From Dictionary    ${response_json}    dealers
    ${dealer}=    Set Variable    ${dealers}[0]
    ${addresses}=    Get From Dictionary    ${dealer}    addresses
    ${address}=    Set Variable    ${addresses}[0]

    ${actual_location_type}=    Get From Dictionary    ${address}    locationType
    ${actual_address_type}=    Get From Dictionary    ${address}    addressType
    ${actual_street_type}=    Get From Dictionary    ${address}    street
    Should Be Equal    ${expected_location_type}    ${actual_location_type}
    Should Be Equal    ${expected_address_type}    ${actual_address_type}
    Should Be Equal    ${expected_street_type}    ${actual_street_type}

And valido na api de request-tracking de dealer o registro
    ${url}=    Set Variable    ${BASE_URL}/request-tracking/${SENDER_ID}/${trace_id}
 #  ${url}    Replace String    ${url}    ' '    ''
    ${response}=    Wait Until Keyword Succeeds    20s    5s    GET On Session    my_alias    ${url}    headers=&{api_headers}    timeout=30
    ${response_json}=    Set Variable    ${response.json()}
    Log    "Resposta da API de tracking: ${response.content}"

    # Valida os campos principais do payload
    Should Be Equal As Strings    ${response_json['payloadType']}    DEALER
    Should Be Equal As Strings    ${response_json['status']}    RECEIVED
    Should Be Equal As Strings    ${response_json['responseCode']}    200
    Should Be Equal As Strings    ${response_json['recordCount']}    1

    # Valida os detalhes
#    ${details}=    Get From Dictionary    ${response_json}    details
#    ${first_detail}=    Get From List    ${details}    0
#    Should Be Equal As Strings    ${first_detail['resultType']}    APPROVED_DATA_QUALITY
#    Should Be Equal As Strings    ${first_detail['payloadIndex']}    0
#    Should Be Equal As Strings    ${first_detail['message']}    Dealer data quality approved

And valido na api de output de dealer o registro com o dealerMainInternalCode cadastrado
    ${payload_de_envio}=    Get File    ${dealerMainInternalCode_data_file}
    ${dealer_data_content}=    Get File    ${dealerMainInternalCode_data_file}
    ${dealer_data}=    Evaluate     ${dealer_data_content}
    ${dealers}=    Get From Dictionary    ${dealer_data}    dealers
    ${dealer}=    Set Variable    ${dealers}[0]
    ${expected_country_code}=    Get From Dictionary    ${dealer}    countryCode

    ${response}=    Get Request    my_alias    ${api_output_dealer}documentNumber=${document_number}&countryCode=${expected_country_code}       headers=&{api_headers_output}
    ${response_json}=    Set Variable    ${response.json()}

    # Validate dealerInternalCode
    ${dealers}=    Get From Dictionary    ${dealer_data}    dealers
    ${dealer}=    Set Variable    ${dealers}[0]
    ${expected_dealer_internal_code}=    Get From Dictionary    ${dealer}    dealerInternalCode
    ${dealers}=    Get From Dictionary    ${response_json}    dealers
    ${dealer}=    Set Variable    ${dealers}[0]
    ${actual_dealer_internal_code}=    Get From Dictionary    ${dealer}    dealerInternalCode
    Should Be Equal    ${expected_dealer_internal_code}    ${actual_dealer_internal_code}

    # Validate dealerMainInternalCode
    ${dealers}=    Get From Dictionary    ${dealer_data}    dealers
    ${dealer}=    Set Variable    ${dealers}[0]
    ${expected_dealer_internal_code}=    Get From Dictionary    ${dealer}    dealerMainInternalCode
    ${dealers}=    Get From Dictionary    ${response_json}    dealers
    ${dealer}=    Set Variable    ${dealers}[0]
    ${actual_dealer_internal_code}=    Get From Dictionary    ${dealer}    dealerMainInternalCode
    Should Be Equal    ${expected_dealer_internal_code}    ${actual_dealer_internal_code}

    # Validate documents[].number
    ${dealers}=    Get From Dictionary    ${dealer_data}    dealers
    ${dealer}=    Set Variable    ${dealers}[0]
    ${documents}=    Get From Dictionary    ${dealer}    documents
    ${document}=    Set Variable    ${documents}[0]
    ${expected_document_number}=    Get From Dictionary    ${document}    number
    ${dealers}=    Get From Dictionary    ${response_json}    dealers
    ${dealer}=    Set Variable    ${dealers}[0]
    ${documents}=    Get From Dictionary    ${dealer}    documents
    ${document}=    Set Variable    ${documents}[0]
    ${actual_document_number}=    Get From Dictionary    ${document}    number
    Should Be Equal    ${expected_document_number}    ${actual_document_number}

    # Validate locationType and addressType
    ${dealers}=    Get From Dictionary    ${dealer_data}    dealers
    ${dealer}=    Set Variable    ${dealers}[0]
    ${addresses}=    Get From Dictionary    ${dealer}    addresses
    ${address}=    Set Variable    ${addresses}[0]
    ${expected_location_type}=    Get From Dictionary    ${address}    locationType
    ${expected_address_type}=    Get From Dictionary    ${address}    addressType
    ${expected_street_type}=    Get From Dictionary    ${address}    street

    ${dealers}=    Get From Dictionary    ${response_json}    dealers
    ${dealer}=    Set Variable    ${dealers}[0]
    ${addresses}=    Get From Dictionary    ${dealer}    addresses
    ${address}=    Set Variable    ${addresses}[0]

    ${actual_location_type}=    Get From Dictionary    ${address}    locationType
    ${actual_address_type}=    Get From Dictionary    ${address}    addressType
    ${actual_street_type}=    Get From Dictionary    ${address}    street
    Should Be Equal    ${expected_location_type}    ${actual_location_type}
    Should Be Equal    ${expected_address_type}    ${actual_address_type}
    Should Be Equal    ${expected_street_type}    ${actual_street_type}

And valido na api de output de dealer o primeiro registro enviado
    ${payload_de_envio}=    Get File    ${dois_dealers_data_file}
    ${dealer_data_content}=    Get File    ${dois_dealers_data_file}
    ${dealer_data}=    Evaluate     ${dealer_data_content}
    ${dealers}=    Get From Dictionary    ${dealer_data}    dealers
    ${dealer}=    Set Variable    ${dealers}[0]
    ${expected_country_code}=    Get From Dictionary    ${dealer}    countryCode

    ${response}=    Get Request    my_alias    ${api_output_dealer}documentNumber=${document_number1}&countryCode=${expected_country_code}       headers=&{api_headers_output}
    ${response_json}=    Set Variable    ${response.json()}

    # Validate dealerInternalCode
    ${dealers}=    Get From Dictionary    ${dealer_data}    dealers
    ${dealer}=    Set Variable    ${dealers}[0]
    ${expected_dealer_internal_code}=    Get From Dictionary    ${dealer}    dealerInternalCode
    ${dealers}=    Get From Dictionary    ${response_json}    dealers
    ${dealer}=    Set Variable    ${dealers}[0]
    ${actual_dealer_internal_code}=    Get From Dictionary    ${dealer}    dealerInternalCode
    Should Be Equal    ${expected_dealer_internal_code}    ${actual_dealer_internal_code}

    # Validate documents[].number
    ${dealers}=    Get From Dictionary    ${dealer_data}    dealers
    ${dealer}=    Set Variable    ${dealers}[0]
    ${documents}=    Get From Dictionary    ${dealer}    documents
    ${document}=    Set Variable    ${documents}[0]
    ${expected_document_number}=    Get From Dictionary    ${document}    number
    ${dealers}=    Get From Dictionary    ${response_json}    dealers
    ${dealer}=    Set Variable    ${dealers}[0]
    ${documents}=    Get From Dictionary    ${dealer}    documents
    ${document}=    Set Variable    ${documents}[0]
    ${actual_document_number}=    Get From Dictionary    ${document}    number
    Should Be Equal    ${expected_document_number}    ${actual_document_number}

    # Validate locationType and addressType
    ${dealers}=    Get From Dictionary    ${dealer_data}    dealers
    ${dealer}=    Set Variable    ${dealers}[0]
    ${addresses}=    Get From Dictionary    ${dealer}    addresses
    ${address}=    Set Variable    ${addresses}[0]
    ${expected_location_type}=    Get From Dictionary    ${address}    locationType
    ${expected_address_type}=    Get From Dictionary    ${address}    addressType
    ${expected_street_type}=    Get From Dictionary    ${address}    street

    ${dealers}=    Get From Dictionary    ${response_json}    dealers
    ${dealer}=    Set Variable    ${dealers}[0]
    ${addresses}=    Get From Dictionary    ${dealer}    addresses
    ${address}=    Set Variable    ${addresses}[0]

    ${actual_location_type}=    Get From Dictionary    ${address}    locationType
    ${actual_address_type}=    Get From Dictionary    ${address}    addressType
    ${actual_street_type}=    Get From Dictionary    ${address}    street
    Should Be Equal    ${expected_location_type}    ${actual_location_type}
    Should Be Equal    ${expected_address_type}    ${actual_address_type}
    Should Be Equal    ${expected_street_type}    ${actual_street_type}

And valido na api de output de dealer o segundo registro enviado
    [Arguments]     ${fluxo}
    ${payload_de_envio}=    Escolha do Fluxo de Consulta    ${fluxo}
    ${dealer_data_content}=    Get File    ${payload_de_envio}
    ${dealer_data}=    Evaluate     ${dealer_data_content}
    ${dealers}=    Get From Dictionary    ${dealer_data}    dealers
    ${dealer}=    Set Variable    ${dealers}[0]
    ${expected_country_code}=    Get From Dictionary    ${dealer}    countryCode

    ${response}=    Get Request    my_alias    ${api_output_dealer}documentNumber=${document_number2}&countryCode=${expected_country_code}       headers=&{api_headers_output}
    ${response_json}=    Set Variable    ${response.json()}

    # Validate dealerInternalCode
    ${dealers}=    Get From Dictionary    ${dealer_data}    dealers
    ${dealer}=    Set Variable    ${dealers}[1]
    ${expected_dealer_internal_code}=    Get From Dictionary    ${dealer}    dealerInternalCode
    ${dealers}=    Get From Dictionary    ${response_json}    dealers
    ${dealer}=    Set Variable    ${dealers}[0]
    ${actual_dealer_internal_code}=    Get From Dictionary    ${dealer}    dealerInternalCode
    Should Be Equal    ${expected_dealer_internal_code}    ${actual_dealer_internal_code}

    # Validate documents[].number
    ${dealers}=    Get From Dictionary    ${dealer_data}    dealers
    ${dealer}=    Set Variable    ${dealers}[1]
    ${documents}=    Get From Dictionary    ${dealer}    documents
    ${document}=    Set Variable    ${documents}[0]
    ${expected_document_number}=    Get From Dictionary    ${document}    number
    ${dealers}=    Get From Dictionary    ${response_json}    dealers
    ${dealer}=    Set Variable    ${dealers}[0]
    ${documents}=    Get From Dictionary    ${dealer}    documents
    ${document}=    Set Variable    ${documents}[0]
    ${actual_document_number}=    Get From Dictionary    ${document}    number
    Should Be Equal    ${expected_document_number}    ${actual_document_number}

    # Validate locationType and addressType
    ${dealers}=    Get From Dictionary    ${dealer_data}    dealers
    ${dealer}=    Set Variable    ${dealers}[1]
    ${addresses}=    Get From Dictionary    ${dealer}    addresses
    ${address}=    Set Variable    ${addresses}[0]
    ${expected_location_type}=    Get From Dictionary    ${address}    locationType
    ${expected_address_type}=    Get From Dictionary    ${address}    addressType
    ${expected_street_type}=    Get From Dictionary    ${address}    street

    ${dealers}=    Get From Dictionary    ${response_json}    dealers
    ${dealer}=    Set Variable    ${dealers}[0]
    ${addresses}=    Get From Dictionary    ${dealer}    addresses
    ${address}=    Set Variable    ${addresses}[0]

    ${actual_location_type}=    Get From Dictionary    ${address}    locationType
    ${actual_address_type}=    Get From Dictionary    ${address}    addressType
    ${actual_street_type}=    Get From Dictionary    ${address}    street
    Should Be Equal    ${expected_location_type}    ${actual_location_type}
    Should Be Equal    ${expected_address_type}    ${actual_address_type}
    Should Be Equal    ${expected_street_type}    ${actual_street_type}

And valido na api de output a atualizacao dos dados do Dealer
    ${payload_de_envio}=    Get File    ${atualizacao_dealer_data_file}
    ${dealer_data_content}=    Get File    ${atualizacao_dealer_data_file}
    ${dealer_data}=    Evaluate     ${dealer_data_content}
    ${dealers}=    Get From Dictionary    ${dealer_data}    dealers
    ${dealer}=    Set Variable    ${dealers}[0]
    ${expected_country_code}=    Get From Dictionary    ${dealer}    countryCode

    ${response}=    Get Request    my_alias    ${api_output_dealer}documentNumber=${document_number}&countryCode=${expected_country_code}       headers=&{api_headers_output}
    ${response_json}=    Set Variable    ${response.json()}

    # Validate dealerInternalCode
    ${dealers}=    Get From Dictionary    ${dealer_data}    dealers
    ${dealer}=    Set Variable    ${dealers}[0]
    ${expected_dealer_internal_code}=    Get From Dictionary    ${dealer}    dealerInternalCode
    ${dealers}=    Get From Dictionary    ${response_json}    dealers
    ${dealer}=    Set Variable    ${dealers}[0]
    ${actual_dealer_internal_code}=    Get From Dictionary    ${dealer}    dealerInternalCode
    Should Be Equal    ${expected_dealer_internal_code}    ${actual_dealer_internal_code}

    # Validate documents[].number
    ${dealers}=    Get From Dictionary    ${dealer_data}    dealers
    ${dealer}=    Set Variable    ${dealers}[0]
    ${documents}=    Get From Dictionary    ${dealer}    documents
    ${document}=    Set Variable    ${documents}[0]
    ${expected_document_number}=    Get From Dictionary    ${document}    number
    ${dealers}=    Get From Dictionary    ${response_json}    dealers
    ${dealer}=    Set Variable    ${dealers}[0]
    ${documents}=    Get From Dictionary    ${dealer}    documents
    ${document}=    Set Variable    ${documents}[0]
    ${actual_document_number}=    Get From Dictionary    ${document}    number
    Should Be Equal    ${expected_document_number}    ${actual_document_number}

    # Validate locationType and addressType
    ${dealers}=    Get From Dictionary    ${dealer_data}    dealers
    ${dealer}=    Set Variable    ${dealers}[0]
    ${addresses}=    Get From Dictionary    ${dealer}    addresses
    ${address}=    Set Variable    ${addresses}[0]
    ${expected_location_type}=    Get From Dictionary    ${address}    locationType
    ${expected_address_type}=    Get From Dictionary    ${address}    addressType
    ${expected_street_type}=    Get From Dictionary    ${address}    street

    ${dealers}=    Get From Dictionary    ${response_json}    dealers
    ${dealer}=    Set Variable    ${dealers}[0]
    ${addresses}=    Get From Dictionary    ${dealer}    addresses
    ${address}=    Set Variable    ${addresses}[0]

    ${actual_location_type}=    Get From Dictionary    ${address}    locationType
    ${actual_address_type}=    Get From Dictionary    ${address}    addressType
    ${actual_street_type}=    Get From Dictionary    ${address}    street
    Should Be Equal    ${expected_location_type}    ${actual_location_type}
    Should Be Equal    ${expected_address_type}    ${actual_address_type}
    Should Be Equal    ${expected_street_type}    ${actual_street_type}
