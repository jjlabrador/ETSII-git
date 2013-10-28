Feature: Rocking with lettuce and django

    Scenario: Pagina de contacto
        Given I access to the url of contact "/contact"
        Then I see the header of contact "Contact"

    Scenario: A silly paragraph of contact
        When I look inside of contact 1st paragraph_contact

