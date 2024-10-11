Feature: Create new booking

  Background:
    * url bookingURL
    # import RandomUtil class
    * def RandomUtil = Java.type('src/test/java/examples/data/booking-data.json')
    * def firstName = RandomUtil.firstName()
    * def lastName = RandomUtil.lastName()
    * def bool = RandomUtil.bool()
    * def string = RandomUtil.string()
    * def number = RandomUtil.number()
    * def date = RandomUtil.date()

  @create-booking
  Scenario:  Create new booking
    Given path 'booking'
    And header Accept = 'application/json'
    And header Content-Type = 'application/json'
    And request
    """
    {
        "firstname" : "#(firstName)",
        "lastname" : "#(lastName)",
        "totalprice" : #(number),
        "depositpaid" : #(bool),
        "bookingdates" : {
            "checkin" : "#(date)",
            "checkout" : "#(date)"
        },
        "additionalneeds" : "#(string)"
    }
    """
    When method post
    Then match response.booking ==
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
      "additionalneeds": "#string"
    }
    """
    * def bookingId = response.bookingid