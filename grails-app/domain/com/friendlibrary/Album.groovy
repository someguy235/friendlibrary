package com.friendlibrary

class Album extends Item {
	static String mediaType = "album"
	String artist
	String genre
	String format
	static constraints = {
		genre(nullable:true)
	}
}
