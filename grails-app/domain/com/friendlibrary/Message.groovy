package com.friendlibrary

class Message {

	User sentTo
	String body
	String type
	
    static constraints = {
		type(inList:["itemRequest", "itemReturn", "friendRequest", "itemStatus", ])
    }
}
