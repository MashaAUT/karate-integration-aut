Feature: Retrieve booking by id

Background:
  * url bookingURL

@get-booking
Scenario: Get booking by id
  Given path 'booking', '1'
  And header Accept = 'application/json'
  And method get
  Then status 200
  Then match response ==
  """
  {
    "firstname": "#string",
    "lastname": "#string",
    "totalprice": '#number',
    "depositpaid": '#boolean',
    "bookingdates": {
        "checkin": "#string",
        "checkout": "#string"
    },
    "additionalneeds": "##string"
  }
  """

@get-booking-not-found
Scenario: Get booking by id - Not Found
  Given path 'booking', '999'  # assuming 999 is a non-existent booking id
  And header Accept = 'application/json'
  And method get
  Then status 404
  Then match response == 'Not Found'