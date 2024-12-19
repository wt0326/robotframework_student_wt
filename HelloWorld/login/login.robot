*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}  https://www.baidu.com/
${BAIDU_BTN}  //*[@id="su"]
${SEARCH_KW}  baidu
${SEARCH_BAR}  //*[@id="kw"]

*** Test Cases ***
Search For Keywords On Baidu
    Enter Baidu Homepage
    Baidu Search  ${SEARCH_KW}
    Sleep  5
    Go Back
    Sleep  5
    Close Browser

*** Keywords ***
Enter Baidu Homepage
    log  ${URL}
    Open Browser  ${URL}  edge
    ${URL_VALUE}=  Get Location
    Should Be Equal  ${URL_VALUE}  ${URL}

Baidu Search
    [Arguments]  ${SEARCH_TEXT}
    Input Text  ${SEARCH_BAR}  ${SEARCH_TEXT}
    Click Button  ${BAIDU_BTN}
    ${BAR_VALUE}  Get Value  ${SEARCH_BAR}
    Should Be Equal  ${BAR_VALUE}  ${SEARCH_TEXT}






