package com.friendlibrary

import org.codehaus.groovy.grails.plugins.springsecurity.RedirectUtils
import org.grails.plugins.springsecurity.service.AuthenticateService

import org.springframework.security.AuthenticationTrustResolverImpl
import org.springframework.security.DisabledException
import org.springframework.security.context.SecurityContextHolder as SCH
import org.springframework.security.ui.AbstractProcessingFilter
import org.springframework.security.ui.webapp.AuthenticationProcessingFilter
import org.springframework.security.providers.UsernamePasswordAuthenticationToken as AuthToken

import com.friendlibrary.User
import com.friendlibrary.Role

class IndexController {

  def daoAuthenticationProvider
	def emailerService

	static Map allowedMethods = [save: 'POST', update: 'POST']

  /**
	 * Dependency injection for the authentication service.
	 */
	def authenticateService

	/**
	 * Dependency injection for OpenIDConsumer.
	 */
	def openIDConsumer

	/**
	 * Dependency injection for OpenIDAuthenticationProcessingFilter.
	 */
	def openIDAuthenticationProcessingFilter

	private final authenticationTrustResolver = new AuthenticationTrustResolverImpl()

	def scaffold = false
	
  def index = {
    def session = request.session
		def viewUser = authenticateService.userDomain()
		viewUser = User.get(viewUser?.id)

    nocache response

    if(authenticateService.isLoggedIn()){
      redirect (controller:'user', action:'library', id:viewUser.id, params:params, viewUser:viewUser)
    }else{
      def config = authenticateService.securityConfig.security
      String postUrl = "${request.contextPath}${config.filterProcessesUrl}"
      render view:'index', model :[postUrl:postUrl, viewUser:viewUser]
      
    }
	}

  /**
	 * Person save action.
	 */
	def save = {

		// skip if already logged in
		if (authenticateService.isLoggedIn()) {
			redirect action: show
			return
		}

		def person = new User()
		person.properties = params

		def config = authenticateService.securityConfig
		def defaultRole = config.security.defaultRole

		def role = Role.findByAuthority(defaultRole)
		if (!role) {
			person.passwd = ''
			flash.message = 'Default Role not found.'
			render view: 'index', model: [person: person]
			return
		}

		if (params.captcha.toUpperCase() != session.captcha) {
			person.passwd = ''
			flash.message = 'Access code did not match.'
      println "params: "+ params.captcha
      println "session: "+ session.captcha
//			render view: 'index', model: [person: person]
      render view: 'index'
			return
		}

		if (params.passwd != params.repasswd) {
			person.passwd = ''
			flash.message = 'The passwords you entered do not match.'
//			render view: 'index', model: [person: person]
      render view: 'index'
			return
		}

		def pass = authenticateService.encodePassword(params.passwd)
		person.passwd = pass
		person.enabled = true
    person.library = new com.friendlibrary.Library()
		if (person.save()) {
			role.addToPeople(person)
			if (config.security.useMail) {
				String emailContent = """
          You have signed up for an account at:
          ${request.scheme}://${request.serverName}:${request.serverPort}${request.contextPath}
          Here are the details of your account:
          -------------------------------------
          LoginName: ${person.username}
          Email: ${person.email}
          Full Name: ${person.userFirstName} ${person.userLastName}
          Password: ${params.passwd}
        """

				def email = [
					to: [person.email], // 'to' expects a List, NOT a single email address
					subject: "[${request.contextPath}] Account Signed Up",
					text: emailContent // 'text' is the email body
				]
				emailerService.sendEmails([email])
			}

			person.save(flush: true)

			def auth = new AuthToken(person.username, params.passwd)
			def authtoken = daoAuthenticationProvider.authenticate(auth)
			SCH.context.authentication = authtoken
			redirect uri: '/'


		}else {
			person.passwd = ''
      println "person not saved"
//			render view: 'index', model: [person: person]
      render view: 'index'

		}
	}

  def show = {

		// get user id from session's domain class.
		def user = authenticateService.userDomain()
		if (user) {
			render view: 'show', model: [person: User.get(user.id)]
		}
		else {
			redirect action: index
		}
	}

  /** cache controls */
	private void nocache(response) {
		response.setHeader('Cache-Control', 'no-cache') // HTTP 1.1
		response.addDateHeader('Expires', 0)
		response.setDateHeader('max-age', 0)
		response.setIntHeader ('Expires', -1) //prevents caching at the proxy server
		response.addHeader('cache-Control', 'private') //IE5.x only
	}
}
