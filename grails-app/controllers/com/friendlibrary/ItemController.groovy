package com.friendlibrary

class ItemController {
//		def defaultAction = 'library'
		def authenticateService
		def itemService
		def scaffold = true
		
		def search = {
		}

		def results = {
			def items = Item.findAllByItemIdLike(params.itemDescription)
			return [ items: items, term: params.itemDescription]
		}

		def library = {
			//def user = User.findByUsername(params.id)
			def user = authenticateService.userDomain()
			user = User.get(user.id)
			[ user : user ]
		}
    
		def addItem = {
			try{
				//render (params)
				//def newItem = itemService.addItem(params.id, params.itemDescription, params.mediaType, params.title, params.format, params.author, params.platform)
				//def newItem = itemService.addItem(params)
				itemService.addItem(params)
				//render newItem.toString() 
				//flash.message="Added new item: ${newItem.itemDescription}"
			}catch(ItemException ie){
				flash.message = ie.message
			}
			redirect(action: 'library', id:params.id)
		}

		def index = {
			if (!params.id)
				params.id="claptrap"
		redirect(action: 'library', params:params)
		}
}
