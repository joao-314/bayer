*** Settings ***
Library  String
Library  Collections
Library  OperatingSystem
Resource  ../config/cnpj_generator.robot

*** Variables ***
${dealer_data_file}          ../Data/payloads/dealer_data.json
${dealerMainInternalCode_data_file}          ../Data/payloads/dealerMainInternalCode_data.json
${dois_dealers_data_file}          ../Data/payloads/dois_dealers_data.json
${atualizacao_dealer_data_file}   C:/Users/EAGHP/PycharmProjects/robot-automation-implanta/Data/payloads/atualizacao_dealer_data.json
${atualizacao_dois_dealers_data_file}   C:/Users/EAGHP/PycharmProjects/robot-automation-implanta/Data/payloads/atualizacao_dois_dealers_data.json


*** Keywords ***
Modify Dealer Internal Code
    [Arguments]    ${name}    ${tradeName}
    ${dealer_data_content}=    Get File    ${dealer_data_file}
    ${dealer_data_dict}=    Evaluate    json.loads($dealer_data_content)
    ${dealer_internal_code}=    Generate Random String    length=4
    ${document_number}=    Generate CNPJ
    Set To Dictionary    ${dealer_data_dict["dealers"][0]}    name=${name}    tradeName=${tradeName}    dealerInternalCode=${dealer_internal_code}
    Set To Dictionary    ${dealer_data_dict["dealers"][0]["documents"][0]}    number=${document_number}
    ${dealer_data_content}=    Evaluate    json.dumps($dealer_data_dict, indent=4)
    Create File    ${dealer_data_file}    ${dealer_data_content}
    [Return]    ${dealer_internal_code}, ${document_number}

Modify Dealer Main Internal Code
    [Arguments]    ${name}    ${tradeName}
    ${dealer_data_content}=    Get File    ${dealerMainInternalCode_data_file}
    ${dealer_data_dict}=    Evaluate    json.loads($dealer_data_content)
    ${dealer_internal_code}=    Generate Random String    length=4
    ${document_number}=    Generate Random String    length=10
    Set To Dictionary    ${dealer_data_dict["dealers"][0]}    name=${name}    tradeName=${tradeName}    dealerInternalCode=${dealer_internal_code}
    Set To Dictionary    ${dealer_data_dict["dealers"][0]["documents"][0]}    number=${document_number}
    ${dealer_data_content}=    Evaluate    json.dumps($dealer_data_dict, indent=4)
    Create File    ${dealerMainInternalCode_data_file}    ${dealer_data_content}
    [Return]    ${dealer_internal_code}, ${document_number}

Modify Dois Dealers
    [Arguments]    ${name1}    ${name2}
    ${dealer_data_content}=    Get File    ${dois_dealers_data_file}
    ${dealer_data_dict}=    Evaluate    json.loads($dealer_data_content)
    ${dealer_internal_code1}=    Generate Random String    length=4
    ${dealer_internal_code2}=    Generate Random String    length=4
    ${document_number1}=    Generate Random String    length=10
    ${document_number2}=    Generate Random String    length=10

    Set To Dictionary    ${dealer_data_dict["dealers"][0]}    name=${name1}     dealerInternalCode=${dealer_internal_code1}
    Set To Dictionary    ${dealer_data_dict["dealers"][0]["documents"][0]}      number=${document_number1}
    Set To Dictionary    ${dealer_data_dict["dealers"][1]}    name=${name2}     dealerInternalCode=${dealer_internal_code2}
    Set To Dictionary    ${dealer_data_dict["dealers"][1]["documents"][0]}      number=${document_number2}

    ${dealer_data_content}=    Evaluate    json.dumps($dealer_data_dict, indent=4)
    Create File    ${dois_dealers_data_file}    ${dealer_data_content}
    [Return]    ${document_number1}, ${document_number2}

Modify Dois Dealers diferentes
    [Arguments]    ${name}    ${tradeName}
    ${dealer_data_content}=    Get File    ${dois_dealers_data_file}
    ${dealer_data_dict}=    Evaluate    json.loads($dealer_data_content)
    ${dealer_internal_code}=    Generate Random String    length=4
    ${document_number}=    Generate Random String    length=10
    ${contacts_description}=    Generate Random String    length=10
    ${addresses_street}=    Generate Random String    length=10
    ${addresses_number}=    Generate Random String    length=10
    ${addresses_auxiliar}=    Generate Random String    length=10
    ${addresses_postalCode}=    Generate Random String    length=10
    ${addresses_neighborhood}=    Generate Random String    length=10
    ${addresses_city}=    Generate Random String    length=10
    ${addresses_state}=    Generate Random String    length=10

    Set To Dictionary    ${dealer_data_dict["dealers"][0]}    name=${name}    tradeName=${tradeName}    dealerInternalCode=${dealer_internal_code}
    Set To Dictionary    ${dealer_data_dict["dealers"][0]["contacts"][0]}    description=${contacts_description}
    Set To Dictionary    ${dealer_data_dict["dealers"][0]["documents"][0]}    number=${document_number}
    Set To Dictionary    ${dealer_data_dict["dealers"][0]["addresses"][0]}    street=${addresses_street}    number=${addresses_number}  auxiliar=${addresses_auxiliar}  postalCode=${addresses_postalCode}  neighborhood=${addresses_neighborhood}  city=${addresses_city}  state=${addresses_state}
    ${dealer_data_content}=    Evaluate    json.dumps($dealer_data_dict, indent=4)
    Create File    ${dois_dealers_data_file}    ${dealer_data_content}
    [Return]    ${dealer_internal_code}, ${document_number}

