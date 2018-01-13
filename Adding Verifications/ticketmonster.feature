Feature: Purchase a ticket on TicketMonster
  Scenario: Define Aliases
    Given I set the alias mappings
      | Venue Selection | #venueSelector |
      | Section Selection | #sectionSelect |
      | Adult Count | #ticket-category-fieldset-5 > div > div > input |
      | Email Address | #email |
      | Adult Ticket Price | #ticket-category-fieldset-5 > div > div > span |
      | Child Ticket Price | #ticket-category-fieldset-12 > div > div > span |

  Scenario: Open the application
    Given I open the page "http://ticket-monster.herokuapp.com"
    And I wait "30" seconds for the element found by "logo" to be displayed
    Then I verify that the browser title should be "Ticket Monster"

  Scenario: Open Events Page
    And I click the link with the text content of "Events"
    And I click the link with the text content of "Concert"
    And I click the link with the text content of "Rock concert of the decade"

  Scenario: Order Tickets
    And I select "Sydney : Sydney Opera House" from the drop down list found by "Venue Selection"
    And I click the element found by "Order tickets"

  Scenario: Checkout
    And I select "S1 - Front left" from the drop down list found by "Section Selection"
    And I verify that the page contains the text "Please enter a valid e-mail address"
    And I save the text content of the element found by "Adult Ticket Price" to the alias "Adult Ticket Value"
    And I verify that the alias "Adult Ticket Value" matches the regex "@ \$\d{3}\.\d{2}"
    And I save the text content of the element found by "Child Ticket Price" to the alias "Child Ticket Value"
    And I dump the alias map to the console
    And I verify that the alias "Child Ticket Value" matches the regex "@ \$\d{3}\.\d{1,2}"
    And I populate the element found by "Adult Count" with "2"
    And I click the element found by "Add tickets"
    And I populate the element found by "Email Address" with "a@a.com"
    And I click the element found by "Checkout"
