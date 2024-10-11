@debug
Feature: Repeat Scenario with Different Dates

Background:
  * def dates = ['2022-01-01', '2022-01-15', '2022-02-01']

Scenario: Repeat with Different Dates
  * repeat dates:
    * def currentDate = _
    * print 'Current Date:', currentDate
    Given url 'https://reqres.in/api/users/2'
    When method GET
    Then match response == '#object'
    * def jsonSchemaExpected =
      """
      {
        "data": {
          "id": '#number',
          "email": "#string",
          "first_name": "#string",
          "last_name": "#string",
          "avatar": "#string"
        },
        "support": {
          "url": "#string",
          "text": "#string"
        }
      }
      """
    * match response == jsonSchemaExpected