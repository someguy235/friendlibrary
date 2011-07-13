package com.friendlibrary

import grails.test.*

class ItemServiceUnitTests extends GrailsUnitTestCase {
  void testAddItem(){
    mockLogging(ItemService)

    // create our library dependency
    def testLib = new Library(id:1)
    assert testLib
    assertEquals testLib.available["books"], 0
    Library.metaClass.static.save = {-> true }
    mockDomain(Library, [testLib])

    // create our testUser and user domain
    def testUser = new User(id:1, library:testLib)
    assert testUser
    assert testUser.library
    assertEquals testUser.library, testLib
    assertEquals testUser.id, 1
    mockDomain(User, [testUser])

    testLib.user = testUser
    assertEquals testLib.user, testUser
    
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
    //ItemService.metaClass.getParams = {-> testParams }
    def testService = new ItemService()
    
    // test for trying to add a duplicate item
    def result = testService.addItem(testParams)
    assertEquals result, "that item is already in your library"
    assertEquals testLib.available["books"], 0

    // when the item is not already in the library
    mockDomain(Item, [])
    assertNull Item.get(1)
    Item.metaClass.static.find = {string, map ->
      null
    }
    result = testService.addItem(testParams)
    assertEquals result, "item added"
    assertEquals testLib.available["books"], 1

  }
  
  void testAddItemList(){

  }

  void testDeleteItem(){
    // create our library dependency
    def testLib = new Library(id:1)
    assert testLib
    assertEquals testLib.available["books"], 0
    Library.metaClass.static.save = {-> true }
    mockDomain(Library, [testLib])

    // create an existing book item and mock the domain
    def existingBook = new Book(id:1,
                                title:"Infinite Jest",
                                author:"David Foster Wallace",
                                library:testLib)
    assert existingBook
    assertEquals existingBook.id, 1
    assertEquals existingBook.library, testLib
    assertEquals existingBook.title, "Infinite Jest"
    mockDomain(Item, [existingBook])
    assertEquals Item.get(1).title, existingBook.title

    def testService = new ItemService()

    // test a successful delete
    def testParams = ["requestedMedia":1]
    def result = testService.deleteItem(testParams)
    assertEquals result, "\"Infinite Jest\" deleted"

    // test a failed delete (null item)
    testParams = ["requestedMedia":0]
    result = testService.deleteItem(testParams)
    assert result.startsWith('failed to delete item')

  }
  
  void testGetBorrowedItems(){

  }

  protected void setUp() {
      super.setUp()
  }

  protected void tearDown() {
      super.tearDown()
  }
}
