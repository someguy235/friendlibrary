package com.friendlibrary

import grails.converters.JSON

class ItemException extends RuntimeException{
	String message
	Item item
}

class ItemController {
//  def authenticateService
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
    def params = JSON.parse(request.reader.text)
    try{
      flash.message = itemService.addItem(params)
    }catch(ItemException ie){
      flash.message = ie.message
    }
    def items = [
          'username': User.get(params.user).username,
          'library' : itemService.getLibraryItems(params.user.toLong()),
          'borrowed': itemService.getBorrowedItems(params.user.toLong())
        ] 
    render items as JSON
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
    def params = JSON.parse(request.reader.text)
    try{
      flash.message = itemService.editItem(params)
    }catch(ItemException ie){
      flash.message = ie.messaage
    }
    def items = [
          'username': User.get(params.user).username,
          'library' : itemService.getLibraryItems(params.user.toLong()),
          'borrowed': itemService.getBorrowedItems(params.user.toLong())
        ] 
    render items as JSON
  }

}



