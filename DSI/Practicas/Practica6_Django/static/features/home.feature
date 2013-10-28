Feature: Rocking with lettuce and django

    Scenario: Pagina inicial
        Given I access the url "/home"
        Then I see the header "Home"

    Scenario: A silly paragraph
        When I look inside de 1st paragraph

