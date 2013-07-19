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
    <div id="welcome_box" class="grid_12">
      <p><span id="welcome_title">Welcome to Friendly Library!</span></p>
      <br />
      <p>Who did you lend <i>The Hunger Games</i> to? Does anyone I know have a copy of <i>This is Spinal Tap</i>? 
      Friendly Library helps you coordinate borrowing and lending books, movies, and games. Never lose track
      of who has your stuff, and easily search for the things you want to borrow among all your friends.</p>
      <br />
      <p>To get started, log in or sign up, or take the tour.</p>
      
    </div>
    
    <g:if test='${flash.message}'>
      <div class='grid_12 flash'>${flash.message}</div>
    </g:if>

    <div class="grid_3">&nbsp;</div>

    <div class='highlight-box grid_3'>
      <h3>Login...</h3>
      <form action='${postUrl}' method='POST' id='loginForm' class='cssform'>
          <label for='j_username'>Username</label><br />
          <input type='text' class='text_' name='j_username' id='j_username' value='${request.remoteUser}'/>
          <label for='j_password'>Password</label><br />
          <input type='password' class='text_' name='j_password' id='j_password' />
<!--          <label for='remember_me'>Remember me</label>
          <input type='checkbox' class='chk' name='_spring_security_remember_me' id='remember_me'
          <g:if test='${hasCookie}'>checked='checked'</g:if>/>-->
        <div class="login_button">
          <button aria-disabled="false" role="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" id="button">
            <span class="ui-button-text">Login</span>
          </button>
        </div>
      </form>
    </div>

    <div class="highlight-box grid_3">
      <g:hasErrors bean="${person}">
        <div class="errors">
          <g:renderErrors bean="${person}" as="list" />
        </div>
      </g:hasErrors>
      <h3>...or sign up</h3>
      <g:form action="save">
        <label for='username'>Login Name:</label>
        <input type="text" name='username' value="${person?.username?.encodeAsHTML()}" />
        <label for='passwd'>Password:</label>
        <input type="password" name='passwd' value="${person?.passwd?.encodeAsHTML()}" />
        <label for='enabled'>Confirm Password:</label>
        <input type="password" name='repasswd' value="${person?.passwd?.encodeAsHTML()}" />
        <label for='email'>Email:</label>
        <input type="text" name='email' value="${person?.email?.encodeAsHTML()}" />
        <label for='userFirstName'>First Name:</label>
        <input type="text" name='userFirstName' value="${person?.userFirstName?.encodeAsHTML()}" />
        <label for='userLastName'>Last Name:</label>
        <input type="text" name='userLastName' value="${person?.userLastName?.encodeAsHTML()}" />
        <!--<label for='code' >Enter Code: </label>-->
        <!--<input type="text" name="captcha" size="8" placeholder="code" />-->
        <!--<img src="${createLink(controller:'captcha', action:'index')}" align="absmiddle"/>-->
        <div class="login_button">
          <button aria-disabled="false" role="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" id="button">
            <span class="ui-button-text">Create</span>
          </button>
        </div>
      </g:form>
    </div>
    <div class="grid_3">&nbsp;</div>

  </body>
</html>