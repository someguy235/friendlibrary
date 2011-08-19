/*
 * Movie.groovy
 *
 * Extends the Item.groovy domain to create a Movie object
 *
 */

package com.friendlibrary

class Movie extends Item{

	def searchable = true

	String mediaType = "movie"
	String format
  static formats(){
    ["DVD", "BluRay", "VHS", "File", "Other"]
  }

  static constraints = {
    mediaType(nullable:false)
    format(nullable:false, inList: formats())
  }
}
