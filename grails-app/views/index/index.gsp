<html>
	<head>
		<title>Welcome to friendlibrary</title>
		<meta name="layout" content="main" />
	</head>
  <body>
    <h1>welcome to friend library</h1>

    <div id='login'>
      <div class='inner'>
        <g:if test='${flash.message}'>
        <div class='login_message'>${flash.message}</div>
        </g:if>
        <div class='fheader'>Please Login..</div>
        <form action='${postUrl}' method='POST' id='loginForm' class='cssform'>
          <p>
            <label for='j_username'>Login ID</label>
            <input type='text' class='text_' name='j_username' id='j_username' value='${request.remoteUser}' />
          </p>
          <p>
            <label for='j_password'>Password</label>
            <input type='password' class='text_' name='j_password' id='j_password' />
          </p>
          <p>
            <label for='remember_me'>Remember me</label>
            <input type='checkbox' class='chk' name='_spring_security_remember_me' id='remember_me'
            <g:if test='${hasCookie}'>checked='checked'</g:if> />
          </p>
          <p>
            <input type='submit' value='Login' />
          </p>
        </form>
      </div>
    </div>

    <div id="register">
      <g:hasErrors bean="${person}">
        <div class="errors">
          <g:renderErrors bean="${person}" as="list" />
        </div>
      </g:hasErrors>
      <br />
      <g:form action="save">
        <div class="dialog" >
          <div class="highlight-box">
            <table>
              <tbody>
                <tr class='prop'>
                  <td valign='center' class='name'><label for='username'>Login Name:</label></td>
                  <td valign='top' class='value ${hasErrors(bean:person,field:'username','errors')}'>
                    <input type="text" name='username' value="${person?.username?.encodeAsHTML()}"/>
                  </td>
                </tr>

                <tr class='prop'>
                  <td valign='center' class='name'><label for='passwd'>Password:</label></td>
                  <td valign='top' class='value ${hasErrors(bean:person,field:'passwd','errors')}'>
                    <input type="password" name='passwd' value="${person?.passwd?.encodeAsHTML()}"/>
                  </td>
                </tr>

                <tr class='prop'>
                  <td valign='center' class='name'><label for='enabled'>Confirm Password:</label></td>
                  <td valign='top' class='value ${hasErrors(bean:person,field:'passwd','errors')}'>
                    <input type="password" name='repasswd' value="${person?.passwd?.encodeAsHTML()}"/>
                  </td>
                </tr>

                <tr class='prop'>
                  <td valign='center' class='name'><label for='email'>Email:</label></td>
                  <td valign='top' class='value ${hasErrors(bean:person,field:'email','errors')}'>
                    <input type="text" name='email' value="${person?.email?.encodeAsHTML()}"/>
                  </td>
                </tr>

                <tr class='prop'>
                  <td valign='center' class='name'><label for='userFirstName'>First Name:</label></td>
                  <td valign='top' class='value ${hasErrors(bean:person,field:'userFirstName','errors')}'>
                    <input type="text" name='userFirstName' value="${person?.userFirstName?.encodeAsHTML()}"/>
                  </td>
                </tr>

                <tr class='prop'>
                  <td valign='center' class='name'><label for='userLastName'>Last Name:</label></td>
                  <td valign='top' class='value ${hasErrors(bean:person,field:'userLastName','errors')}'>
                    <input type="text" name='userLastName' value="${person?.userLastName?.encodeAsHTML()}"/>
                  </td>
                </tr>

                <tr class='prop'>
                  <td valign='center' class='name'><label for='code' >Enter Code: </label></td>
                  <td valign='top' class='name'>
                    <input type="text" name="captcha" size="8"/>
                    <img src="${createLink(controller:'captcha', action:'index')}" align="absmiddle"/>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
        <br />
        <div class="buttons">
          <span class="formButton">
            <input class='save' type="submit" value="Create"></input>
          </span>
        </div>
      </g:form>
    </div>
  </body>
</html>