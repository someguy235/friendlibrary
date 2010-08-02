package com.friendlibrary

class ItemController {
		def authenticateService
		def itemService
		//def scaffold = true
		
		def search = {
		}

		def results = {
			def items = Item.findAllByItemIdLike(params.itemDescription)
			return [ items: items, term: params.itemDescription]
		}

		def addItem = {
			try{
				itemService.addItem(params)
			}catch(ItemException ie){
				flash.message = ie.message
			}
			redirect(controller: 'library', action: 'index', id:params.id)
		}

		def index = {
			redirect(action: 'library', params:params)
		}
}



