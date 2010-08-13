package com.friendlibrary

class UserController {
		def scaffold = true
		def authenticateService

		def search = {
		}

		def results = {
			if ((params.firstname != "")||(params.lastname != "")){
				def users = User.findAllByUserFirstNameIlikeOrUserLastNameIlike(params.firstname, params.lastname)
				return [users: users, term: [params.firstname, params.lastname] ]
			}
			else if (params.email != ""){
				def users = User.findAllByEmailIlike(params.email)
				return [users: users, term: [params.email, ""] ]
			}
			else{
				def users = User.findAllByUsernameLike(params.username)
				return [users: users, term: [params.username, ""] ]
			}
		}
		
		def profile = {
			def user = User.findByUsername(params.id)
			def viewUser = authenticateService.userDomain()
			viewUser = User.get(viewUser.id)
			def boolean viewingSelf = (user == viewUser)
			def boolean isFriend = true
			def boolean isFriendRequested = true 
			if (!viewingSelf){
				isFriend = viewUser.friends.contains(user)
			}
			if((!viewingSelf)&&(!isFriend)){
				//isFriendRequested = viewUser.outMessages.contains(Message.findBySentFromAndsentToAndType(viewUser, user, 'friendRequest'))
				isFriendRequested = viewUser.outMessages.contains(Message.findAllBySentFromAndsentTo(viewUser, user))
			}
			
				
			[ 
				user : user, 
				viewUser : viewUser, 
				viewingSelf : viewingSelf,
				isFriend : isFriend,
				isFriendRequested : isFriendRequested 
			]
		}
		
}
