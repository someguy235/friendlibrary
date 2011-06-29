/*
 *  Role.groovy
 *
 *  Authority domain class.
 *  
 */

package com.friendlibrary

class Role {

	static hasMany = [people: User]

	String description
	String authority

	static constraints = {
		authority(nullable:false, blank: false, unique: true)
		description(nullable:true)
	}
}
