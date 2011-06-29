package com.friendlibrary

import grails.test.*

class ItemUnitTests extends GrailsUnitTestCase {
  void testConstraints(){
    def newItem = new Item(title:"New Item")
    mockForConstraintsTests(Item, [newItem])

    def testItem = new Item()
    assertFalse testItem.validate()
    assertEquals "nullable", testItem.errors["title"]

    testItem = new Item(title: "Test Item")
    assertEquals "Test Item", testItem.title
    assertEquals false, testItem.reserved
    assertEquals false, testItem.loanedOut
    assertEquals null, testItem.rating
    assertEquals null, testItem.loanedTo
    assertEquals ([], testItem.requestQueue)
    
  }

  protected void setUp() {
      super.setUp()
  }

  protected void tearDown() {
      super.tearDown()
  }

}
