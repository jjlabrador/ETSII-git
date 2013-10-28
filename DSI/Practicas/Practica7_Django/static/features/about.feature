Feature: Rocking with lettuce and django

    Scenario: Pagina de informacion
        Given I access the url "/about"
        Then I see the header "About"

    Scenario: A silly paragraph
        When I look inside the paragraph_about
