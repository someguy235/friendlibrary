package com.friendlibrary

class Game extends Item{
		static String mediaType = "game"
		String platform
    static constraints = {
			platform(nullable:true)
    }
}
