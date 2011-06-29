package com.friendlibrary

import grails.test.*

class AlbumUnitTests extends GrailsUnitTestCase {
  void testConstraints(){
    def newAlbum = new Album(title:"New Album", artist:"New Artist")
    mockForConstraintsTests(Album, [newAlbum])

    def testAlbum = new Album()
    assertFalse testAlbum.validate()
    assertEquals "nullable", testAlbum.errors["title"]
    assertEquals "nullable", testAlbum.errors["format"]
    
    testAlbum = new Album(title: "Test Album", artist:"testArtist", format:"mp3")
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

  }

  protected void setUp() {
      super.setUp()
  }

  protected void tearDown() {
      super.tearDown()
  }

}
