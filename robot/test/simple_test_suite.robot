*** Settings ***
Library           Selenium2Library

*** Test Case ***
Add todo
    Open Browser    http://localhost:5000/#/search    phantomjs
    Page Should Contain  Employees
