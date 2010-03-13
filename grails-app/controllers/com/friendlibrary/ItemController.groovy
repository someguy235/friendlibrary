package com.friendlibrary

class ItemController {
//		def defaultAction = 'library'
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
    
		def index = {
			if (!params.id)
				params.id="claptrap"
		redirect(action: 'library', params:params)
		}
}
