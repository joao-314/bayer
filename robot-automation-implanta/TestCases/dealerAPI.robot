*** Settings ***
Library         RequestsLibrary
Library         OperatingSystem
Resource       ../config/config.robot
Resource        ../steps/dealer/DealerAPIKeywords.robot


*** Test Cases ***
[E2E] - Criacao e consulta de um novo Dealer
    [Tags]    dealer    criacao    sanity
    FOR    ${ambiente}    IN
    ...    QA
    ...    STAGE
    Set Environment Variables    ${ambiente}
    Given que tenho acesso ao servico de Dealer
    When realizo a criacao do dealer com todos os dados validos
    Then o codigo de status da resposta deve ser 200
    And valido na api de request-tracking de dealer o registro
    END

Criacao de Dealer, inserindo dados com multiplos exemplos
    [Tags]    dealer    criacao    critical
    FOR    ${ambiente}    IN
    ...    QA
    ...    STAGE
    Given que tenho acesso ao servico de Dealer
    When realizo a criacao do dealer com todos os dados validos
    Then o codigo de status da resposta deve ser 200
#    And valido na api de output de dealer o registro
    And valido na api de request-tracking de dealer o registro
    END


Criacao de Dealer, inserindo um novo dealerInternalCode com um dealerMainInternalCode já existente
    [Tags]    dealer    criacao    critical
    Given que tenho acesso ao servico de Dealer
    When realizo a criacao do dealer, inserindo um dealerMainInternalCode valido
    Then o codigo de status da resposta deve ser 200
    And valido na api de output de dealer o registro com o dealerMainInternalCode cadastrado

Criacao de dois novos Dealers, inserindo o internalCode diferente com um countryCode igual, em um mesmo payload
    [Tags]    dealer    criacao    critical
    Given que tenho acesso ao servico de Dealer
    When realizo a criacao de dois novos dealers com o internalCode diferente com um countryCode igual
    Then o codigo de status da resposta deve ser 200
    And valido na api de output de dealer o primeiro registro enviado
    And valido na api de output de dealer o segundo registro enviado    CRIACAO

Criacao e atualizacao, criando o primeiro dealer e atualizando o segundo dealer
    [Tags]    dealer    criacao    critical
    Given que tenho acesso ao servico de Dealer
    When realizo a criacao de dois novos dealers com o internalCode diferente com um countryCode igual
    Then o codigo de status da resposta deve ser 200
    And valido na api de output de dealer o primeiro registro enviado
    And valido na api de output de dealer o segundo registro enviado    CRIACAO

Atualizacao de dados do Dealer, mantendo apenas os campos dealerInternalCode e countryCode iguais, em payloads diferentes
    [Tags]    dealer    atualizacao    critical
    Given que tenho acesso ao servico de Dealer
    When realizo a atualizacao dos dados do Dealer, mantendo apenas os campos dealerInternalCode e countryCode iguais em payloads diferentes
    Then o codigo de status da resposta deve ser 200
    And valido na api de output a atualizacao dos dados do Dealer

#Negativos
Validar a tentativa do cadastro de um novo Dealer, inserindo todos os <campos obrigatórios do Dealer> invalidos.
    [Tags]    dealer    negativo    critical
    Given que tenho acesso ao servico de Dealer
    When realizo a tentativa do cadastro de um novo Dealer
    Then o codigo de status da resposta deve ser 400
    And validao a apresentacao da mensagem de erro

Validar a tentativa de cadastro de um novo Dealer, enviando os campos de <endereço> com formato invalido.
    [Tags]    dealer    negativo    critical
    Given que tenho acesso ao servico de Dealer
    When realizo a tentativa do cadastro de um novo Dealer
    Then o codigo de status da resposta deve ser 400
    And validao a apresentacao da mensagem de erro

Validar a tentativa de cadastro de um novo Dealer, enviando os campos de <dealer> com formato inválido.
    [Tags]    dealer    negativo    critical
    Given que tenho acesso ao servico de Dealer
    When realizo a tentativa do cadastro de um novo Dealer
    Then o codigo de status da resposta deve ser 400
    And validao a apresentacao da mensagem de erro

Validar a tentativa de cadastro de um novo Dealer, informando um {senderId} incorretamente
    [Tags]    dealer    negativo    critical
    Given que tenho acesso ao servico de Dealer
    When realizo a tentativa do cadastro, informando um senderId
    Then o codigo de status da resposta deve ser 400
    And validao a apresentacao da mensagem de erro

Validar a tentativa de cadastro de um novo Dealer, quando não tenho acesso ao serviço
    [Tags]    dealer    negativo    critical
    Given que tenho acesso ao servico de Dealer
    When realizo a tentativa do cadastro, quando não tenho acesso ao serviço
    Then o codigo de status da resposta deve ser 403
    And validao a apresentacao da mensagem de erro

Validar a tentativa de cadastro de um novo Dealer, enviando dois Dealers Duplicados em payloads diferentes
    [Tags]    dealer    negativo    critical
    Given que tenho acesso ao servico de Dealer
    When realizo a tentativa do cadastro, enviando dois Dealers Duplicados em payloads diferentes
    Then o codigo de status da resposta deve ser 200
    And validao a apresentacao da mensagem de erro no BD

Validar a tentativa de cadastro de um novo Dealer, enviando dois Dealers Duplicados em um mesmo payload
    [Tags]    dealer    negativo    critical
    Given que tenho acesso ao servico de Dealer
    When realizo a tentativa do cadastro, enviando dois Dealers Duplicados em payloads diferentes
    Then o codigo de status da resposta deve ser 200
    And validao a apresentacao da mensagem de erro no BD