Feature: Retrieve booking by id

Background:
  * url bookingURL
  * def expectedResponse = read('classpath:expected-response.json')

@get-booking
Scenario: Get booking by id
  Given path 'booking', '1'
  And header Accept = 'application/json'
  And method get
  Then status 200
  Then match response == expectedResponse

@get-booking-not-found
Scenario: Get booking by id - Not Found
  Given path 'booking', '999'  # assuming 999 is a non-existent booking id
  And header Accept = 'application/json'
  And method get
  Then status 404
  Then match response == 'Not Found'