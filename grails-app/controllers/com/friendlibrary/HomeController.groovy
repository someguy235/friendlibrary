package com.friendlibrary

//This stuff copied from Spring Security's Login Controller
import grails.converters.JSON
/*
import javax.servlet.http.HttpServletResponse
*/
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
/*
import org.springframework.security.authentication.AccountExpiredException
import org.springframework.security.authentication.CredentialsExpiredException
import org.springframework.security.authentication.DisabledException
import org.springframework.security.authentication.LockedException
import org.springframework.security.core.context.SecurityContextHolder as SCH
import org.springframework.security.web.WebAttributes
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter
*/
// End copied imports


class HomeController {

  /**
  * Dependency injection for the authenticationTrustResolver.
  */
  def authenticationTrustResolver

  /**
  * Dependency injection for the springSecurityService.
  */
  def springSecurityService

  def index() {
    if(springSecurityService.isLoggedIn()){
      def viewUser = springSecurityService.currentUser
      viewUser = User.get(viewUser.id)
      return [viewUser:viewUser]
    }else{
      def config = SpringSecurityUtils.securityConfig
      String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
      return [postUrl:postUrl]
    }
  }
}
