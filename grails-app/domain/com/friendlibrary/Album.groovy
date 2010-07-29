package com.friendlibrary

class Album {
		
		/*General Attributes*/
		static String mediaType = "album"

		String title
		String artist
		String genre
		
		Boolean requested
		Boolean reserved
		Boolean loanedOut
		Integer rating
		User requestedBy
		
		
    static constraints = {
			title(nullable:false)
			artist(nullable:true)
			genre(nullable:true)
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
