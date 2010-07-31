package com.friendlibrary

class Book extends Item {
		static String mediaType = "book"
		String author
    static constraints = {
			author(nullable:false)
    }
}
