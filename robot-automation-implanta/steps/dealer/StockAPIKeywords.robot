*** Settings ***
Library         RequestsLibrary
Library         OperatingSystem
Library         DatabaseLibrary
Library         Process
Library         psycopg2
Library         Collections
Library         C:/Users/EAGHP/PycharmProjects/robot-automation-implanta/config/UtilsStock.robot
Resource        C:/Users/EAGHP/PycharmProjects/robot-automation-implanta/config/UtilsStock.robot

*** Variables ***
#QA
${QA_BASE_URL}      https://wawdmrag7c.execute-api.us-east-1.amazonaws.com/qa
${QA_SENDER_ID}     eadbe3dc-f402-42b3-8c3e-ecb98b975666
&{api_headers_qa}   Content-Type=application/json      x-api-key=QyPsPAii8L9N08Ke2RH1C3noYBKBADEr5uQTNnMC

#STAGE
${STAGE_BASE_URL}       https://yk57x36ayj.execute-api.us-east-1.amazonaws.com/stage
${STAGE_SENDER_ID}      86736e76-560e-4add-a549-673d0c1e0350
&{api_headers_stage}    Content-Type=application/json      x-api-key=xDwL6RuPCN8X3n01cUHp8aTky6lKO0sk7yYpfSpz


&{api_headers_output}               Content-Type=application/json       Authorization=Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6Ikg5bmo1QU9Tc3dNcGhnMVNGeDdqYVYtbEI5dyIsImtpZCI6Ikg5bmo1QU9Tc3dNcGhnMVNGeDdqYVYtbEI5dyJ9.eyJhdWQiOiI1MDhmMDkzYS1iYzc1LTQzODctYWQ3My0wMGQ1YTBjZjZhYmQiLCJpc3MiOiJodHRwczovL3N0cy53aW5kb3dzLm5ldC9mY2IyYjM3Yi01ZGEwLTQ2NmItOWI4My0wMDE0YjY3YTdjNzgvIiwiaWF0IjoxNzI2MTQ5NTcxLCJuYmYiOjE3MjYxNDk1NzEsImV4cCI6MTcyNjE1MzQ3MSwiYWlvIjoiRTJkZ1lEaSt6ZmFsK3Q1MG82Q2ZpOEtzWE43SUFBQT0iLCJhcHBpZCI6IjUwOGYwOTNhLWJjNzUtNDM4Ny1hZDczLTAwZDVhMGNmNmFiZCIsImFwcGlkYWNyIjoiMSIsImlkcCI6Imh0dHBzOi8vc3RzLndpbmRvd3MubmV0L2ZjYjJiMzdiLTVkYTAtNDY2Yi05YjgzLTAwMTRiNjdhN2M3OC8iLCJvaWQiOiI5NGVkY2Y1Ny02MDZkLTRjMDctOGE3Mi00YWQwOTdmN2ZjNGMiLCJyaCI6IjAuQVFzQWU3T3lfS0JkYTBhYmd3QVV0bnA4ZURvSmoxQjF2SWREclhNQTFhRFBhcjBMQUFBLiIsInN1YiI6Ijk0ZWRjZjU3LTYwNmQtNGMwNy04YTcyLTRhZDA5N2Y3ZmM0YyIsInRpZCI6ImZjYjJiMzdiLTVkYTAtNDY2Yi05YjgzLTAwMTRiNjdhN2M3OCIsInV0aSI6IlBxZ2tmcm9rMTBtd2JNT2REY2dtQUEiLCJ2ZXIiOiIxLjAiLCJlbWFpbF92ZXJpZmllZCI6InRydWUiLCJodHRwczovL2JheWVyLmNvbS9hcHBfZGlzcGxheW5hbWUiOiJTZWxsb3V0IE1hbmFnZW1lbnQgLSBJbXBsYW50YSAtIE5QIn0.Yyk8dHDbQATvjbxsfljE9-bv_UNTqXAPwue3dAnTMiCDiao_marwsbvCrHI1x5UEilqZ9AlxUPoxFCPogesJHh9Hm_gUlGzXxn1BuPPfAeBSijY7emRnjtq5tisclD2kQqC3RwPDQ9d4qTCvY-9RT3s7GO1yEsQ9CzhtKnYcJ_3ali0ApywjU5GP4ARIO7ulcz_-0AyA4eOtMEpWGySZ6p2hc8Fq9YzXar13I3Md8mxKAr9Y1Fto2uCv0032mtexxrG85SQ5Nkv9zVGwfKM_3-LL1lbL_G9S-3jODwojGwhzU9oczQs3WnSlEodT3tpG80dfPsosYN57Y89hVX9Lgw     x-api-key=QyPsPAii8L9N08Ke2RH1C3noYBKBADEr5uQTNnMC        x-api-token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoib3V0cHV0QGJheWVyLmNvbSIsInJvbGUiOiJFeHRlcm5hbCIsIm5iZiI6MTcwOTU1NTM2MiwiZXhwIjo5NzA5NTU4OTYyLCJpYXQiOjE3MDk1NTUzNjJ9.t1cpsavW826Ozsw_gJoAH1LBh210QEc7RTcWvbmnGG0    consumer-key=DATALAKE
{stock_data_file}                   C:/Users/EAGHP/PycharmProjects/robot-automation-implanta/Data/payloads/Stock/stock_data.json
{stockMainInternalCode_data_file}   C:/Users/EAGHP/PycharmProjects/robot-automation-implanta/Data/payloads/stockMainInternalCode_data.json
{dois_stocks_data_file}             C:/Users/EAGHP/PycharmProjects/robot-automation-implanta/Data/payloads/dois_stocks_data.json
{atualizacao_stock_data_file}       C:/Users/EAGHP/PycharmProjects/robot-automation-implanta/Data/payloads/atualizacao_stock_data.json
{atualizacao_dois_stocks_data_file} C:/Users/EAGHP/PycharmProjects/robot-automation-implanta/Data/payloads/atualizacao_dois_stocks_data.json


