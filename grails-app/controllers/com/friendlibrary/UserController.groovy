package com.friendlibrary

class UserController {
		def scaffold = true

		def search = {
		}

		//def registration = {
		//}

		def results = {
			def users = User.findAllByUserIdLike(params.username)
			return [users: users, term: params.username]
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
