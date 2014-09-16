*** Settings ***
Library           Selenium2Library
Library           SauceLabs


*** Variables ***
${BROWSER}  firefox
${REMOTE_URL}
${DESIRED_CAPABILITIES}

Suite Setup		Open test browser
Suite Teardown     Close test browser

*** Test Case ***
Check Employee list title
    Go To    http://ec2-54-196-235-6.compute-1.amazonaws.com:5000/#/search
    Sleep    5s
    Page Should Contain  Employees

Validate first employee in list
    Go To    http://ec2-54-196-235-6.compute-1.amazonaws.com:5000/#/employees/0
    Sleep    5s
    Page Should Contain  James King

*** Keywords ***
Open test browser
    Open browser  http://ec2-54-196-235-6.compute-1.amazonaws.com:5000    ${BROWSER}
    ...  remote_url=${REMOTE_URL}
    ...  desired_capabilities=${DESIRED_CAPABILITIES}
    Maximize Browser Window

Close test browser
    Run keyword if  '${REMOTE_URL}' != ''
    ...  ${SUITE_NAME} | ${TEST_NAME}
    ...  ${SUITE_STATUS}  ${TEST_TAGS}  ${REMOTE_URL}
    Close all browsers
