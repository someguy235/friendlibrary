package com.friendlibrary

class LibraryController {
	def authenticateService
	def itemService
	def scaffold = true
	
	
    def index = {
		def libUser = User.findByUsername(params.id)
		def viewUser = authenticateService.userDomain()
		viewUser = User.get(viewUser.id)
		def allItems = [libUser.library.games]
		def boolean viewingSelf = (libUser == viewUser)
		[ user : libUser, viewingSelf : viewingSelf, allItems:allItems ]
		
	 }
	
	def show = {
		def library = Library.findById(params.id)
		def allItems = [library.games]
		render "Albums: <br />"
		library.albums.each(){render "${it} <br />"}
		render "Books: <br />"
		library.books.each(){render "${it} <br />"}
		render "Games: <br />"
		library.games.each(){render "${it} <br />"}
		render "Movies: <br />"
		library.movies.each(){render "${it} <br />"}
		render "Items: <br />"
		render allItems[0].size() + "<br />"
	}
}
