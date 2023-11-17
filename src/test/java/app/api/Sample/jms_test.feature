Feature:


Scenario: Send and Receive JMS Test Message
    * def JmsMessageSender = Java.type('com.example.JmsMessageSender')  # Replace with the actual package path
    * def brokerUrl = 'tcp://localhost:61616'  # Replace with your JMS broker URL
    * def queueName = 'TestQueue'  # Replace with the name of your JMS test queue
    * def messageContent = 'This is a test message.'  # Replace with the message content you want to send

    # Step 1: Send the test message to the JMS queue
    * JmsMessageSender.sendMessageToQueue(brokerUrl, queueName, messageContent)

    # Step 2: Read the test message from the JMS queue and verify it
    * def JmsReader = Java.type('com.example.JmsReader')  # Replace with the actual package path of your JmsReader class
    * def receivedMessage = JmsReader.readMessageFromQueue(brokerUrl, queueName)
    * print 'Received message:', receivedMessage

    # Step 3: Perform assertions on the received message
    * match receivedMessage == messageContent