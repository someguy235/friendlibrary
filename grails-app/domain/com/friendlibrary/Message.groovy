/*
 * Message.groovy
 *
 * Message domain class
 *
 * User for sending requests, notifications, etc.
 *
 */

package com.friendlibrary

class Message {

	User sentFrom
	User sentTo
	String body
	String type
  Item item
	
  static constraints = {
    sentFrom(nullable:false)
    sentTo(nullable:false)
    body(nullable:false)
    type(inList:[
      "Friend Request",
      "Item Request",
      "Item Request Confirm",
      "Item Return Request",
      "Item Return Confirm"
    ])
    item(nullable:true)
  }
}
