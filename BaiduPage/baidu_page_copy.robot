*** Settings ***

Library  RequestsLibrary

*** Variables ***
${host}  https://www.baidu.com
${path}  /sugrec?&prod=pc_his&from=pc_web&json=1&sid=60277_61027_60853_61358_61373_61390_61392_61429_61464&hisdata=%5B%7B%22time%22%3A1733973298%2C%22kw%22%3A%221733970025%E6%97%B6%E9%97%B4%E6%88%B3%E6%80%8E%E4%B9%88%E7%AE%97%E7%9A%84%22%7D%2C%7B%22time%22%3A1733973622%2C%22kw%22%3A%22postman%E6%80%8E%E4%B9%88%E8%8E%B7%E5%8F%96%E5%BD%93%E5%89%8D%E6%97%B6%E9%97%B4%E6%88%B3%22%7D%2C%7B%22time%22%3A1733976881%2C%22kw%22%3A%22postman%E4%BF%9D%E5%AD%98token%22%7D%2C%7B%22time%22%3A1733998766%2C%22kw%22%3A%22%E5%9B%BE%E7%89%87%E5%A3%81%E7%BA%B8%22%2C%22fq%22%3A2%7D%2C%7B%22time%22%3A1734059384%2C%22kw%22%3A%22%E7%99%BE%E5%BA%A6%E6%90%9C%E7%B4%A2api%E6%8E%A5%E5%8F%A3%E6%80%8E%E4%B9%88%E8%B0%83%E7%94%A8%22%2C%22fq%22%3A2%7D%2C%7B%22time%22%3A1734059420%2C%22kw%22%3A%22%E7%99%BE%E5%BA%A6%E6%90%9C%E7%B4%A2api%E6%8E%A5%E5%8F%A3%E8%AF%B7%E6%B1%82%E6%96%B9%E6%B3%95%E6%98%AF%E4%BB%80%E4%B9%88%22%2C%22fq%22%3A2%7D%2C%7B%22time%22%3A1734059550%2C%22kw%22%3A%22%E4%BD%BF%E7%94%A8%E7%99%BE%E5%BA%A6%E8%BF%9B%E8%A1%8C%E6%90%9C%E7%B4%A2api%E6%8E%A5%E5%8F%A3%E8%AF%B7%E6%B1%82%E6%96%B9%E6%B3%95%E6%98%AF%E4%BB%80%E4%B9%88%22%2C%22fq%22%3A2%7D%2C%7B%22time%22%3A1734090849%2C%22kw%22%3A%22%E7%99%BE%E5%BA%A6%22%2C%22fq%22%3A8%7D%2C%7B%22time%22%3A1734511587%2C%22kw%22%3A%22%E7%99%BE%E5%BA%A6%E4%B8%80%E4%B8%8B%22%2C%22fq%22%3A2%7D%2C%7B%22time%22%3A1734511834%2C%22kw%22%3A%22%E7%99%BE%E5%BA%A6%E4%B8%80%E4%B8%8B%20%E4%BD%A0%E5%B0%B1%E7%9F%A5%E9%81%93%22%2C%22fq%22%3A2%7D%5D&_t=1734511863552&req=2&csor=0
*** Test Cases ***
Get Baidu Page
    Create Session  mysession  ${host}
    ${resp}  GET On Session  mysession  ${path}
    Log  ${resp.status_code}
    Should Be Equal As Strings  ${resp.status_code}  200

    Log  ${resp.text}
    Should Contain  ${resp.text}  his_normal
    Log  ${resp.json()}
    Should Be Equal As Strings  ${resp.json()["csor"]}  0
    Should Be Empty  ${resp.json()["errmsg"]}  #返回的json字典的errmsg的值为空


