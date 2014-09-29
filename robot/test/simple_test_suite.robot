*** Settings ***
Library           Selenium2Library
Library           SauceLabs
Suite Setup		Open Test Browser
Suite Teardown     Close All Browsers

*** Variables ***
${BROWSER}  firefox
${APP_URL}
${APP_PORT}
${REMOTE_URL}
${DESIRED_CAPABILITIES}

*** Test Cases ***
Check Employee list title
    Go To    ${APP_URL}:${APP_PORT}/#/search
    Sleep    5s
    Page Should Contain  Employees

Validate first employee in list
    Go To    ${APP_URL}:${APP_PORT}/#/employees/0
    Sleep    5s
    Page Should Contain  James King

*** Keywords ***
Open Test Browser
    Open browser  ${APP_URL}:${APP_PORT}    ${BROWSER}
    ...  remote_url=${REMOTE_URL}
    ...  desired_capabilities=${DESIRED_CAPABILITIES}
    Maximize Browser Window
