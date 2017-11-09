@problems
Feature: Problems

    @DSTU2 @STU3
    Scenario: Correct resourceType
        Given I have a Problems response
        Then the resourceType field will be Bundle
        Then the type field will be searchset

    @DSTU2
    Scenario: Resources are valid FHIR DSTU2 content
        Given I have a Problems response
        Then the resource parses as valid FHIR DSTU2 content

    @STU3
    Scenario: Resources are valid FHIR STU3 content
        Given I have a Problems response
        Then the resource parses as valid FHIR STU3 content

    @DSTU2 @STU3
    Scenario: Results exist
        Given I have a Problems response
        Then there should be at least 1 Condition entry

    @DSTU2 @STU3
    Scenario: Resources have ids
        Given I have a Problems response
        And there is at least 1 Condition entry
        Then all resources will have a id field

    @DSTU2 @STU3
    Scenario: All references will resolve
        Given I have a Problems response
        And there is at least 1 Condition entry
        Then all references will resolve

    @DSTU2 @STU3
    Scenario: All the codes are valid
        Given I have a Problems response
        And there is at least 1 Condition entry
        Then all the codes will be valid

    @warning @DSTU2 @STU3
    Scenario: Resources fulfill the Argonaut Problems and Health Concerns profile
        Given I have a Problems response
        And there is at least 1 Condition entry
        Then there exists one Identification of the the problem or concern in Condition.code
        # Problem Value Set is a subset of SNOMED CT
        # http://hl7.org/fhir/ValueSet/daf-problem
        And Condition.code is bound to http://snomed.info/sct
        Then there exists one patient reference in Condition.patient
        Then there exists one code in Condition.verificationStatus
        And Condition.verificationStatus is bound to http://hl7.org/fhir/ValueSet/condition-ver-status
