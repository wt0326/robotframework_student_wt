*** Settings ***

Library           RequestsLibrary

*** Variables ***
${host}  https://graph.baidu.com
${path}  /upload

*** Test Cases ***
Upload File using multipart/form-data
    Create Session  mysession  ${host}
    #${headers}=  Create Dictionary    Content-Type=multipart/form-data
    #${files}=  Create Dictionary  image=D:\\PycharmProjects\\UpLoad\\test.jpg
    ${open_files}  Evaluate  open(r"D://PycharmProjects//UpLoad//test.jpg","rb")
    ${files}  Create Dictionary  image=${open_files}
    ${data}  Create Dictionary  tn=pc  from=pc  image_source=PC_UPLOAD_SEARCH_FILE  range={"page_from": "searchIndex"}  sdkParams={"data":"28fcbe1ddfdd50a418aaf6db6db9a69fe257f4b9172c7fa6660146df957e69ea8d03cac7f553d7d25263ee0b599be553293d109ed227b131d5caec144de240b78abb24796a49ff4752cc3b89edc1215f","key_id":"23","sign":"2f4cf5e0"}
    #${resp}=  POST On Session  mysession  ${path}  files=${files}  data=${data}  headers=${headers}
    ${resp}  POST On Session  mysession  ${path}  files=${files}  data=${data}
    Should Be Equal As Strings  ${resp.status_code}  200

    Log  ${resp.json()}
    Should Be Equal As Strings  ${resp.json()["status"]}  0
    Should Be Equal As Strings  ${resp.json()["msg"]}  Success
    Log  ${resp.json()["data"]["url"]}
    Should Contain  ${resp.json()["data"]["url"]}  https://graph.baidu.com

