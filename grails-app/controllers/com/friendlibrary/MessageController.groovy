package com.friendlibrary

class MessageController {
	def messageService
	def scaffold = true
    def index = { }
	
	def friendRequest = {
		try{
			messageService.friendRequest(params)
		}catch(ItemException ie){
			flash.message = ie.message
		}
		redirect(controller: 'user', action: 'profile', id:params.requestedUser)
	}

	def confirmFriendRequest = {
		try{
			messageService.confirmFriendRequest(params)
		}catch(ItemException ie){
			flash.message = ie.message
		}
		redirect(controller: 'user', action: 'profile', id:params.requestedUser)
	}

	def denyFriendRequest = {
		try{
			messageService.denyFriendRequest(params)
		}catch(ItemException ie){
			flash.message = ie.message
		}
		redirect(controller: 'user', action: 'profile', id:params.requestedUser)
	}

	def removeFriend = {
		try{
			messageService.removeFriend(params)
		}catch(ItemException ie){
			flash.message = ie.message
		}
		redirect(controller: 'user', action: 'profile', id:params.requestedUser)
	}

	def itemRequest = {
		try{
			def result = messageService.itemRequest(params)
      if (result != "success"){
        flash.message = result
      }
		}catch(ItemException ie){
			flash.message = ie.message
		}
		redirect(controller: 'library', action: 'index', id:params.requestedUser)
	}

	def requestReturn = {
		try{
			messageService.requestReturn(params)
		}catch(ItemException ie){
			flash.message = ie.message
		}
		redirect(controller: 'library', action: 'index', id:params.requestedUser)
	}

	def removeRequest = {
		try{
			messageService.removeRequest(params)
		}catch(ItemException ie){
			flash.message = ie.message
		}
		redirect(controller: 'library', action: 'index', id:params.requestedUser)
	}

  def removeAllRequests = {
		try{
			messageService.removeAllRequests(params)
		}catch(ItemException ie){
			flash.message = ie.message
		}
		redirect(controller: 'library', action: 'index', id:params.requestedUser)
	}

  def confirmItemRequest = {
		try{
			messageService.confirmItemRequest(params)
		}catch(ItemException ie){
			flash.message = ie.message
		}
		redirect(controller: 'library', action: 'index', id:params.requestedUser)
	}

}
