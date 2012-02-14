<html>
	<head>
		<title>Welcome to friendlibrary</title>
		<meta name="layout" content="main" />
  <g:javascript>
    jQuery(document).ready(function(){
      $('.accordion .head').click(function() {
        $(this).next().toggle();
        return false;
      }).next().hide();

      $(function() {
        $( "#accordion" ).accordion({
          autoHeight: false
        });
      });

    });
  </g:javascript>
	</head>
  <body>
    <h1>welcome to friend library</h1>
    <g:if test='${flash.message}'>
      <div class='flash'>${flash.message}</div>
    </g:if>
    <div class="grid_3">&nbsp;</div>
    <div class='highlight-box grid_3'>
      <div class='fheader'>Login...</div>
      <form action='${postUrl}' method='POST' id='loginForm' class='cssform'>
          <!--<label for='j_username'>Username</label><br />-->
          <input type='text' class='text_' name='j_username' id='j_username' value='${request.remoteUser}' placeholder="username"/>
          <!--<label for='j_password'>Password</label><br />-->
          <input type='password' class='text_' name='j_password' id='j_password' placeholder="password" />
          <label for='remember_me'>Remember me</label>
          <input type='checkbox' class='chk' name='_spring_security_remember_me' id='remember_me'
          <g:if test='${hasCookie}'>checked='checked'</g:if>/>
        <!--<p>
          <input type='submit' value='Login' />
        </p>-->
        <button aria-disabled="false" role="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" id="button">
          <span class="ui-button-text">Login</span>
        </button>
      </form>
    </div>
    <div class="highlight-box grid_3">
      <g:hasErrors bean="${person}">
        <div class="errors">
          <g:renderErrors bean="${person}" as="list" />
        </div>
      </g:hasErrors>
      <div class='fheader'>Sign up...</div>
      <g:form action="save">
        <p>
        <!--<label for='username'>Login Name:</label>-->
        <input type="text" name='username' value="${person?.username?.encodeAsHTML()}" placeholder="username" />
        </p>
        <p>
        <!--<label for='passwd'>Password:</label>-->
        <input type="password" name='passwd' value="${person?.passwd?.encodeAsHTML()}" placeholder="password" />
        </p>
        <p>
        <!--<label for='enabled'>Confirm Password:</label>-->
        <input type="password" name='repasswd' value="${person?.passwd?.encodeAsHTML()}" placeholder="confirm password" />
        </p>
        <p>
        <!--<label for='email'>Email:</label>-->
        <input type="text" name='email' value="${person?.email?.encodeAsHTML()}" placeholder="email" />
        </p>
        <p>
        <!--<label for='userFirstName'>First Name:</label>-->
        <input type="text" name='userFirstName' value="${person?.userFirstName?.encodeAsHTML()}" placeholder="first name"/>
        </p>
        <p>
        <!--<label for='userLastName'>Last Name:</label>-->
        <input type="text" name='userLastName' value="${person?.userLastName?.encodeAsHTML()}" placeholder="last name"/>
        </p>
        <p>
        <!--<label for='code' >Enter Code: </label>-->
        <!--<input type="text" name="captcha" size="8" placeholder="code" />-->
        <!--<img src="${createLink(controller:'captcha', action:'index')}" align="absmiddle"/>-->
        </p>
        <!--<div class="buttons">
          <span class="formButton">
            <input class='save' type="submit" value="Create"></input>
          </span>
        </div>-->
        <button aria-disabled="false" role="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" id="button">
          <span class="ui-button-text">Create</span>
        </button>
      </g:form>
    </div>
  </body>
</html>