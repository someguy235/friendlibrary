package com.friendlibrary

class Message {

	//static belongsTo = User
	User sentFrom
	User sentTo
	String body
	String type
  Item item
	
    static constraints = {
      type(inList:[
        "Friend Request",
        "Item Request",
        "Item Request Confirm",
        "Item Return Return"
      ])
      item(nullable:true)
    }
}
