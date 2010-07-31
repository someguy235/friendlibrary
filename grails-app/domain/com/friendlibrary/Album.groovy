package com.friendlibrary

class Album extends Item {
		static String mediaType = "album"
		String artist
		String genre
    static constraints = {
			artist(nullable:true)
			genre(nullable:true)
    }
}
