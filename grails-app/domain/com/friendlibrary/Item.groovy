package com.friendlibrary

class Item {
		
		String itemId
		String title
		String author
		String platform
		String format

		String mediaType
		Boolean loanedOut
		Boolean reserved
		Integer rating
		Boolean requested
		User requestedBy
//		User ownedBy

    static constraints = {
		  itemId(nullable:false, unique:true)
			mediaType(nullable:false) 
			format(nullable:true)
			title(nullable:false)
			author(nullable:true)
			platform(nullable:true)
			rating(size:1..5, nullable:true)
			requested(nullable:true)
			requestedBy(nullable:true)
			reserved(nullable:true)
			loanedOut(nullable:true)
//			ownedBy(nullable:false)
    }

		static belongsTo = [ user : User ] 

		static mapping = {
			sort title:"asc"
		}

		String toString(){
			"${title} (${id})"
		}
}
