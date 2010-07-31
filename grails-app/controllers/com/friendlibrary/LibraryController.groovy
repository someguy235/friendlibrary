package com.friendlibrary

class LibraryController {
	def authenticateService
	def itemService
	def scaffold = true
	
    def index = {
		def libUser = User.findByUsername(params.id)
		def viewUser = authenticateService.userDomain()
		viewUser = User.get(viewUser.id)
		def boolean viewingSelf = (libUser == viewUser)
		[ user : libUser, viewingSelf : viewingSelf ]
		
	 }
	
	def show = {
		
	}
}
