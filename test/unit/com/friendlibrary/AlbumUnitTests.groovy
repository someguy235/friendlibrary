package com.friendlibrary

import grails.test.*

class AlbumUnitTests extends GrailsUnitTestCase {
  void testConstraints(){

    mockForConstraintsTests(Album)

    def testAlbum = new Album()
    testAlbum.validate()
    assertEquals "nullable", testAlbum.errors["title"]
    assertEquals "nullable", testAlbum.errors["format"]
    assertEquals "nullable", testAlbum.errors["artist"]
    
    testAlbum = new Album(title: "Test Album", artist:"testArtist", format:"mp3")
    testAlbum.validate()
    assertEquals "Test Album", testAlbum.title
    assertEquals false, testAlbum.reserved
    assertEquals false, testAlbum.loanedOut
    assertEquals null, testAlbum.rating
    assertEquals null, testAlbum.loanedTo
    assertEquals ([], testAlbum.requestQueue)

    assertEquals "album", testAlbum.mediaType
    assertEquals "testArtist", testAlbum.artist
    assertEquals null, testAlbum.genre
    assertEquals "mp3", testAlbum.format

    assertEquals 1, testAlbum.errors.errorCount
    assertEquals "nullable", testAlbum.errors["library"]

  }

  protected void setUp() {
      super.setUp()
  }

  protected void tearDown() {
      super.tearDown()
  }

}
