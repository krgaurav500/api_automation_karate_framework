
Feature: Test for the Login Page

     Background: Define URL
         Given url apiUrl

    
      Scenario: Successful Login

        Given path 'customer/login'
        And request { "Email": "gaurav@lumiere32.sg", "password": "1234567a" }
        When method Post
        Then status 201
        # And match response.success == true
        # And match response.message contains 'Login successfully.'
        # And match response.message == "#string"
        # And match response.data.lastName contains 'Gaurav'
        # And match response.data.lastName == "#string"
        # And match response.data.Email == "#string"
        # And match response.data.adminStatus == "#number"
        # And match each response == 
        # """
        #     {
        #         message : "#string",
        #        // adminStatus : "#number"
        #     }
        # """  
        # And match response.data.customerId == 222
        # And match response.data.customerId == "#number"  
        # * def authToken = responseHeaders['authtoken']
        # And match response.data.Email == 'gaurav@lumiere32.sg'
        # And match response.data.adminStatus != 0
        And match each response.data == 
        """
            {
                Email : "#string",
                adminStatus : "#number",
                braintreeCustomerId: "##string",
                }
        """




        
                buildingName : "##string",
                city: "##string",
                clinicName: "#string",
                countryCode: "#string",
                countryId: "#number",
                countryRegionId: "#number",
                customerGroupId: "##number",
                customerId: "#number",
                customerRegionName: "#string",
                disableAbandonCart: "#boolean",
                disableReminder: "#boolean",
                emailVerify: "#number",
                firstName: "#string",
                floorNo: "##string",
                houseNo: "##string",
                image: "##string",
                isDelete: "#number",
                isDisableReward: "#boolean",
                jobTitle: "##string",
                lastName: "#string",
                mobileNumber: "##number",
                mobileVerify: "#number",
                nric: "##number",
                otp: "##number",
                pincode: "#number",
                practiceType: "#string",
                rewardPlanId: "#number",
                shippingMobileNo: "#number",
                shippingMobileVerify: "#number",
                signupNewsletter: "#number",
                state: "##string",
                streetName: "##string",
                stripeCustomerId: "##string",
                teleNumber: "#number",
                title: "#string",
                unitNo: "##string",
                website: "##string"  
            }
        """


      Scenario: Unsuccessful login

        Given path 'customer/login'
        And request { "Email": "gaurav@lumiere32.sg", "password": "1234567" }
        When method Post
        Then status 400
        And match response.message contains 'Incorrect password!'
        And match response.Email == 'gaurav@lumiere32.sg'



      
         


