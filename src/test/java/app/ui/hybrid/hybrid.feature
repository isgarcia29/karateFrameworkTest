Feature:

  Background:
    * configure driver = { type: 'chrome' }
    * driver 'http://localhost:8088'

  Scenario:
    * def randomValue = 'One' + (function(){ return Math.floor(Math.random() * 1000) + 1; })()
    * print 'random id:', randomValue
    * input('input[name=title]', randomValue + Key.ENTER)
    * def find = read('find.js')
    * def id = waitUntil(() => find(randomValue))
    * print 'created id:', id

    * url 'http://localhost:8088/api/todos'
    * path id
    * method get
    * status 200
    * match response == { id: '#(id)', title: 'One', complete: false }
