Feature: Rocking with lettuce and django

    Scenario: Simple Hola
        Given I access the url "/hola"
        Then I see the header "Hola"
