package com.friendlibrary

class Message {

	static belongsTo = User
	User sentFrom
	User sentTo
	String body
	String type
	
    static constraints = {
		type(inList:["itemRequest", "itemReturn", "friendRequest", "itemStatus", ])
    }
}
