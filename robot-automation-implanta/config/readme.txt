Comandos interessantes:

= Para rodar um test case, especificando o arquivo de report
robot -t "Atualizacao de dados do Dealer, mantendo apenas os campos dealerInternalCode e countryCode iguais, no mesmo payload" -d C:\Users\EAGHP\PycharmProjects\robot-automation-implanta\Reports dealerAPI.robot

= Execução por tag
robot -i sanity1 -d C:\Users\EAGHP\PycharmProjects\robot-automation-implanta\Reports dealerAPI.robot


#Exemplo da execução do open.sh(DB conection)
And test Connection
    ${script_directory}=    Set Variable    C:\\Users\\EAGHP\\.ssh
    ${script_path}=    Join Path    ${script_directory}    open.sh
    ${git_bash_path}=    Set Variable    C:\\Users\\EAGHP\\AppData\\Roaming\\Microsoft\\Windows\\Start Menu\\Programs\\Git\\Git Bash.exe
    ${command}=    Set Variable    ${git_bash_path} -c "${script_path}"
    ${result}=    Run Process  ${command}  shell=True
    ${output}=    Set Variable    ${result.stdout}
    Log    ${output}    # Log the output to see what it contains
    Should Contain    ${output}    token
    ${token}=    Evaluate    re.search(r'token\\s+([a-zA-Z0-9_-]+)', ${output}).group(1)
    Set Variable    ${DB_PASSWORD}    ${token}
    Sleep  10
    ${command}=    Set Variable    ${git_bash_path} -c "${script_path}"
    Run Process  ${command}  shell=True