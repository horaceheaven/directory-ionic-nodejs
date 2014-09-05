*** Settings ***
Library           Selenium2Library

*** Test Case ***
Add todo
    Sleep    20s
    Open Browser    http://localhost:5000/#/search    phantomjs
    Page Should Contain  Employees

*** Test Case ***
Check If Employee Exists
    Open Browser    http://localhost:5000/#/employees/0  phantomjs
    Sleep    20s
    Page Should Contain  James King
