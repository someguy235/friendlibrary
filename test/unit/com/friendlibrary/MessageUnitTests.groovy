package com.friendlibrary

import grails.test.*

class MessageUnitTests extends GrailsUnitTestCase {
  
  void testConstraints(){

    mockForConstraintsTests(Message)

    def testMessage = new Message()
    testMessage.validate()
    assertEquals "nullable", testMessage.errors["sentFrom"]
    assertEquals "nullable", testMessage.errors["sentTo"]
    assertEquals "nullable", testMessage.errors["body"]
    assertEquals "nullable", testMessage.errors["type"]
    assertEquals null, testMessage.errors["item"]

    testMessage = new Message(type:"test message type")
    testMessage.validate()
    assertEquals "inList", testMessage.errors["type"]

    testMessage = new Message(body: "test message body", type:"Item Request")
    testMessage.validate()
    assertEquals testMessage.body, "test message body"
    assertEquals testMessage.type, "Item Request"
    assertEquals 2, testMessage.errors.errorCount
    assertEquals "nullable", testMessage.errors["sentFrom"]
    assertEquals "nullable", testMessage.errors["sentTo"]
    
  }

  protected void setUp() {
      super.setUp()
  }

  protected void tearDown() {
      super.tearDown()
  }

}
