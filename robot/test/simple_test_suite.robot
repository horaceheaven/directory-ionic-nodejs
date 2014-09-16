*** Settings ***
Library           Selenium2Library
Library           SauceLabs


*** Variables ***
${BROWSER}  firefox
${REMOTE_URL}
${DESIRED_CAPABILITIES}

*** Test Case ***
Open test browser
    Open browser  http://ec2-54-196-235-6.compute-1.amazonaws.com:5000    ${BROWSER}
    ...  remote_url=${REMOTE_URL}
    ...  desired_capabilities=${DESIRED_CAPABILITIES}
    Maximize Browser Window
    Check Employee list title

*** Test Case ***
Check Employee list title
    Go To    http://ec2-54-196-235-6.compute-1.amazonaws.com:5000/#/search    ${BROWSER}
    Sleep    5s
    Page Should Contain  Employees

*** Test Case ***
Validate first employee in list
    Go To    http://ec2-54-196-235-6.compute-1.amazonaws.com:5000/#/employees/0    ${BROWSER}
    Sleep    5s
    Page Should Contain  James King

Close test browser
    Run keyword if  '${REMOTE_URL}' != ''
    ...  ${SUITE_NAME} | ${TEST_NAME}
    ...  ${SUITE_STATUS}  ${TEST_TAGS}  ${REMOTE_URL}
    Close all browsers
