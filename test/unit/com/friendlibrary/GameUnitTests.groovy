package com.friendlibrary

import grails.test.*

class GameUnitTests extends GrailsUnitTestCase {
  void testConstraints(){

    mockForConstraintsTests(Game)

    def testGame = new Game()
    testGame.validate()
    assertEquals "nullable", testGame.errors["title"]
    assertEquals "nullable", testGame.errors["platform"]

    testGame = new Game(title: "Test Game", platform:"PS3")
    testGame.validate()
    assertEquals "Test Game", testGame.title
    assertEquals false, testGame.reserved
    assertEquals false, testGame.loanedOut
    assertEquals null, testGame.rating
    assertEquals null, testGame.loanedTo
    assertEquals ([], testGame.requestQueue)

    assertEquals "game", testGame.mediaType
    assertEquals "PS3", testGame.platform

    assertEquals 1, testGame.errors.errorCount
    assertEquals "nullable", testGame.errors["library"]

  }

  protected void setUp() {
      super.setUp()
  }

  protected void tearDown() {
      super.tearDown()
  }

}
