Feature:Sample API Test

Background:
  * url 'https://reqres.in/api'



Scenario: Create and reference a complex object
  * def MyClass = Java.type('app.api.util.Person')
  * def myObject = MyClass.createComplexObject(1, 'Israel')
  * def ids = myObject['id']
  * def names = myObject['name']

  # Now you can use the 'id' and 'name' variables in your test as needed
  * print 'ID:', ids
  * print 'Name:', names

Scenario: Create and reference a complex object
  * def MyClass = Java.type('app.api.util.Person')
  * def myObject = MyClass.createComplexObject(2, 'Garcia')
  * def id = myObject.id
  * def name = myObject.name
  * print 'ID:', id
  * print 'Name:', name

Scenario: Call Java method to add numbers
  Given def a = 5
  And def b = 10
  * def JavaDemos = Java.type('app.api.util.useJava')
  * def result = JavaDemos.addNumbers(5,6)
  * print 'Result: ', result