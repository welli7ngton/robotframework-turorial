*** Settings ***
Library    SeleniumLibrary    timeout=00:00:02    implicit_wait=00:00:20    run_on_failure=Nothing 
Library    String

*** Variables ***
${song_name}          Stressed Out
${URL}                https://www.youtube.com/
${browser}            chrome
${input_search}       //input[@id="search" and @name="search_query" and @aria-label="Search"]
${button_search}      //button[@id="search-icon-legacy" and @class="style-scope ytd-searchbox"]
${video_title}        (//yt-formatted-string[@class="style-scope ytd-video-renderer"])[1]
${subscribe}          //button[@class="yt-spec-button-shape-next yt-spec-button-shape-next--filled yt-spec-button-shape-next--mono yt-spec-button-shape-next--size-m"]
${video_duration}     //span[@class="ytp-time-duration"]
${ad}                 //div[@class="ytp-preview-ad__text"]

*** Keywords ***
Given that i access the youtube site
    Open Browser    ${URL}    ${browser}
    Log    "OIOIOI"
When i type the song name
    Input Text    ${input_search}    ${song_name}

And i click search button
    Click Button    ${button_search}
    Click Element    ${video_title}

And the video is executed
    Element Should Be Visible    ${subscribe}
    Log    ${video_duration}
    Sleep    360

*** Test Cases ***
Cenario 1: Abrindo Video do Youtube
    Given that i access the youtube site
    When i type the song name
    And i click search button
    And the video is executed
