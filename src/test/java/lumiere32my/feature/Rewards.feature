Feature: Test for the Rewards Api

Background: Define URL
    Given url apiUrl
    * def tokenResponse = callonce read('classpath:helpers/CreateToken.feature')
    * def token = tokenResponse.authToken

 Scenario: Reward Plan

   Given header Authorization = 'Bearer ' + token
   Given path 'web/rewardPlan'
   Given param countryId = 1
   When method Get
   Then status 200
   And match each response.data == 
    """
        
        {
            "id": "#number",
            "name": "#string",
            "description": "#string",
            "rewardPoints": "#number",
            "countryId": "#number",
            "spentAmount": "#number",
            "minPurchaseAmount": "#number",
            "startDate": "#ignore",
            "expiryDate": "#ignore",
            "buyPlanAmount": "#number",
            "eligibilityCriteriaDescription": "#ignore",
            "benefitsDescription": "#ignore",
            "validityDescription": "#ignore",
            "adminStatus": "#number",
            "isDelete": "#number",
            "convertRewardPoint": "#number",
            "convertWalletAmount": "#number"
        }
        
    """
   And match response.success == true
   And match response.message == "Reward Plan get successfully."


Scenario: Reward Scheme

    Given header Authorization = 'Bearer ' + token
    Given path 'web/rewardScheme'
    Given param countryId = 1
    When method Get
    Then status 200
    And match response.success == true
    And match response.message == "rewardSchemes get successfully."
    And match each response.data.results == 
    """
            {
                "id": "#number",
                "schemeName": "#string",
                "description": "#string",
                "countryId": "#number",
                "image": "#string",
                "pointRequired": "#number",
                "adminStatus": "#number",
                "isDelete": "#number",
                "created_at": "#ignore",
                "updated_at": "#ignore",
                "country":  {
                                "id": "#number",
                                "countryName": "#string"
                            }
            }
    """

    Scenario: Reward Transaction

        Given header Authorization = 'Bearer ' + token
        Given path 'customer/222/reward'
        Given param page = 1
        When method Get
        Then status 200
        And match response.success == true
        And match response.message == "Reward get successfully."
        And match each response.data.rewardTxn == 
        """
            {
                "txnId": "#number",
                "customerId": "#number",
                "rewardCredit": "#string",
                "rewardDebit": "#string",
                "message": "#string",
                "adminComments": "##string",
                "type": "##string",
                "txnSource": "##string",
                "orderId": "##number",
                "rewardRuleId": "#ignore",
                "isDelete": "#number",
                "created_at": "##string",
                "updated_at": "##string",
                "rewardRedemptionId": "#ignore",
                "order": "##object"
            }
        """
        And match response.data.total == "#number"
        And match response.data.totalPages == "#number"
        And match response.data.page == "#number"
        And match response.data.limit == "#number"
        And match response.data.reward == "#string"

