*** Settings ***
Documentation  test if int == string  #测试概要：测试套件的例子（测试套件下有多个测试用例）

*** Test Cases ***
Test Case 1
    [Documentation]  test if (1+1)(int) == 2(int)  #概要
    Log  Hello, world!  #打印日志（相当于python的print）：Hello，world
    Should Be Equal  ${1+1}  ${2}  #应该相等

Test Case 2
    [Documentation]  test if (1+1)(int) == 2(string)  #概要
    Log  Hello, world!  #打印日志（相当于python的print）：Hello，world
    should not be equal  ${1+1}  2  #应该相等