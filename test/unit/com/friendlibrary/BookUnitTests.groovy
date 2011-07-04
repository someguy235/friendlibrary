package com.friendlibrary

import grails.test.*

class BookUnitTests extends GrailsUnitTestCase {
 void testConstraints(){

    mockForConstraintsTests(Book)

    def testBook = new Book()
    testBook.validate()
    assertEquals "nullable", testBook.errors["title"]

    testBook = new Book(title: "Test Book")
    testBook.validate()
    assertEquals "Test Book", testBook.title
    assertEquals false, testBook.reserved
    assertEquals false, testBook.loanedOut
    assertEquals null, testBook.rating
    assertEquals null, testBook.loanedTo
    assertEquals ([], testBook.requestQueue)

    assertEquals "book", testBook.mediaType
    assertEquals null, testBook.author

    assertEquals 1, testBook.errors.errorCount
    assertEquals "nullable", testBook.errors["library"]

  }

  protected void setUp() {
      super.setUp()
  }

  protected void tearDown() {
      super.tearDown()
  }

}
