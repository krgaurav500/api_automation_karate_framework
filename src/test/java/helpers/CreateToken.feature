
Feature: Create Token
    
    Scenario: Create Token
        Given url apiUrl
        Given path 'customer/login'
        And request { "Email": "gaurav@lumiere32.sg", "password": "1234567a" }
        When method Post
        Then status 201
        * def authToken = responseHeaders['AuthToken']