/*
 * Book.groovy
 *
 * Extends the Item.groovy domain to create a Book object
 *
 */

package com.friendlibrary

class Book extends Item {

	def searchable = true

	String mediaType = "book"
	String author

  static constraints = {
    mediaType(nullable:false)
    author(nullable:true)
  }
}
