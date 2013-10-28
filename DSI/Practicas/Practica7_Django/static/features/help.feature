Feature: Rocking with lettuce and django

    Scenario: Pagina de ayuda
        Given I access the url "/help"
        Then I see the header "Help"

    Scenario: A silly paragraph
        When I look inside of help 1st paragraph_help

