package com.friendlibrary

class MessageException extends RuntimeException{
	String message
	//Item item
}

class MessageService {

    static transactional = true
	
	void addItem(params){
		
	}
	void friedRequest(params){
		System.out.println(params) 
		
	}
    //def serviceMethod() {}
}
