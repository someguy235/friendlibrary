package com.friendlibrary

class Message {

	static belongsTo = User
	String sentFrom
	String sentTo
	String body
	String type
	
    static constraints = {
		type(inList:["Item Request", "itemReturn", "Friend Request", "itemStatus", ])
    }
}
