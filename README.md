# Karate DSL Framework - README

## Introduction
Welcome to our Karate DSL framework, a powerful tool for API testing using Visual Studio Code. Karate DSL is a BDD-style testing framework for APIs, making it easy to write expressive and comprehensive test scenarios. This README provides an overview of the framework, setup instructions, and usage guidelines to help you get started with API testing efficiently.

## Features
In-built support for RESTful and SOAP API testing.
Complex assertion capabilities for precise validation.
Seamless integration with Java for custom logic and data manipulation.
Easy setup and integration with Visual Studio Code for quick development.


## Getting Started
### Prerequisites
Before getting started, make sure you have the following installed:

 * Java Development Kit (JDK) 8 or higher
 * Visual Studio Code

### Installation
Clone this repository to your local machine:
 * git clone <repository_url>
Install the required dependencies using Maven:
 * mvn clean install
Running Tests
 * mvn test
  * The tests will be executed, and the test results will be displayed in the console.

### Project Structure
The project structure is designed to keep the test scenarios organized and maintainable.

```
karate-dsl-framework
├── src
│   ├── test
│   │   ├── java            # Custom Java classes and utility methods
│   │   └── resources
│   │       └── features    # Karate feature files (test scenarios)
├── pom.xml                 # Maven configuration file
└── README.md
```

Feel free to organize the test scenarios into subdirectories based on your project's needs.

### Writing Test Scenarios
Test scenarios are written using Karate's Gherkin-like syntax in feature files. Each feature file contains one or more scenarios, and each scenario outlines a test case.

Example feature file (api_test.feature):
```
Feature: Testing API Endpoints

Scenario: Verify GET Request
    Given url 'https://api.example.com/users'
    When method get
    Then status 200
    And match response contains { name: 'John', age: 30 }
```

### Customizing Tests
For custom logic, data generation, or advanced manipulations, you can leverage Java's capabilities by adding your Java classes to the src/test/java directory. Karate allows you to call Java methods directly from your feature files.

Example Java class (CustomUtils.java):
```
java
Copy code
public class CustomUtils {
    public static String generateRandomName() {
        // Your custom logic to generate random names
        // ...
        return randomName;
    }
}
```

In your feature file:
```
Scenario: Verify POST Request
    * def CustomUtils = Java.type('com.example.CustomUtils')
    * def randomName = CustomUtils.generateRandomName()
    Given url 'https://api.example.com/users'
    And request { name: '#(randomName)', age: 25 }
    When method post
    Then status 201
```

### Contribution Guidelines
We welcome contributions to improve the framework or add new features. To contribute, please fork this repository and submit a pull request with your changes.

### Support
If you encounter any issues or have questions about the framework, please feel free to open an issue in the repository. We'll be glad to assist you.

### General Documentation
 * API Test [Karate API Testing](https://karatelabs.github.io/karate)
 * UI Test [Karate UI Testing](https://karatelabs.github.io/karate/karate-core)
 * API Performance Test [Karate API Performance Testing](https://karatelabs.github.io/karate/karate-gatling)


---
Congratulations! You are now ready to start API testing using our Karate DSL framework in Visual Studio Code. If you have any questions or need further assistance, please don't hesitate to reach out to us.

Happy testing!


