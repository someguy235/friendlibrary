package com.friendlibrary

class UserController {
		def scaffold = true
		def authenticateService

		def search = {
		}

		//def registration = {
		//}

		def results = {
			def users = User.findAllByUserIdLike(params.username)
			return [users: users, term: params.username]
		}
		
		def profile = {
			def user = User.findByUsername(params.id)
			def viewUser = authenticateService.userDomain()
			viewUser = User.get(viewUser.id)
			def boolean viewingSelf = (user == viewUser) 
			[ user : user, viewingSelf : viewingSelf ]
		}
		
		/*
		def register = {
			def user = new User(params)
			if (user.validate()){
				user.save()
				flash.message = "Successfully Created User"
				redirect(uri: '/')
			}else{
				flash.message = "Error Registering User"
				return [ user: user ]
			}
		}
		*/
}
