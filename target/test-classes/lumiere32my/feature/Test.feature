Feature: Test for the Login Page

Background: Define URL
    Given url apiUrl
    * def tokenResponse = callonce read('classpath:helpers/CreateToken.feature')
    * def token = tokenResponse.authToken

 Scenario: Successful Login
    * def timeValidator = read('classpath:helpers/timeValidator.js')

    Given path 'customer/login'
    And request { "Email": "gaurav@lumiere32.sg", "password": "1234567a" }
    When method Post
    Then status 201
    And match response.data == 
        """
            {
                            "customerId" : "#number",
                            "firstName" : "#string",
                            "lastName" : "#string",
                            "Email" : "#string",
                            "title" : "#string",
                            "clinicName" : "#string",
                            "countryCode" : "#string",
                            "mobileNumber" : "#string",
                            "teleNumber" : "#string",
                            "speciality" : "#string",
                            "otp" : "#string",
                            "mobileVerify" : "#number",
                            "emailVerify" : "#number",
                            "signupNewsletter" : "#number",
                            "houseNo" : "#string",
                            "floorNo" : "#string",
                            "unitNo" : "#string",
                            "streetName" : "#string",
                            "buildingName" : "#string",
                            "website" : "##string",
                            "pincode" : "#string",
                            "disableReminder" : "#boolean",
                            "practiceType" : "#string",
                            "nric" : "##string",
                            "image" : "##string",
                            "jobTitle" : "##string",
                            "customerGroupId" : "#number",
                            "countryId" : "#number",
                            "countryRegionId" : "#number",
                            "braintreeCustomerId" : "##string",
                            "shippingMobileNo" : "##string",
                            "shippingMobileVerify" : "#number",
                            "adminStatus" : "#number",
                            "isDelete" : "#number",
                            "created_at" : "#? timeValidator(_)",
                            "updated_at" : "#? timeValidator(_)",
                            "state" : "##string",
                            "stripeCustomerId" : "##string",
                            "disableAbandonCart" : "#boolean",
                            "rewardPlanId" : "#number",
                            "isDisableReward" : "#boolean",
                            "city" : "##string",
                            "customerRegionName" : "##string"            
            }
        """




