*** Settings ***
Library           Selenium2Library
Library           SauceLabs
Suite Setup		Open Test Browser
Suite Teardown     Close All Browsers

*** Variables ***
${BROWSER}  firefox
${REMOTE_URL}
${DESIRED_CAPABILITIES}

*** Test Cases ***
Check Employee list title
    Go To    http://ec2-54-196-235-6.compute-1.amazonaws.com:5000/#/search
    Sleep    5s
    Page Should Contain  Employees

Validate first employee in list
    Go To    http://ec2-54-196-235-6.compute-1.amazonaws.com:5000/#/employees/0
    Sleep    5s
    Page Should Contain  James King

*** Keywords ***
Open Test Browser
    Open browser  http://ec2-54-196-235-6.compute-1.amazonaws.com:5000    ${BROWSER}
    ...  remote_url=${REMOTE_URL}
    ...  desired_capabilities=${DESIRED_CAPABILITIES}
    Maximize Browser Window
