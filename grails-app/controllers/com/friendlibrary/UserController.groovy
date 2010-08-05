package com.friendlibrary

class UserController {
		def scaffold = true
		def authenticateService

		def search = {
		}

		def results = {
			if ((params.firstname != "")||(params.lastname != "")){
				def users = User.findAllByUserFirstNameIlikeOrUserLastNameIlike(params.firstname, params.lastname)
				return [users: users, term: [params.firstname, params.lastname]]
			}
			else{
				def users = User.findAllByUsernameLike(params.username)
				return [users: users, term: [params.username, ""]]
			}
				
				
				
				
		}
		
		def profile = {
			def user = User.findByUsername(params.id)
			def viewUser = authenticateService.userDomain()
			viewUser = User.get(viewUser.id)
			def boolean viewingSelf = (user == viewUser) 
			[ user : user, viewingSelf : viewingSelf ]
		}
		
}
