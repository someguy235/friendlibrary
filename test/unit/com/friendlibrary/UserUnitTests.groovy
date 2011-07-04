package com.friendlibrary

import grails.test.*

class UserUnitTests extends GrailsUnitTestCase {

  void testConstraints(){
    
    def existingUser = new User(username: "existingUser")
    mockForConstraintsTests(User, [existingUser] )

    def testUser = new User()
    testUser.validate()
    assertEquals 4, testUser.errors.errorCount
    assertEquals "nullable", testUser.errors["username"]
    assertEquals "nullable", testUser.errors["passwd"]
    assertEquals "nullable", testUser.errors["email"]
    assertEquals null, testUser.dateCreated
    assertEquals null, testUser.userFirstName
    assertEquals null, testUser.userLastName
    assertEquals "nullable", testUser.errors["library"]

    testUser = new User(username: "existingUser")
    testUser.validate()
    assertEquals "unique", testUser.errors["username"]

    testUser = new User(username: "aa", passwd: "bb", email:"")
    testUser.validate()
    assertEquals "size", testUser.errors["username"]
    assertEquals "size", testUser.errors["passwd"]
    assertEquals null, testUser.errors["email"]
    
    testUser = new User(username: "testUser",
                        passwd: "testPassword",
                        email: "testEmail",
                        dateCreated: new Date(),
                        userFirstName: "Test",
                        userLastName: "User")
    testUser.validate()
    assertEquals 1, testUser.errors.errorCount
    
  }

  protected void setUp() {
      super.setUp()
  }

  protected void tearDown() {
      super.tearDown()
  }

}
