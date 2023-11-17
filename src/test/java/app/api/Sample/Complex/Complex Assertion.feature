Feature:Sample API Test

Background:
  * url 'https://reqres.in/api'

Scenario: Partial Payload Matching
  Given path '/users'
  And path id = 1
  When method GET
  Then status 200
  And match response.data contains {id: 1, email: 'george.bluth@reqres.in', first_name: 'George', last_name: 'Bluth'}

Scenario: Exact Payload Matching
  Given path '/users'
  And path id = 1
  When method GET
  Then status 200
  And match response.data == {id:1,email:'george.bluth@reqres.in',first_name:'George',last_name:'Bluth',avatar:'https://reqres.in/img/faces/1-image.jpg'}

Scenario: Exclude Generated Fields
  Given path '/users'
  And path id = 1
  When method get
  Then status 200
  And def expected = {id: 1, first_name: 'George', last_name: 'Bluth'}
  * remove response.data.email
  * remove response.data.avatar
  * print response.data
  And match response.data == expected




