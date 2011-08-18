/*
 * Game.groovy
 *
 * Extends the Item.groovy domain to create a Game object
 *
 */

package com.friendlibrary

class Game extends Item{

	def searchable = true

  String mediaType = "game"
	String platform
  static platforms(){
    ["PS3", "XBox360", "Wii", "Other"]
  }

  static constraints = {
    mediaType(nullable:false)
    platform(nullable:false, inList: platforms())
  }
}
