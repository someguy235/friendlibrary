package com.friendlibrary

class IndexController {
	def authenticateService
	def scaffold = false
	
    def index = { 
		//def libUser = User.findByUsername(params.id)
		def viewUser = authenticateService.userDomain()
		viewUser = User.get(viewUser?.id)
		//def boolean viewingSelf = (libUser == viewUser) 
		[ viewUser : viewUser ]
	}
}
