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
}
