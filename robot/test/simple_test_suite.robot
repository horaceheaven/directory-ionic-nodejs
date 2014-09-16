*** Settings ***
Library           Selenium2Library
Library           SauceLabs


*** Variables ***
${BROWSER}  firefox
${REMOTE_URL}
${DESIRED_CAPABILITIES}

*** Test Case ***
Check Employee list title
    Open Browser    http://ec2-54-196-235-6.compute-1.amazonaws.com:5000/#/search    ${BROWSER}
    ...  remote_url=${REMOTE_URL}
    ...  desired_capabilities=${DESIRED_CAPABILITIES}
    Sleep    5s
    Page Should Contain  Employees

*** Test Case ***
Validate first employee in list
    Open Browser    http://ec2-54-196-235-6.compute-1.amazonaws.com:5000/#/employees/0    ${BROWSER}
    ...  remote_url=${REMOTE_URL}
    ...  desired_capabilities=${DESIRED_CAPABILITIES}
    Sleep    5s
    Page Should Contain  James King

Open test browser
    Open browser  about:  ${BROWSER}
...  remote_url=${REMOTE_URL}
...  desired_capabilities=${DESIRED_CAPABILITIES}

Close test browser
    Run keyword if  '${REMOTE_URL}' != ''
    ...  ${SUITE_NAME} | ${TEST_NAME}
    ...  ${SUITE_STATUS}  ${TEST_TAGS}  ${REMOTE_URL}
    Close all browsers
