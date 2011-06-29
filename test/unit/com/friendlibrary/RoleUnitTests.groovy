package com.friendlibrary

import grails.test.*

class RoleUnitTests extends GrailsUnitTestCase {
  void testConstraints(){
    def newRole = new Role(authority:"New Role", description:"New Role")
    mockForConstraintsTests(Role, [newRole])

    def testRole = new Role()
    assertFalse testRole.validate()
    assertEquals "nullable", testRole.errors["authority"]

    testRole = new Role(authority:"")
    assertFalse testRole.validate()
    assertEquals "blank", testRole.errors["authority"]

    testRole = new Role(authority: "New Role")
    assertFalse testRole.validate()
    assertEquals "unique", testRole.errors["authority"]

    testRole = new Role(authority: "Test Role")
    assertEquals "Test Role", testRole.authority
    assertEquals null, testRole.description

  }

  protected void setUp() {
      super.setUp()
  }

  protected void tearDown() {
      super.tearDown()
  }

}
