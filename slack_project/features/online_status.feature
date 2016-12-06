@online_status
Feature: Online status
  This feature will test the online status button in all it's various states

Background: Acitivy monitor set to active (green) as standard
  Given I am logged in and I am able to type commands in the text field

Scenario Outline:
  When the activity monitor is set to <status>
  And do not disturb mode is set to <dnd>
  Then my activity status should be <status>
  And do not disturb mode should be <dnd>

  Examples: Activity monitor active
    | status | dnd |
    | active | off |
    | active | on  |

  Examples: Activity monitor away
    | status | dnd |
    | away   | on  |
    | away   | off |
