package com.friendlibrary

class ItemController {
  def authenticateService
  def itemService
  //def scaffold = true
		
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
		
  def addItem = {
    try{
      itemService.addItem(params)
    }catch(ItemException ie){
      flash.message = ie.message
    }
    redirect(controller: 'user', action: 'library', id:params.id)
  }

  //		def index = {
  //			redirect(action: 'library', params:params)
  //		}
}



