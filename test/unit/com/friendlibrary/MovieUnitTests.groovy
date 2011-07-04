package com.friendlibrary

import grails.test.*

class MovieUnitTests extends GrailsUnitTestCase {
  void testConstraints(){

    mockForConstraintsTests(Movie)

    def testMovie = new Movie()
    testMovie.validate()
    assertEquals "nullable", testMovie.errors["title"]
    assertEquals "nullable", testMovie.errors["format"]

    testMovie = new Movie(title: "Test Movie", format:"DVD")
    testMovie.validate()
    assertEquals "Test Movie", testMovie.title
    assertEquals false, testMovie.reserved
    assertEquals false, testMovie.loanedOut
    assertEquals null, testMovie.rating
    assertEquals null, testMovie.loanedTo
    assertEquals ([], testMovie.requestQueue)

    assertEquals "movie", testMovie.mediaType
    assertEquals "DVD", testMovie.format

    assertEquals 1, testMovie.errors.errorCount
    assertEquals "nullable", testMovie.errors["library"]

  }

  protected void setUp() {
      super.setUp()
  }

  protected void tearDown() {
      super.tearDown()
  }

}