*** Keywords ***
Set Environment Variables
    [Arguments]    ${ambiente}
    Run Keyword If    '${ambiente}' == 'QA'    Set QA Environment
    Run Keyword If    '${ambiente}' == 'STAGE'    Set Stage Environment

Set QA Environment
    Set Suite Variable    ${BASE_URL}    ${QA_BASE_URL}
    Set Suite Variable    ${SENDER_ID}   ${QA_SENDER_ID}
    Set Suite Variable    ${api_output_stock}    ${BASE_URL}/stock?
    Set Suite Variable    ${api_url}    ${BASE_URL}/stock/${QA_SENDER_ID}
    Set Suite Variable    ${api_url_noSender}    ${BASE_URL}/stock/
    Set Suite Variable    ${api_request_tracking}    ${BASE_URL}/request-tracking/${QA_SENDER_ID}/
    Set Suite Variable    &{api_headers}   &{api_headers_qa}


Set Stage Environment
    Set Suite Variable    ${BASE_URL}    ${STAGE_BASE_URL}
    Set Suite Variable    ${SENDER_ID}   ${STAGE_SENDER_ID}
    Set Suite Variable    ${api_output_stock}    ${BASE_URL}/stock?
    Set Suite Variable    ${api_url}    ${BASE_URL}/stock/${QA_SENDER_ID}
    Set Suite Variable    ${api_url_noSender}    ${BASE_URL}/stock/
    Set Suite Variable    ${api_request_tracking}    ${BASE_URL}/request-tracking/${QA_SENDER_ID}/
    Set Suite Variable    &{api_headers}   &{api_headers_stage}

Given que tenho acesso ao servico de Stock
    Create Session    my_alias    ${BASE_URL}/stock/${SENDER_ID}

And que tenha cadastrado um dealer valido
    ${result}=    Modify Dealer Internal Code     Criação de um novo Dealer      Cenário 1
    ${dealer_data_content}=    Get File    ${dealer_data_file}
    ${response}=    Post Request    my_alias    ${BASE_URL}/dealer/${SENDER_ID}     data=${dealer_data_content}    headers=&{api_headers}
    Log     ${response.json()}
    ${response_json}=    Set Variable    ${response.json()}
    ${result_list}=    Evaluate    $result if isinstance($result, list) else $result.split(", ")
    ${document_number}=    Get From List    ${result_list}    1
    ${dealer_internal_code}=    Get From List    ${result_list}    0

    Set Suite Variable    ${dealer_internal_code}

