*** Settings ***
Library    RequestsLibrary

*** Variables ***


*** Keywords ***


*** Test Cases ***
Case 01: GET
    Create Session    alias=getGithub    url=urhttps://github.com/welli7ngtonl
    ${response}=    GET On Session    alias=getGithub    url=https://github.com/welli7ngton
    # Log    ${response.json()}
    Log    ${response.status_code}
    Log    ${response.headers}
    Log    ${response.elapsed}
    Log    ${response.reason}
    Log    ${response.text}
    Log    ${response.url}
