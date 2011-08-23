package com.friendlibrary

//class ItemException extends RuntimeException{
//	String message
//	Item item
//}

class ItemService{

  boolean transactional = true

  //
  // Add a single item to a user's library
  //
  String addItem(params){
    def user = User.get(params.id)
    def library = user?.library
    
    def existingItem = Item.find("from Item as i where \
                                  i.title = :title and \
                                  i.mediaType = :mediaType and \
                                  i.library.id = :libid",
                                  [title:params.title, mediaType:params.mediaType, libid:library.id]
                                )
    
    if(existingItem){
      return "that item is already in your library"
    }

    def item
    switch(params.mediaType){
      case "album":
        item = new Album(artist:params.artist, genre:params.genre, format:params.format)
        break
      case "book":
        item = new Book(author:params.author)
        break
      case "game":
        item = new Game(platform:params.platform)
        break
      case "movie":
        item = new Movie(format:params.format)
        break
      default:
        throw new ItemException(message: "Invalid item type", item:item)
    }
    library.available[(params.mediaType + "s")]+=1
    item.title = params.title
    item.library = library
    
    item.save(failOnError:true)
    if(library.save(failOnError:true)){
      return "item added"
    }else{
      throw new ItemException(message: "Invalid or empty item", item:item)
    }
	}

  String addItemList(params){
    def user = User.get(params.id)
    def itemsAdded = 0
    def itemsIgnored = 0
    def result = ""

    switch(params.source){
      case "GoodReads":
        def grKey = "76E1DkBEFtkn0tg03fnxQ"
        def grId = params.remoteUserId
        def grUrl = "http://www.goodreads.com/owned_books/user?format=xml&id=${grId}&key=${grKey}"
        def grResponse = new URL(grUrl).getText()
        def grXML = new XmlSlurper().parseText(grResponse)
        def ownedBooks = grXML.owned_books.owned_book
        def authorList = []
        def titleList = []
        
        ownedBooks.each{b ->
          result = addItem([
            "author": b.book.authors.author.name.text().trim(),
            "title": b.book.title.text().trim(),
            "id": params.id,
            "mediaType": "book"
          ])
          if (result == "item added")
            itemsAdded++
          else
            itemsIgnored++
        }
        break
      default:
        println "no case found"
    }
    result = "${itemsAdded} items added"
    if (itemsIgnored == 1)
      result += " (${itemsIgnored} duplicate ignored)"
    else if (itemsIgnored > 1)
      result += " (${itemsIgnored} duplicates ignored)"
    return result
  }

  String deleteItem(params){
    try{
      def item = Item.get(params.requestedMedia)
      if(!item.loanedOut){
        item.library.available[(item.mediaType+"s")]-=1
      }
      item.delete()
      return "\"${item.title}\" deleted"
    }catch(Exception e){
      return "failed to delete item: " + e
    }
  }

  String editItem(params){
    try{
      def item = Item.get(params.requestedMedia)

      if(params.edit_title){
        item.title = params.edit_title
      }
      if(params.edit_artist){
        item.artist = params.edit_artist
      }
      if(params.edit_author){
        item.author = params.edit_author
      }
      if(params.edit_format){
        item.format = params.edit_format
      }
      if(params.edit_platform){
        item.platform = params.edit_platform
      }

      item.save()
      
      return "edited \"${item.title}\""
    }catch(Exception e){
      return "failed to edit ${item.title}: " + e
    }
  }

  HashMap getBorrowedItems(userId){
    def bMusic = Item.findAll("from Item as i where \
                             i.loanedTo.id = :id and \
                             i.mediaType = :mediaType",
                             [mediaType:"album", id:userId]
                            )
    def bMovies = Item.findAll("from Item as i where \
                             i.loanedTo.id = :id and \
                             i.mediaType = :mediaType",
                             [mediaType:"movie", id:userId]
                            )
    def bBooks = Item.findAll("from Item as i where \
                             i.loanedTo.id = :id and \
                             i.mediaType = :mediaType",
                             [mediaType:"book", id:userId]
                            )
    def bGames = Item.findAll("from Item as i where \
                             i.loanedTo.id = :id and \
                             i.mediaType = :mediaType",
                             [mediaType:"game", id:userId]
                            )
    def bLib = ['music':bMusic, 'books':bBooks, 'games':bGames, 'movies':bMovies]
  }
}
