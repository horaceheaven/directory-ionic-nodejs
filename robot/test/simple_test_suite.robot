*** Settings ***
Library           Selenium2Library


*** Variables ***

${REMOTE_URL}
${DESIRED_CAPABILITIES}
${APPLICATION_URL}

*** Test Case ***
Check Employee list title
    Sleep    5s
    Open Browser    http://ec2-54-196-235-6.compute-1.amazonaws.com:5000/#/search    firefox
    Page Should Contain  Employees

*** Test Case ***
Validate first employee in list
    Open Browser    http://ec2-54-196-235-6.compute-1.amazonaws.com:5000/#/employees/0    firefox
    Sleep    5s
    Page Should Contain  James King
