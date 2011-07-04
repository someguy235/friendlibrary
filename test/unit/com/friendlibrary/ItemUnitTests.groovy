package com.friendlibrary

import grails.test.*

class ItemUnitTests extends GrailsUnitTestCase {

  void testConstraints(){
    
    mockForConstraintsTests(Item)

    def testItem = new Item()
    testItem.validate()
    assertEquals "nullable", testItem.errors["title"]

    testItem = new Item(title: "Test Item")
    testItem.validate()
    assertEquals "Test Item", testItem.title
    assertEquals false, testItem.reserved
    assertEquals false, testItem.loanedOut
    assertEquals null, testItem.rating
    assertEquals null, testItem.loanedTo
    assertEquals ([], testItem.requestQueue)

    assertEquals 1, testItem.errors.errorCount
    assertEquals "nullable", testItem.errors["library"]

  }

  protected void setUp() {
      super.setUp()
  }

  protected void tearDown() {
      super.tearDown()
  }

}