Modify Atualizacao Dealer
    [Arguments]    ${dealer_internal_code}
    ${dealer_data_content}=    Get File    ${atualizacao_dealer_data_file}
    ${dealer_data_dict}=    Evaluate    json.loads($dealer_data_content)
    ${document_number}=    Generate Random String    length=10
    ${contacts_description}=    Generate Random String    length=10
    ${addresses_street}=    Generate Random String    length=10
    ${addresses_number}=    Generate Random String    length=10
    ${addresses_auxiliar}=    Generate Random String    length=10
    ${addresses_postalCode}=    Generate Random String    length=10
    ${addresses_neighborhood}=    Generate Random String    length=10
    ${addresses_city}=    Generate Random String    length=10
    ${addresses_state}=    Generate Random String    length=10

    Set To Dictionary    ${dealer_data_dict["dealers"][0]}      dealerInternalCode=${dealer_internal_code}
    Set To Dictionary    ${dealer_data_dict["dealers"][0]["contacts"][0]}    description=${contacts_description}
    Set To Dictionary    ${dealer_data_dict["dealers"][0]["documents"][0]}    number=${document_number}
    Set To Dictionary    ${dealer_data_dict["dealers"][0]["addresses"][0]}    street=${addresses_street}    number=${addresses_number}  auxiliar=${addresses_auxiliar}  postalCode=${addresses_postalCode}  neighborhood=${addresses_neighborhood}  city=${addresses_city}  state=${addresses_state}
    ${dealer_data_content}=    Evaluate    json.dumps($dealer_data_dict, indent=4)
    Create File    ${atualizacao_dealer_data_file}    ${dealer_data_content}
    [Return]    ${document_number}

Modify Atualizacao Dealer Com Multiplos Payloads
    ${dealer_data_content}=    Get File    ${atualizacao_dois_dealers_data_file}
    ${dealer_data_dict}=    Evaluate    json.loads($dealer_data_content)
    ${dealer_internal_code}=    Generate Random String    length=10

    ${document_number1}=    Generate Random String    length=10
    ${contacts_description1}=    Generate Random String    length=10
    ${addresses_street1}=    Generate Random String    length=10
    ${addresses_number1}=    Generate Random String    length=10
    ${addresses_auxiliar1}=    Generate Random String    length=10
    ${addresses_postalCode1}=    Generate Random String    length=10
    ${addresses_neighborhood1}=    Generate Random String    length=10
    ${addresses_city1}=    Generate Random String    length=10
    ${addresses_state1}=    Generate Random String    length=10

    ${document_number2}=    Generate Random String    length=10
    ${contacts_description2}=    Generate Random String    length=10
    ${addresses_street2}=    Generate Random String    length=10
    ${addresses_number2}=    Generate Random String    length=10
    ${addresses_auxiliar2}=    Generate Random String    length=10
    ${addresses_postalCode2}=    Generate Random String    length=10
    ${addresses_neighborhood2}=    Generate Random String    length=10
    ${addresses_city2}=    Generate Random String    length=10
    ${addresses_state2}=    Generate Random String    length=10

    Set To Dictionary    ${dealer_data_dict["dealers"][0]}      dealerInternalCode=${dealer_internal_code}
    Set To Dictionary    ${dealer_data_dict["dealers"][0]["contacts"][0]}    description=${contacts_description1}
    Set To Dictionary    ${dealer_data_dict["dealers"][0]["documents"][0]}    number=${document_number1}
    Set To Dictionary    ${dealer_data_dict["dealers"][0]["addresses"][0]}    street=${addresses_street1}    number=${addresses_number1}  auxiliar=${addresses_auxiliar1}  postalCode=${addresses_postalCode1}  neighborhood=${addresses_neighborhood1}  city=${addresses_city1}  state=${addresses_state1}

    Set To Dictionary    ${dealer_data_dict["dealers"][1]}      dealerInternalCode=${dealer_internal_code}
    Set To Dictionary    ${dealer_data_dict["dealers"][1]["contacts"][0]}    description=${contacts_description2}
    Set To Dictionary    ${dealer_data_dict["dealers"][1]["documents"][0]}    number=${document_number2}
    Set To Dictionary    ${dealer_data_dict["dealers"][1]["addresses"][0]}    street=${addresses_street2}    number=${addresses_number2}  auxiliar=${addresses_auxiliar2}  postalCode=${addresses_postalCode2}  neighborhood=${addresses_neighborhood2}  city=${addresses_city2}  state=${addresses_state2}


    ${dealer_data_content}=    Evaluate    json.dumps($dealer_data_dict, indent=4)
    Create File    ${atualizacao_dois_dealers_data_file}    ${dealer_data_content}
    [Return]    ${dealer_internal_code}, ${document_number1}, ${document_number2}

Escolha do Fluxo de Consulta
    [Arguments]     ${fluxo}
    ${payload_de_envio}=    Run Keyword If    '${fluxo}' == 'ATUALIZACAO'    Set Variable    ${atualizacao_dois_dealers_data_file}
    ...    ELSE IF    '${fluxo}' == 'CRIACAO'    Set Variable    ${dois_dealers_data_file}
    ...    ELSE    Set Variable    ${EMPTY}
    Run Keyword If    '${fluxo}' != 'ATUALIZACAO' and '${fluxo}' != 'CRIACAO'    Log    Invalid fluxo value: ${fluxo}
    [return]    ${payload_de_envio}