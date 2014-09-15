*** Settings ***
Library           Selenium2Library
Library           SauceLabs


*** Variables ***

${REMOTE_URL}
${DESIRED_CAPABILITIES}
${APPLICATION_URL}

*** Test Case ***
Check Employee list title
    Open Browser    http://ec2-54-196-235-6.compute-1.amazonaws.com:5000/#/search    firefox
    ...  remote_url=http://lwhiteley:e33ae43c-1d3c-4e0b-ac8d-604f88df4bd1@ondemand.saucelabs.com:80/wd/hub
    ...  desired_capabilities="build:1,platform:Windows 8.1,browserName:internet explorer,version:11"
    Sleep    5s
    Page Should Contain  Employees

*** Test Case ***
Validate first employee in list
    Open Browser    http://ec2-54-196-235-6.compute-1.amazonaws.com:5000/#/employees/0    firefox
    ...  remote_url=http://lwhiteley:e33ae43c-1d3c-4e0b-ac8d-604f88df4bd1@ondemand.saucelabs.com:80/wd/hub
    ...  desired_capabilities="build:build:$BUILD_NUMBER,platform:Windows 8.1,browserName:internet explorer,version:11"
    Sleep    5s
    Page Should Contain  James King
