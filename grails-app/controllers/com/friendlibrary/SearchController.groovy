package com.friendlibrary

class SearchController {
  def authenticateService

  def index = { }
	
	def search = {
    def viewUser = authenticateService.userDomain()
		viewUser = User.get(viewUser?.id)
    //def viewUser = User.get(authenticateService.userDomain().id)
    [ viewUser : viewUser ]
  }
}
