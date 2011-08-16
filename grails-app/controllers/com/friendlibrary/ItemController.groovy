package com.friendlibrary

class ItemException extends RuntimeException{
	String message
	Item item
}

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
      flash.message = itemService.addItem(params)
    }catch(ItemException ie){
      flash.message = ie.message
    }
    redirect(controller: 'user', action: 'library', id:params.id)
  }

  def addItemList = {
    try{
      flash.message = itemService.addItemList(params)
    }catch(ItemException ie){
      flash.message = ie.message
    }
    redirect(controller: 'user', action: 'library', id:params.id)
  }

  def deleteItem = {
    try{
      flash.message = itemService.deleteItem(params)
    }catch(ItemException ie){
      flash.message = ie.message
    }
    redirect(controller: 'user', action: 'library', id:params.id)
  }

  def editItem = {
    try{
      flash.message = itemService.editItem(params)
    }catch(ItemException ie){
      flash.message = id.messaage
    }
    redirect(controller: 'user', action: 'library', id:params.id)
  }

}



