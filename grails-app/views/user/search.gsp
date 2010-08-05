<html>
<head>
   <title>Search Hubbub</title>
   <meta name="layout" content="main"/>
</head>
	<body>
  	<h1>Search for Friends</h1>
  	<br />
   	<g:form action="results">
   		<label for="username">Username</label>
   		<g:textField name="username" />                            
   		<br />
   		or
   		<br />                            
   		<label for="firstname">First Name</label>
   		<g:textField name="firstname" />                            
   		<br />                            
   		<label for="lastname">Last Name</label>
   		<g:textField name="lastname" />
   		<br />       
   		<button aria-disabled="false" role="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" id="button"><span class="ui-button-text">Search</span></button>                     
   	</g:form>
	</body>
</html>

