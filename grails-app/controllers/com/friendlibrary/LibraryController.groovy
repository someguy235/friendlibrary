package com.friendlibrary

class LibraryController {
	def authenticateService
	def itemService
	def scaffold = true
	
	
    def index = {
		def libUser = User.findByUsername(params.id)
		def viewUser = authenticateService.userDomain()
		viewUser = User.get(viewUser.id)
		def userLib = libUser.library
		def allItems = [userLib.albums, userLib.books, userLib.games, userLib.movies]
		def boolean viewingSelf = (libUser == viewUser)
		[ user : libUser, viewUser:viewUser, viewingSelf : viewingSelf, allItems:allItems ]
		
	 }
	
	def show = {
		def library = Library.findById(params.id)
		def allItems = [library.albums, library.books, library.games, library.movies]
		render "Albums (${allItems[0].size()}): <br />"
		library.albums.each(){render "${it} <br />"}
		render "Books (${allItems[1].size()}): <br />"
		library.books.each(){render "${it} <br />"}
		render "Games (${allItems[2].size()}): <br />"
		library.games.each(){render "${it} <br />"}
		render "Movies (${allItems[3].size()}): <br />"
		library.movies.each(){render "${it} <br />"}
		render "Items: ${allItems[0].size() + allItems[1].size() + allItems[2].size() + allItems[3].size()}"
	}
}
