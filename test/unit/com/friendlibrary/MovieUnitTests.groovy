package com.friendlibrary

import grails.test.*

class MovieUnitTests extends GrailsUnitTestCase {
  void testConstraints(){
    def newMovie = new Movie(title:"New Movie", format:"DVD")
    mockForConstraintsTests(Movie, [newMovie])

    def testMovie = new Movie()
    assertFalse testMovie.validate()
    assertEquals "nullable", testMovie.errors["title"]
    assertEquals "nullable", testMovie.errors["format"]

    testMovie = new Movie(title: "Test Movie", format:"DVD")

    assertEquals "Test Movie", testMovie.title
    assertEquals false, testMovie.reserved
    assertEquals false, testMovie.loanedOut
    assertEquals null, testMovie.rating
    assertEquals null, testMovie.loanedTo
    assertEquals ([], testMovie.requestQueue)

    assertEquals "movie", testMovie.mediaType
    assertEquals "DVD", testMovie.format

  }

  protected void setUp() {
      super.setUp()
  }

  protected void tearDown() {
      super.tearDown()
  }

}
