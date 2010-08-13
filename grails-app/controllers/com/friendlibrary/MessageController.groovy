package com.friendlibrary

class MessageController {
	def messageService

    def index = { }
	
	def friendRequest = {
		try{
			messageService.friendRequest(params)
		}catch(ItemException ie){
			flash.message = ie.message
		}
		redirect(controller: 'user', action: 'profile', id:params.id)
	}
}
