package com.friendlibrary

import grails.test.*

class GameUnitTests extends GrailsUnitTestCase {
  void testConstraints(){
    def newGame = new Game(title:"New Game", platform:"PS3")
    mockForConstraintsTests(Game, [newGame])

    def testGame = new Game()
    assertFalse testGame.validate()
    assertEquals "nullable", testGame.errors["title"]
    assertEquals "nullable", testGame.errors["platform"]

    testGame = new Game(title: "Test Game", platform:"PS3")

    assertEquals "Test Game", testGame.title
    assertEquals false, testGame.reserved
    assertEquals false, testGame.loanedOut
    assertEquals null, testGame.rating
    assertEquals null, testGame.loanedTo
    assertEquals ([], testGame.requestQueue)

    assertEquals "game", testGame.mediaType
    assertEquals "PS3", testGame.platform

  }

  protected void setUp() {
      super.setUp()
  }

  protected void tearDown() {
      super.tearDown()
  }

}
