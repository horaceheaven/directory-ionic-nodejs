*** Settings ***
Library           Selenium2Library

*** Test Case ***
Add todo
    Sleep    20s
    Open Browser    http://localhost:5000/#/search    firefox
    Page Should Contain  Employees

*** Test Case ***
Check If Employee Exists
    Open Browser    http://localhost:5000/#/employees/0  firefox
    Sleep    20s
    Page Should Contain  James King
