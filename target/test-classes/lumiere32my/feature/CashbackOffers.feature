
Feature: Test for the Cashabck Offers Api

Background: Define URL
    Given url apiUrl
    # Given path 'customer/login'
    # And request { "Email": "gaurav@lumiere32.sg", "password": "1234567a" }
    # When method Post
    # Then status 201
    # * def token = responseHeaders['AuthToken']
    # * def idofcustomer = response.data.customerId
    # * print idofcustomer
    * def tokenResponse = callonce read('classpath:helpers/CreateToken.feature')
    * def token = tokenResponse.authToken
    * def id = tokenResponse.idofcustomer
    

 Scenario: Cashback api should not be work with token

   Given path 'get-cash-back/222'
   When method Get
   Then status 200


    
Scenario: Cashback api work with token

       Given header Authorization = 'Bearer ' + token
       Given path 'get-cash-back/222'
       When method Get
       Then status 200
       And match response == 
               """
                {
                    "success": "#boolean",
                    "data": {
                        "customerId": "#number",
                        "planId": "#number",
                        "name": "#string",
                        "CashBackScheme": "#array"
                    },
                    "message": "#string"
                }
               """

       And match each response.data.CashBackScheme == 
        """
            {
                                "cashbackSchemeId": "#number",
                                "planId": "#number",
                                "cashbackCycle": "#string",
                                "minValueTotal": "#string",
                                "cashbackValue": "#string",
                                "cashbackType": "#string",
                                "maxCashback": "#string",
                                "cashbackQuotaUser": "#number",
                                "startDate": "#string",
                                "endDate": "#string",
                                "textLine1": "#present",
                                "textLine2": "#present",
                                "adminStatus": 1,
                                "isDelete": 0,
                                "created_at": "#string",
                                "updated_at": "#string",
                                "cashbackOfferName": "#present",
                                "cashbackUsedBycustomer": "#string",
                                "noOfDaysLeft": "#number"        
            }
        """
        And match response.data.customerId == id
       
