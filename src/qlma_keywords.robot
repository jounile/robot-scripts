*** Settings ***

Documentation  This is a common file with variables and our test keywords.
Resource       qlma_settings.robot
Library	Selenium2Library	timeout=${DEFAULT_TIMEOUT}	implicit_wait=${DELAY}



*** Variables ***

${SERVER}        http://demo.qlma.fi:3000
${VALID USER}    jouni
${VALID PASSWD}  moikka



*** Keywords ***

Suite Set Up
	[Documentation]	Setting up the suite settings.
	Log	Starting test

Clean Up Test
	[Documentation]	Clean up resources when the case ends.
	Run Keyword And Ignore Error	Close Browser

Clean Up Suite
	[Documentation]	All browsers should be closed when the tests end.
	Run Keyword And Ignore Error	Close All Browsers






Open Login Page
	[Documentation]	All browsers should be closed when the tests end.
	Open Browser  ${SERVER}	${BROWSER}
	Maximize Browser Window
	Set Selenium Speed	${DELAY}
	Title Should Be	Qlma client
	Page Should Contain	KÄYTTÄJÄTUNNUS
	Page Should Contain	SALASANA

Login User
	[Documentation]	Logs in a user to the shop. The main page should be open.
	[Arguments]	${username}	${password}
	Input Text	css=input[type='text']	${username}
	Input Text	css=input[type='password']	${password}
	Click Element	css=input[value='KIRJAUDU']
	Log Source
	Wait Until Page Contains	Etusivu
