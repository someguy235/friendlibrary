package com.friendlibrary

class Game {
		
		/*General Attributes*/
		static String mediaType = "game"

		String title
		String platform
		Boolean requested
		Boolean reserved
		Boolean loanedOut
		Integer rating
		User requestedBy
		
		
    static constraints = {
			title(nullable:false)
			platform(nullable:true)
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
