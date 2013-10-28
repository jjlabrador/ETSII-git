Feature: Rocking with lettuce and django - Sign up

    Scenario: Pagina de signup
	Given I access to the url "/signup"
	Then I see the header "Sign up"

    Scenario: Un parrafo sencillo
	When I look inside the 1st paragraph

