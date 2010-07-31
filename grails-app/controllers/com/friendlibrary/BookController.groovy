package com.friendlibrary

class BookController extends ItemController{
	def scaffold = true
	def index = {}
	
	def addBook = {
		try{
			itemService.addItem(params)
		}catch(ItemException ie){
			flash.message = ie.message
		}
		redirect(action: 'library', id:params.id)
	}

}
