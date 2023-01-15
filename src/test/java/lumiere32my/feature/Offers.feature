Feature: Test for the Offers Page Api

Background: Define URL
     Given url apiUrl


 Scenario: All Promotional Offers
   * def timeValidator = read('classpath:helpers/timeValidator.js')
   * def dataGenerator = Java.type('helpers.DataGenerator')
   

   Given path 'getSubscriptionPromotion'
   Given param countryId = 1
   When method Get
   Then status 200
   And match response.success == true
   And match response.message == "subscriptionPromotion get successfully."
   
   
     
Scenario: All Promotional Categories
    * def timeValidator = read('classpath:helpers/timeValidator.js')
    * def dataGenerator = Java.type('helpers.DataGenerator')
    
 
    Given path 'getSubscriptionPromotionCategory'
    Given param countryId = 1
    When method Get
    Then status 200
    And match response.success == true
    And match response.message == "subscriptionPromotion category get successfully."
    
