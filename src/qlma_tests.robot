*** Settings ***

Documentation  Basic tests for Qlma client.
Resource       qlma_keywords.robot
Suite Teardown	Clean Up Suite
Suite Setup	Suite Set Up




*** Test Cases ***

Login to Qlma client
    [Tags]	core
    Open Login Page
    Login User	${VALID USER}	${VALID PASSWD}
