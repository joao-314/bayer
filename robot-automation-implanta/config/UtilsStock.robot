*** Settings ***
Library  String
Library  Collections
Library  OperatingSystem
Library  random

*** Variables ***
${stock_data_file}   C:/Users/EAGHP/PycharmProjects/robot-automation-implanta/Data/payloads/Stock/stock_data.json

*** Keywords ***
Modify stock
    [Arguments]    ${batchNumber}   ${dealer_internal_code}
    ${stock_data_content}=    Get File    ${stock_data_file}
    ${stock_data_dict}=    Evaluate    json.loads($stock_data_content)
    ${random_number}=    Evaluate    random.uniform(-99.99, 99.99)    modules=random
    Set To Dictionary    ${stock_data_dict["dealersStock"][0]["stock"][0]["stockDetail"][0]}    batchNumber=${batchNumber}
    Set To Dictionary    ${stock_data_dict["dealersStock"][0]["stock"][0]["stockDetail"][0]}    quantity=${random_number}
    Set To Dictionary    ${stock_data_dict["dealersStock"][0]}    dealerInternalCode=${dealer_internal_code}

    ${stock_data_content}=    Evaluate    json.dumps($stock_data_dict, indent=4)
    Create File    ${stock_data_file}    ${stock_data_content}
    [Return]    ${random_number}

