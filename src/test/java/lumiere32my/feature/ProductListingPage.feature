Feature: Test Api of Product Listing Page

Background: Define URL
    Given url apiUrl

Scenario: Products are displayed in Product Details Page
    Given path 'web/getProductDetailById/259'
    When method Get
    Then status 200
    And match response = 