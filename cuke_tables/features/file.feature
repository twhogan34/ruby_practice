Feature:

Scenario: Data table
  Given these users:
    | username | password |
    | bob      | foo      |
    | joe      | password |
    | another  | p4ss55wd |

Scenario Outline: Bank Withdrawals
  Given I have <balance> in my account
  And I withdraw <withdrawal>
  Then I should have <remaining> left in my account
    Examples:
      | balance | withdrawal | remaining |
      | 100     | 50         | 50        |
      | 250     | 34         | 216       |
      | 20      | 20         | 0         |

Scenario: Doc Strings
  When I choose to show my list
  Then the following should be returned:
    """
      You have three items in your list
      - One
      - Two
      - Three
    """