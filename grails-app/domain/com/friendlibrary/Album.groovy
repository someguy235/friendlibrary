/*
 * Album.groovy
 *
 * Extends the Item.groovy domain to create an Album object
 *
 */

package com.friendlibrary

class Album extends Item {

	def searchable = true

  String mediaType = "album"
	String artist
	String genre
	String format

	static constraints = {
    mediaType(nullable:false)
    artist(nullable:false)
    genre(nullable:true)
    format(nullable:false)
	}
}
