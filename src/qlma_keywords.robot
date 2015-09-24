*** Settings ***

Documentation  This is a common file with variables and our test keywords.
Resource       qlma_settings.robot
Library	Selenium2Library	timeout=${DEFAULT_TIMEOUT}	implicit_wait=${DELAY}



*** Variables ***

${SERVER}        http://www.qlma.fi/client
${VALID USER}    Matti Meikäläinen
${VALID PASSWD}  qlma



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
       Wait Until Page Contains	Kirjautuminen
       Title Should Be	Kirjautuminen - QLMA Koulu
       Page Should Contain	KÄYTTÄJÄTUNNUS
       Page Should Contain	SALASANA
       Page Should Contain	UNOHTUIKO SALASANA?

Login User
	[Documentation]	Logs in a user to the shop. The main page should be open.
	[Arguments]	${username}	${password}
	Input Text	css=input[type='text']	${username}
	Input Text	css=input[type='password']	${password}
	Click Element	css=input[value='KIRJAUDU']
	Log Source
	Wait Until Page Contains	Etusivu

Go to Messages
       [Documentation]	Logs in a user to the shop. The main page should be open.
       Click Element	xpath=id('sidebar-wrapper')/ul/li[2]/a
       Wait Until Page Contains	Viestit


