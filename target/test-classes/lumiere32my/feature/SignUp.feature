
Feature: Test SignUp Functionality

    Background: Define URL
        * def dataGenerator = Java.type('helpers.DataGenerator')
        Given url apiUrl

    Scenario: Enter Email
        # Given def userData = {"email":"@lumiere32.sg"}
        
        * def randomEmail = dataGenerator.getRandomEmail()
        
        Given path 'customer/checkByEmail'
        And request {"Email": #(randomEmail)}
        # And request {"Email":"kumar.gaurav+2@lumiere32.sg"}
        When method Post
        Then status 201

        Given path 'customer/register'
        # And request {"Email":"kumar.gaurav+2@lumiere32.sg","password":"1234567a","firstName":"hgjhhjgh","lastName":"ghghjhj","title":"Dr.","clinicName":"gjggjh","countryCode":"","mobileNumber":7979887789,"practiceType":"Medical","speciality":"Renal Medicine","countryRegionId":"1","countryId":"1","signupNewsletter":0}
        And request
        """
            {
                "Email": #(randomEmail),
                "password": "1234567a",
                "firstName": "hhihiih",
                "lastName": "juoioijjio",
                "title": "Dr.",
                "clinicName": "ijjoijoioj",
                "countryCode": "",
                "mobileNumber": 878787,
                "practiceType": "Medical",
                "speciality": "Rheumatology",
                "countryRegionId": "1",
                "countryId": "1",
                "signupNewsletter": 0
            }
        """
        When method post
        Then status 201
