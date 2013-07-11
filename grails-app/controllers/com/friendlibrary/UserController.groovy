package com.friendlibrary

import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import grails.plugins.springsecurity.Secured
import grails.converters.JSON

class UserController {
  def scaffold = true
  //def authenticateService
  def authenticationTrustResolver

  def springSecurityService
  def itemService

  def search = {
    def viewUser = User.get(authenticateService.userDomain().id)

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
		
  @Secured(['IS_AUTHENTICATED_REMEMBERED'])
  def profile = {
    def viewUser = User.get(springSecurityService.currentUser.id)

    def user = User.get(params.id)
    def boolean viewingSelf = (user == viewUser)
    def boolean isFriend = true
    def boolean isFriendRequested = false
    def boolean isRequestingFriend = false
    if (!viewingSelf){
      isFriend = viewUser.friends.contains(user)
    }
    if((!viewingSelf)&&(!isFriend)){
      isFriendRequested = user.inMessages.find{
        (it.type == 'Friend Request')&&(it.sentFrom.username == viewUser.username)
      }
      isRequestingFriend = viewUser.inMessages.find{
        (it.type == 'Friend Request')&&(it.sentFrom.username == user.username)
      }
    }

    return [ 
      user : user,
      viewUser : viewUser,
      viewingSelf : viewingSelf,
      isFriend : isFriend,
      isFriendRequested : isFriendRequested,
      isRequestingFriend : isRequestingFriend
    ]
  }

  @Secured(['IS_AUTHENTICATED_REMEMBERED'])
  def library = {
    println "library params"+ params
//    println(params.id)
    def viewUser = User.get(springSecurityService.currentUser.id)
    def libUser = User.get(params.id)
    def boolean viewingSelf = (libUser == viewUser)
    def userLib = libUser.library
    //def libraryItems = ['music':userLib.albums, 'books':userLib.books, 'games':userLib.games, 'movies':userLib.movies]
    def libraryItems = itemService.getLibraryItems(params.id.toLong()) as JSON
    def borrowedItems = itemService.getBorrowedItems(params.id.toLong()) as JSON
    def itemCategories = Item.categories() as JSON
    def gamePlatforms = Game.platforms() as JSON
    def movieFormats = Movie.formats() as JSON
    def albumFormats = Album.formats() as JSON

    withFormat{
      html { 
        return [ 
          user : libUser,
          viewUser : viewUser,
          viewingSelf : viewingSelf,
          libraryItems : libraryItems,
          borrowedItems : borrowedItems,
          itemCategories : itemCategories,
          gamePlatforms : gamePlatforms,
          movieFormats : movieFormats,
          albumFormats : albumFormats
        ]
      }
      json { 
        def items = [
          'username': libUser.username,
          'libraryItems' : libraryItems,
          'borrowedItems': borrowedItems
        ] 
        render items as JSON
      }
    }   
  }
}