When realizo a criacao do stock com todos os dados validos
    ${result}=    Modify stock     [AUT]CT1-Criacao de um novo Stock    ${dealer_internal_code}
    ${stock_data_content}=    Get File    ${stock_data_file}
    ${response}=    Post Request    my_alias    ${BASE_URL}/stock/${SENDER_ID}     data=${stock_data_content}    headers=&{api_headers}
    Log     ${response.json()}
    ${response_json}=    Set Variable    ${response.json()}
    ${trace_id}=    Get From Dictionary    ${response_json}    traceId

    Set Suite Variable    ${trace_id}
    Set Suite Variable    ${quantity}   ${result}
    Set Suite Variable    ${response}

Then o codigo de status da resposta deve ser 200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    Received 200 status code as expected

And valido na api de output de stock o registro
    ${stock_data_content}=    Get File    ${stock_data_file}
    ${stock_data}=    Evaluate     ${stock_data_content}

    ${dealersStock}=    Get From Dictionary    ${stock_data}    dealersStock
    ${dealersStock_payload}=    Set Variable    ${dealersStock}[0]
    ${stock}=    Get From Dictionary    ${dealersStock_payload}    stock
    ${stock_payload}=    Set Variable    ${stock}[0]
    ${stock_details}=    Get From Dictionary    ${stock_payload}    stockDetail
    ${stock_details_payload}=    Set Variable    ${stock_details}[0]
    ${dealersStock}=    Set Variable    ${dealersStock}[0]
    ${stock}=    Get From Dictionary    ${dealersStock}    stock
    ${stock}=    Set Variable    ${dealersStock}    stock

    ${expected_dealer_internal_code}=    Get From Dictionary    ${dealersStock_payload}    dealerInternalCode
    ${expected_country_code}=    Get From Dictionary    ${dealersStock_payload}    countryCode
    ${expected_frequency}=    Get From Dictionary    ${stock_payload}    frequency
    ${expected_sourceType}=    Get From Dictionary    ${stock_payload}    sourceType
    ${expected_type}=    Get From Dictionary    ${stock_payload}    type
    ${expected_date}=    Get From Dictionary    ${stock_payload}    date
    ${expected_material_code}=    Get From Dictionary    ${stock_payload}    materialCode
    ${expected_unit_of_measure}=    Get From Dictionary    ${stock_payload}    unitOfMeasure
    ${expected_quantity}=    Get From Dictionary    ${stock_details_payload}    quantity
    ${expected_stock_type}=    Get From Dictionary    ${stock_details_payload}    stockType
    ${expected_batch_number}=    Get From Dictionary    ${stock_details_payload}    batchNumber

    ${url}=    Set Variable    ${api_output_stock}materialCode=${expected_material_code}&countryCode=${expected_country_code}&dealerInternalCode=${dealer_internal_code}
 #  ${url}    Replace String    ${url}    ' '    ''
    ${response}=    GET On Session    my_alias    ${url}    headers=&{api_headers_output}    timeout=30
    ${response_json}=    Set Variable    ${response.json()}

    # Validade Datas in output
    ${dealerStock}=    Get From Dictionary    ${response_json}    dealerStocks
    ${dealerStock_response}=    Set Variable    ${dealerStock}[0]
    ${dealerStock_Details}=    Get From Dictionary    ${dealerStock_response}    details
    ${dealerStockDetails_response}=    Set Variable    ${dealerStock_Details}[0]





    ${actual_dealer_internal_code}=    Get From Dictionary    ${dealerStock_response}    dealerInternalCode
    ${actual_country_code}=    Get From Dictionary    ${dealerStock_response}    countryCode
    ${actual_frequency}=    Get From Dictionary    ${dealerStock_response}    frequency
    ${actual_sourceType}=    Get From Dictionary    ${dealerStock_response}    sourceType
    ${actual_type}=    Get From Dictionary    ${dealerStock_response}    type
    ${actual_date}=    Get From Dictionary    ${dealerStock_response}    date
    ${actual_material_code}=    Get From Dictionary    ${dealerStock_response}    materialCode
    ${actual_unit_of_measure}=    Get From Dictionary    ${dealerStock_response}    unitOfMeasure
    ${actual_quantity}=    Get From Dictionary    ${dealerStockDetails_response}    quantity
    ${actual_stock_type}=    Get From Dictionary    ${dealerStockDetails_response}    stockType
    ${actual_batch_number}=    Get From Dictionary    ${dealerStockDetails_response}    batchNumber

    Should Be Equal    ${expected_dealer_internal_code}    ${actual_dealer_internal_code}
  #  Should Be Equal    ${expected_country_code}    ${actual_country_code}
    Should Be Equal    ${expected_frequency}    ${actual_frequency}
    Should Be Equal    ${expected_sourceType}    ${actual_sourceType}
    Should Be Equal    ${expected_type}    ${actual_type}
    Should Be Equal    ${expected_date}    ${actual_date}
    Should Be Equal    ${expected_material_code}    ${actual_material_code}
    Should Be Equal    ${expected_unit_of_measure}    ${actual_unit_of_measure}
    Should Be Equal    ${expected_quantity}    ${actual_quantity}
    Should Be Equal    ${expected_stock_type}    ${actual_stock_type}
    Should Be Equal    ${expected_batch_number}    ${actual_batch_number}
