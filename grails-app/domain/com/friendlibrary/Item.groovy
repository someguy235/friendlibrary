package com.friendlibrary

class Item {
	
	def searchable = true
		
	/*General Attributes*/
	String title
	Boolean reserved = false
	Boolean loanedOut = false
	Integer rating
  User ownedBy
	User loanedTo
	List requestQueue = []
	
    static constraints = {
      title(nullable:false)
      reserved(nullable:true)
      loanedOut(nullable:true)
      rating(size:1..5, nullable:true)
      loanedTo(nullable:true)
      requestQueue(nullable:true)
    }

	static belongsTo = [ library : Library ]
  
	static mapping = {
	  sort title:"asc"
	}

	String toString(){
	  "${mediaType}: ${title} (${id})"
	}
}
