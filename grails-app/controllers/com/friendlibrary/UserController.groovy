package com.friendlibrary

class UserController {
  def scaffold = true
  def authenticateService

  def search = {}

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
    def user = User.get(params.id)
    def viewUser = authenticateService.userDomain()
    viewUser = User.get(viewUser.id)
    def boolean viewingSelf = (user == viewUser)
    def boolean isFriend = true
    def boolean isFriendRequested = true
    if (!viewingSelf){
      isFriend = viewUser.friends.contains(user)
    }
    if((!viewingSelf)&&(!isFriend)){
      isFriendRequested = user.inMessages.find{
        (it.type == 'Friend Request')&&(it.sentFrom.username == viewUser.username)
      }
    }
				
    [
      user : user,
      viewUser : viewUser,
      viewingSelf : viewingSelf,
      isFriend : isFriend,
      isFriendRequested : isFriendRequested
    ]
  }

  def library = {
    def libUser = User.get(params.id)
    def viewUser = authenticateService.userDomain()
    viewUser = User.get(viewUser.id)
    def userLib = Library.find("from Library as l where \
                                  l.name = :name and \
                                  l.user.id = :userid",
                                  [name:"owned", userid:libUser.id]
                                )
    def borrowLib = Library.find("from Library as l where \
                                  l.name = :name and \
                                  l.user.id = :userid",
                                  [name:"borrowed", userid:libUser.id]
                                )
    def allItems = ['music':userLib.albums, 'books':userLib.books, 'games':userLib.games, 'movies':userLib.movies]
    def borrowedItems = ['music':borrowLib.albums, 'books':borrowLib.books, 'games':borrowLib.games, 'movies':borrowLib.movies]
    def boolean viewingSelf = (libUser == viewUser)
    [ user : libUser, viewUser:viewUser, viewingSelf : viewingSelf, allItems:allItems, borrowedItems:borrowedItems ]
  }
}
