package com.friendlibrary

class Library {

  static belongsTo = [ user:User ]
    
  static hasMany = [ books:Book, games:Game, albums:Album, movies:Movie ]
  HashMap available = ["books": 0, "games": 0, "albums": 0, "movies": 0]

  static constraints = {
  }
}
