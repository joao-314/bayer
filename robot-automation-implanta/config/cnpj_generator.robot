*** Settings ***
Library  String
Library  Collections
Library  BuiltIn
Library  Random

*** Keywords ***
Generate CNPJ
    [Documentation]  Gera um CNPJ válido com 14 dígitos.
    ${base_cnpj}=    Generate Random Base CNPJ
    ${first_digit}=    Calculate Check Digit    ${base_cnpj}    5    4    3    2    9    8    7    6    5    4    3    2
    ${second_digit}=    Calculate Check Digit    ${base_cnpj}${first_digit}    6    5    4    3    2    9    8    7    6    5    4    3    2
    ${full_cnpj}=    Set Variable    ${base_cnpj}${first_digit}${second_digit}
    [Return]    ${full_cnpj}

Generate Random Base CNPJ
    [Documentation]  Gera os 12 primeiros dígitos aleatórios do CNPJ.
    ${base_cnpj}=    Evaluate    ''.join([str(random.randint(0, 9)) for _ in range(12)])    modules=random
    [Return]    ${base_cnpj}

Calculate Check Digit
    [Documentation]  Calcula um dígito verificador do CNPJ baseado em pesos.
    [Arguments]    ${cnpj}    @{weights}
    ${sum}=    Set Variable    0
    ${cnpj_length}=    Get Length    ${cnpj}
    FOR    ${i}    IN RANGE    ${cnpj_length}
        ${digit}=    Evaluate    int(${cnpj}[${i}])
        ${weight}=    Get From List    ${weights}    ${i}
        ${partial_sum}=    Evaluate    ${digit} * ${weight}
        ${sum}=    Evaluate    ${sum} + ${partial_sum}
    END
    ${remainder}=    Evaluate    ${sum} % 11
    ${check_digit}=    Evaluate    0 if ${remainder} < 2 else 11 - ${remainder}
    [Return]    ${check_digit}
