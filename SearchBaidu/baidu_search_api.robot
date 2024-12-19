*** Settings ***

Library  RequestsLibrary

*** Variables ***
${url}  https://ug.baidu.com/mcp/pc/pcsearch
${host}  https://ug.baidu.com
${path}  /mcp/pc/pcsearch

*** Test Cases ***
Search For Keywords On Baidu
    ${headers}  Create Dictionary  Content-Type=application/json
    Create Session  mysession  ${host}
    ${data}  Create Dictionary  "invoke_info"={"pos_1":[{}],"pos_2":[{}],"pos_3":[{}]}
    ${json_data}  Evaluate  json.dumps(${data})  json
    ${resp}  POST On Session  mysession  ${path}  data=${json_data}  headers=${headers}

    Should Be Equal As Strings  ${resp.status_code}  200
    Log  ${resp.text}
    Log  ${resp.json()}

    Should Be Equal As Integers  ${0}  ${resp.json()["errno"]}
    Should Be Equal As Strings  ok  ${resp.json()["errmsg"]}