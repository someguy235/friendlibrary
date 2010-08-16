package com.friendlibrary

class Message {

	static belongsTo = User
	String sentFrom
	String sentTo
	String body
	String type
	
    static constraints = {
		type(inList:["itemRequest", "itemReturn", "Friend Request", "itemStatus", ])
    }
}
