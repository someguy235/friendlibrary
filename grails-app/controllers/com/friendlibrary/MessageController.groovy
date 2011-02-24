package com.friendlibrary

//class MessageException extends RuntimeException{
//	String messageString
//	Message message
//}

class MessageController {
	def messageService
	def scaffold = true
  def redirectId

  def index = { }

  /*
  // User relationship controller actions
  */
	def makeFriendRequest = {
		try{
			messageService.makeFriendRequest(params)
		}catch(Exception ie){
			flash.message = ie.message
		}
		redirect(controller: 'user', action: 'profile', id:params.requestedUserId)
	}

  def removeFriendRequest = {
    try{
      messageService.removeFriendRequest(params)
    }catch(ItemException ie){
			flash.message = ie.message
		}
    redirect(controller: 'user', action: 'profile', id:params.requestedUserId)
  }
  
  def denyFriendRequest = {
		try{
      redirectId = Message.get(params.messageId).sentTo.id
      messageService.denyFriendRequest(params)
		}catch(ItemException ie){
			flash.message = ie.message
		}
		redirect(controller: 'user', action: 'profile', id:redirectId)
	}

	def confirmFriendRequest = {
		try{
      redirectId = Message.get(params.messageId).sentTo.id
			messageService.confirmFriendRequest(params)
		}catch(ItemException ie){
			flash.message = ie.message
		}
		redirect(controller: 'user', action: 'profile', id:redirectId)
	}

	def removeFriend = {
		try{
			messageService.removeFriend(params)
		}catch(ItemException ie){
			flash.message = ie.message
		}
		redirect(controller: 'user', action: 'profile', id:params.requestedUserId)
	}

  /*
  // Item related actions
  */
	def makeItemRequest = {
		try{
			def result = messageService.makeItemRequest(params)
      if (result != "success"){
        flash.message = result
      }
		}catch(ItemException ie){
			flash.message = ie.message
		}
		redirect(controller: 'user', action: 'library', id:params.requestedUser)
	}

  def denyItemRequest = {
		try{
			messageService.denyItemRequest(params)
		}catch(ItemException ie){
			flash.message = ie.message
		}
		redirect(controller: 'user', action: 'profile', id:params.requestedUser)
	}

  def removeItemRequest = {
		try{
			messageService.removeItemRequest(params)
		}catch(ItemException ie){
			flash.message = ie.message
		}
		redirect(controller: 'user', action: 'library', id:params.requestedUser)
	}

  def removeAllItemRequests = {
		try{
			messageService.removeAllItemRequests(params)
		}catch(ItemException ie){
			flash.message = ie.message
		}
		redirect(controller: 'user', action: 'library', id:params.requestedUser)
	}

	def requestItemReturn = {
		try{
			messageService.requestItemReturn(params)
		}catch(ItemException ie){
			flash.message = ie.message
		}
		redirect(controller: 'user', action: 'library', id:params.requestedUser)
	}
  
  //TODO: is this needed?
  /*
  def confirmItemRequest = {
		try{
			messageService.confirmItemRequest(params)
		}catch(ItemException ie){
			flash.message = ie.message
		}
		redirect(controller: 'user', action: 'profile', id:params.requestedUser)
	}
  */
 
  /*
  // Generic message actions
  */
  def dismissMessage = {
		try{
			messageService.dismissMessage(params)
		}catch(ItemException ie){
			flash.message = ie.message
		}
		redirect(controller: 'user', action: 'profile', id:params.requestedUser)
	}
}
