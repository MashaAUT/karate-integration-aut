@debug
Feature: JSON Schema Validation

Background:
  * def currentDate = karate.getCurrentDate()
  * print 'Current Date:', currentDate
  * def config = karate.call('karate-config.js')

Scenario: Get user and Verify JSON Fields
  * url config.baseURL + 'users/2'
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

Scenario: Schema Verify
  * url config.baseURL + 'users/1'
  * def responseData =
    """
    {
      "id" : "#number",
      "name" : "#string"
    }
    """
  * def jsonData =
    """
    {
      "id" : 1,
      "name" : "Pramod"
    }
    """
  * match jsonData == responseData

Scenario: Validate with the Third Party
  * url config.baseURL + 'users/1'
  When method GET
  Then match response == '#object'
  * string jsonSchemaExpected = read('file:src/test/java/scrolltest/dataSchema.json')
  * string jsonData = response
  * def SchemaUtils = Java.type('scrolltest.JSONSchemaUtil')
  * assert SchemaUtils.isValid(jsonData, jsonSchemaExpected)