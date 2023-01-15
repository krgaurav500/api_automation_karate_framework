Feature: Test for the Cart Api

Background: Define URL
    Given url apiUrl
    # Given url 'https://www.lumiere32.my/testapi/v1/'
    # Given path 'customer/login'
    # And request { "Email": "gaurav+2@lumiere32.sg", "password": "1234567a" }
    # When method Post
    # Then status 201
    # * def token = responseHeaders['AuthToken']
    * def tokenResponse = callonce read('classpath:helpers/CreateToken.feature')
    * def token = tokenResponse.authToken

 Scenario: Product added to Cart

   Given header Authorization = 'Bearer ' + token
   Given path 'customer/cart'
   And request {"quantity":1,"productId":2097,"countryId":"1","customerId":222,"sellerId":55}
   When method Post
   Then status 201



