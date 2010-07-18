package com.friendlibrary

class Item {
		
		/*General Attributes*/
		String title
		String mediaType //game, book, movie, etc.

		Boolean requested
		Boolean reserved
		Boolean loanedOut
		Integer rating
		User requestedBy
		
		/*Game Attributes*/
		String platform
		
		/*Movie Attributes*/
		String format
		
		/*Book Attributes*/
		String author
		
		/*Music Attributes*/
		String artist
		String genre
		
		
    static constraints = {
			title(nullable:false)
			mediaType(nullable:false) 
			
			requested(nullable:true)
			reserved(nullable:true)
			loanedOut(nullable:true)
			rating(size:1..5, nullable:true)
			requestedBy(nullable:true)
			
			platform(nullable:true)

			format(nullable:true)
			
			author(nullable:true)
			
			artist(nullable:true)
			genre(nullable:true)
    }

	static belongsTo = [ user : User ] 

	static mapping = {
	  sort title:"asc"
	}

	String toString(){
	  "${mediaType}: ${title} (${id})"
	}
}
