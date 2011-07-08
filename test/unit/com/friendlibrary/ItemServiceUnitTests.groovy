package com.friendlibrary

import grails.test.*

class ItemServiceUnitTests extends GrailsUnitTestCase {
  void testAddItem(){
    mockLogging(ItemService)

    // create our library dependency
    def testLib = new Library(id:1)
    assert testLib

    // create our testUser and user domain
    def testUser = new User(id:1, library:testLib)
    assert testUser
    assert testUser.library
    assertEquals testUser.library, testLib
    assertEquals testUser.id, 1
    mockDomain(User, [testUser])

    // create an existing book item and mock the domain
    def existingBook = new Book(id:1,
                                title:"Infinite Jest",
                                author:"David Foster Wallace",
                                library:testLib)
    Item.metaClass.static.find = {string, map ->
      existingBook
    }
    assert existingBook
    assertEquals existingBook.id, 1
    assertEquals existingBook.library, testLib
    assertEquals existingBook.title, "Infinite Jest"
    mockDomain(Item, [existingBook])
    assertEquals Item.get(1).title, existingBook.title

    // map the params for the item we want to add, and mock the service
    def testParams = ["id":1, "title":"Infinite Jest", "mediaType":"book"]
    ItemService.metaClass.getParams = {-> testParams }
    def testService = new ItemService()
    
    // test for trying to add a duplicate item
    def result = testService.addItem(testParams)
    assertEquals result, "that item is already in your library"

    // when the item is not already in the library
    Item.metaClass.static.find = {string, map ->
      null
    }
    result = testService.addItem(testParams)
    assertEquals result, "item added"


  }
  

  protected void setUp() {
      super.setUp()
  }

  protected void tearDown() {
      super.tearDown()
  }
}