#
#    # Validate stockInternalCode
#    ${expected_stock_internal_code}=    Get From Dictionary    ${stock}    stockInternalCode
#    ${stocks}=    Get From Dictionary    ${response_json}    stocks
#    ${stock}=    Set Variable    ${stocks}[0]
#    ${actual_stock_internal_code}=    Get From Dictionary    ${stock}    stockInternalCode
#    Should Be Equal    ${expected_stock_internal_code}    ${actual_stock_internal_code}
#
#    # Validate documents[].number
#    ${stocks}=    Get From Dictionary    ${stock_data}    stocks
#    ${stock}=    Set Variable    ${stocks}[0]
#    ${documents}=    Get From Dictionary    ${stock}    documents
#    ${document}=    Set Variable    ${documents}[0]
#    ${expected_document_number}=    Get From Dictionary    ${document}    number
#    ${stocks}=    Get From Dictionary    ${response_json}    stocks
#    ${stock}=    Set Variable    ${stocks}[0]
#    ${documents}=    Get From Dictionary    ${stock}    documents
#    ${document}=    Set Variable    ${documents}[0]
#    ${actual_document_number}=    Get From Dictionary    ${document}    number
#    Should Be Equal    ${expected_document_number}    ${actual_document_number}
#
#    # Validate locationType and addressType
#    ${stocks}=    Get From Dictionary    ${stock_data}    stocks
#    ${stock}=    Set Variable    ${stocks}[0]
#    ${addresses}=    Get From Dictionary    ${stock}    addresses
#    ${address}=    Set Variable    ${addresses}[0]
#    ${expected_location_type}=    Get From Dictionary    ${address}    locationType
#    ${expected_address_type}=    Get From Dictionary    ${address}    addressType
#    ${expected_street_type}=    Get From Dictionary    ${address}    street
#
#    ${stocks}=    Get From Dictionary    ${response_json}    stocks
#    ${stock}=    Set Variable    ${stocks}[0]
#    ${addresses}=    Get From Dictionary    ${stock}    addresses
#    ${address}=    Set Variable    ${addresses}[0]
#
#    ${actual_location_type}=    Get From Dictionary    ${address}    locationType
#    ${actual_address_type}=    Get From Dictionary    ${address}    addressType
#    ${actual_street_type}=    Get From Dictionary    ${address}    street
#    Should Be Equal    ${expected_location_type}    ${actual_location_type}
#    Should Be Equal    ${expected_address_type}    ${actual_address_type}
#    Should Be Equal    ${expected_street_type}    ${actual_street_type}

And valido na api de request-tracking de stock o registro
    ${url}=    Set Variable    ${BASE_URL}/request-tracking/${SENDER_ID}/${trace_id}
 #  ${url}    Replace String    ${url}    ' '    ''
    ${response}=    Wait Until Keyword Succeeds    20s    5s    GET On Session    my_alias    ${url}    headers=&{api_headers}    timeout=30
    ${response_json}=    Set Variable    ${response.json()}
    Log    "Resposta da API de tracking: ${response.content}"

    # Valida os campos principais do payload
    Should Be Equal As Strings    ${response_json['payloadType']}    DEALER_STOCK
    Should Be Equal As Strings    ${response_json['status']}    RECEIVED
    Should Be Equal As Strings    ${response_json['responseCode']}    200
    Should Be Equal As Strings    ${response_json['recordCount']}    1
