package com.friendlibrary

class Book {
		
		/*General Attributes*/
		static String mediaType = "book"

		String title
		String author
		
		Boolean requested
		Boolean reserved
		Boolean loanedOut
		Integer rating
		User requestedBy
		
		
    static constraints = {
			title(nullable:false)
			author(nullable:true)
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
