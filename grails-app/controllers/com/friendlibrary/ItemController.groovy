package com.friendlibrary

class ItemController {
//		def defaultAction = 'library'
		def itemService
		def scaffold = true
		
		def search = {
		}

		def results = {
			def items = Item.findAllByItemIdLike(params.itemDescription)
			return [ items: items, term: params.itemDescription]
		}

		def library = {
			def user = User.findByUsername(params.id)
			[ user : user ]
		}
    
		def addItem = {
			try{
				def newItem = itemService.addItem(params.username, params.itemDescription, params.mediaType, params.title, params.format, params.author, params.platform)
				flash.message="Added new item: ${newItem.itemDescription}"
			}catch(ItemException ie){
				flash.message = ie.message
			}
			redirect(action: 'library', username:params.username)
		}

		def index = {
			if (!params.id)
				params.id="claptrap"
		redirect(action: 'library', params:params)
		}
}
