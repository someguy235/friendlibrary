package com.friendlibrary

abstract class Item {
		
		/*General Attributes*/
		String title
		//String mediaType //game, book, movie, etc.

		Boolean requested = false
		Boolean reserved = false
		Boolean loanedOut = false
		Integer rating
		User requestedBy
		
    static constraints = {
			title(nullable:false)
			
			requested(nullable:true)
			reserved(nullable:true)
			loanedOut(nullable:true)
			rating(size:1..5, nullable:true)
			requestedBy(nullable:true)
    }

	//static belongsTo = [ user : User ]
	static belongsTo = [ library : Library ]

	static mapping = {
	  sort title:"asc"
	}

	String toString(){
	  "${mediaType}: ${title} (${id})"
	}
}
