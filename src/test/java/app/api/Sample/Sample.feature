Feature:Sample API Test

Background:
  * url 'https://reqres.in/api'

Scenario: Get User by ID
  
  Given path '/users'
  And path id = 1
  When method GET
  Then status 200
  And match response.data contains {id: 1, email: 'george.bluth@reqres.in', first_name: 'George', last_name: 'Bluth'}

Scenario: Create User
  Given path '/users'
  And request { name: 'morpheus', Job: 'QA Tester' }
  When method POST
  Then status 201
  And match response contains {name: 'morpheus', Job: 'QA Tester', id: '#notnull'}

Scenario: Update User
  Given path '/users'
  And path id = 1
  And request { name: 'morpheus', Job: 'Developer' }
  When method PUT
  Then status 200
  And match response contains {name: 'morpheus', Job: 'Developer' }

Scenario: Delete User
  Given path '/users'
  And path id = 787
  When method DELETE
  Then status 204

Scenario: Call Java method to add numbers
  Given def a = 5
  And def b = 10
  * def JavaDemos = Java.type('app.api.util.useJava')
  * def result = JavaDemos.addNumbers(5,6)
  * print 'Result: ', result

Scenario: Create and reference a complex object
  * def MyClass = Java.type('app.api.util.Person')
  * def myObject = MyClass.createComplexObject(1, 'Example')
  * def id = myObject.id
  * def name = myObject.name
  # Now you can use the 'id' and 'name' variables in your test as needed
  * print 'ID:', id
  * print 'Name:', name