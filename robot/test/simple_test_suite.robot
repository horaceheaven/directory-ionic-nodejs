*** Settings ***
Library           Selenium2Library

*** Test Case ***
Add todo
    Sleep 20s
    Open Browser    http://localhost:5000/#/search    phantomjs
    Page Should Contain  Employees
