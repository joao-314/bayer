*** Settings ***
Library         RequestsLibrary
Library         OperatingSystem
Library         DatabaseLibrary

*** Variables ***
${api_url}           https://wawdmrag7c.execute-api.us-east-1.amazonaws.com/qa/dealer/eadbe3dc-f402-42b3-8c3e-ecb98b975666
${api_url_noSender}  https://wawdmrag7c.execute-api.us-east-1.amazonaws.com/qa/dealer/
&{api_headers}       Content-Type=application/json    x-api-key=QyPsPAii8L9N08Ke2RH1C3noYBKBADEr5uQTNnMC
${dealer_data_file}   C:/Users/EAGHP/PycharmProjects/robot-automation-implanta/config/dealer_data.json

*** Test Cases ***
Test Dealer API Returns 200 Status Code
    Create Session    my_alias    ${api_url}
    ${dealer_data_content}=    Get File    ${dealer_data_file}
    ${response}=    Post Request    my_alias    ${api_url}     data=${dealer_data_content}    headers=&{api_headers}
    Should Be Equal As Strings    ${response.status_code}    200
    Log    Received 200 status code as expected

Test Dealer API Returns 403 Status Code
    Create Session    my_alias    ${api_url_noSender}
    ${dealer_data_content}=    Get File    ${dealer_data_file}
    ${response}=    Post Request    my_alias    ${api_url_noSender}     data=${dealer_data_content}    headers=&{api_headers}
    ${response_body}=    Convert To String    ${response.content}
    Should Be Equal As Strings    ${response_body}  {"message":"Missing Authentication Token"}
    Should Be Equal As Strings    ${response.status_code}   403
    Log    Received 403 status code as expected

Test Dealer Data Base




   #Comands
   # robot -d C:/Users/EAGHP/PycharmProjects/robot-automation-implanta/Reports -t "Test Dealer API Returns 502 Status Code" raw_data.robot

