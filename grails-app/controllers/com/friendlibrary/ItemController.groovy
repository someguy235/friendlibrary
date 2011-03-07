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
    println "add item"
    try{
      def result = itemService.addItem(params)
      flash.message = result
    }catch(ItemException ie){
      flash.message = ie.message
    }
    redirect(controller: 'user', action: 'library', id:params.id)
  }

  def addItemList = {
    try{
      def result = itemService.addItemList(params)
      flash.message = result
    }catch(ItemException ie){
      flash.message = ie.message
    }
    redirect(controller: 'user', action: 'library', id:params.id)
  }

  def deleteItem = {
    println "delete item ${params.requestedMedia}"
    redirect(controller: 'user', action: 'library', id:params.id)
  }

}



