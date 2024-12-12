*** Settings ***
Library         RequestsLibrary
Library         OperatingSystem
Resource       ../config/config.robot
Resource        StockAPIKeywords.robot
Resource        ../steps/dealer/StockAPIKeywords.robot


*** Test Cases ***
[E2E] - Criacao e consulta de um novo Stock
    [Tags]    dealer    criacao    sanity1
    FOR    ${ambiente}    IN
    ...    QA
#    ...    STAGE
    Set Environment Variables    ${ambiente}
    Given que tenho acesso ao servico de Stock
    And que tenha cadastrado um dealer valido
    When realizo a criacao do stock com todos os dados validos
    Then o codigo de status da resposta deve ser 200
    And valido na api de output de stock o registro
    And valido na api de request-tracking de stock o registro
    END

#Teste API do Concessionário Retorna Código de Status 403
#    Given que uma sessão para a API do concessionário é criada
#    When uma solicitação POST é enviada para a API do concessionário com dados válidos e sem remetente
#    And o corpo da resposta deve conter "Token de Autenticação Ausente"
#    Then o código de status da resposta deve ser 403
#
#Teste de Consulta no Banco de Dados
#    When uma consulta é executada no banco de dados    Cenário1
#    Then o resultado da consulta deve conter    resultado_esperado


