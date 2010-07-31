package com.friendlibrary

class Movie extends Item{
		static String mediaType = "movie"
		String format
    static constraints = {
			format(nullable:true)
    }
}
