package com.friendlibrary

class UserController {
		def scaffold = true

		def search = {
		}

		def results = {
			def users = User.findAllByUserIdLike(params.username)
			return [users: users, term: params.username]
		}

//    def index = { }
}
