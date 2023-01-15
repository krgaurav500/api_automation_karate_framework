
Feature: Test for the Home Page

     Background: Define URL
        Given url apiUrl

    Scenario: Get all Banners
        
        Given path 'admin/bannerList'
        Given param countryId = 1
        When method Get
        Then status 200

    Scenario: Get all Parent Category
        
        Given path 'web/getAllCategory'
        Given param countryId = 1
        When method Get
        Then status 200

    Scenario: Get all Manufacturer / Brands
        
        Given path 'admin/manufacturer'
        When method Get
        Then status 200
    
    Scenario: Get all Parent Categories' Products on Landing Page
        
        Given path 'web/getdashboardProductByParentCategory'
        When method Get
        Then status 200
    