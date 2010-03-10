package com.friendlibrary

class ItemController {
		def scaffold = true
		
		def search = {
		}

		def results = {
			def items = Item.findAllByItemIdLike(params.itemId)
			return [ items: items, term: params.itemId]
		}
//    def index = { }
}
