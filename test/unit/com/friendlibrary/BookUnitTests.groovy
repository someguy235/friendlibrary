package com.friendlibrary

import grails.test.*

class BookUnitTests extends GrailsUnitTestCase {
  void testConstraints(){
    def newBook = new Book(title:"New Book")
    mockForConstraintsTests(Book, [newBook])

    def testBook = new Book()
    assertFalse testBook.validate()
    assertEquals "nullable", testBook.errors["title"]

    testBook = new Book(title: "Test Book")

    assertEquals "Test Book", testBook.title
    assertEquals false, testBook.reserved
    assertEquals false, testBook.loanedOut
    assertEquals null, testBook.rating
    assertEquals null, testBook.loanedTo
    assertEquals ([], testBook.requestQueue)

    assertEquals "book", testBook.mediaType
    assertEquals null, testBook.author

  }

  protected void setUp() {
      super.setUp()
  }

  protected void tearDown() {
      super.tearDown()
  }

}
