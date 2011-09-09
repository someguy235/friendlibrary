/*
 * Item.groovy
 *
 * Contains attributes common to all items.
 *
 * Should not be used directly. Rather, should be extended by the actual item
 * types, such as albums and books.
 *
 */

package com.friendlibrary

class Item {
	
	def searchable = true
		
	/*General Attributes*/
	String title
	Boolean reserved = false
	Boolean loanedOut = false
	Integer rating
	User loanedTo = null
	List requestQueue = []
	
  static constraints = {
    title(nullable:false)
    reserved(nullable:false)
    loanedOut(nullable:false)
    rating(size:1..5, nullable:true)
    loanedTo(nullable:true)
    requestQueue(nullable:false)
  }


  static hasMany = [requestQueue:long]
  
	static belongsTo = [ library : Library ]
  
	static mapping = { sort title:"asc"	}

  static categories(){
    ['all', 'games', 'books', 'movies', 'music']
  }

	String toString(){ "${mediaType}: ${title} (${id})" }
}
