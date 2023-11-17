Feature: simple data driven testing

  Background:
    * def urlBase = karate.properties['url.base'] || karate.get('urlBase', 'http://localhost:8088')
    * url urlBase + '/api/todos'

  Scenario Outline:
    * request { title: '#(title)', complete: false }
    * method post
    * match response == { id: '#string', title: '#(title)', complete: false }
    * status 200

    Examples:
      | title |
      | One   |
      | Two   |
      | Three |
