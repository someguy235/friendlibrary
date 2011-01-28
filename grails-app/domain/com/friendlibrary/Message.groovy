package com.friendlibrary

class Message {

	static belongsTo = User
	String sentFrom
	String sentTo
	String body
	String type
  Item item
	
    static constraints = {
      type(inList:["Item Request", "Item Return", "Friend Request", "Item Status", "Item Request Confirm"])
      item(nullable:true)
    }
}
