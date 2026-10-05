@block @block_mucertify_my @tool_mucertify @MuTMS
Feature: My certifications block

  @javascript
  Scenario: Users can add My certifications block to their dashboard
    Given the following "users" exist:
      | username  | firstname | lastname | email                |
      | student1  | Student   | 1        | student1@example.com |
    And the following "tool_muprog > programs" exist:
      | fullname    | idnumber | category | sources   |
      | Program 000 | PR0      |          | mucertify |
    And the following "tool_mucertify > certifications" exist:
      | fullname          | idnumber | category | program1 |
      | Certification 001 | CT1      |          | PR0      |
      | Certification 002 | CT2      |          | PR0      |
      | Certification 003 | CT3      |          | PR0      |
    And I log in as "admin"
    And I am on the "tool_mucertify > All certifications management" page
    And I follow "Certification 001"
    And I click on "Assignment settings" "link" in the ".secondary-navigation" "css_element"
    And I click on "Update Manual assignment" "link"
    And I set the following muform fields in the "dialog[open]" "css_element":
      | enable | 1 |
    And I click on "Update" "button" in the "dialog[open]" "css_element"
    And I click on "Users" "link" in the ".secondary-navigation" "css_element"
    And I press "Assign users"
    And I set the following muform fields in the "dialog[open]" "css_element":
      | Users | Student 1 |
    And I click on "Assign users" "button" in the "dialog[open]" "css_element"
    And I log out

    And I log in as "student1"
    And I turn editing mode on

    When I add the "My certifications" block
    And I turn editing mode on
    Then I should see "Certification 001"
    And I should not see "Certification 002"
    And I should not see "Certification 003"
