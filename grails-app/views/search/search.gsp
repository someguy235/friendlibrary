<html>
<head>
   <title>Search Hubbub</title>
   <meta name="layout" content="main"/>
</head>
	<body>
  	<h1>Search for Friends</h1>
  	<br />
  	<div class="search_column profile_column_left"></div>
   	<g:form controller="user" action="results">
   		<div class="searchBox search_column">
	   		<div class="searchLabel"><label for="username">Username</label></div>
	   		<div class="searchField"><g:textField name="username" /></div>
	   		<div class="clear"></div>                            
	   		<div class="searchLabel"><label for="email">Email</label></div>
	   		<div class="searchField"><g:textField name="email" /></div>
	   		<div class="clear"></div>                            
	   		<div class="searchLabel"><label for="firstname">First Name</label></div>
	   		<div class="searchField"><g:textField name="firstname" /></div>                            
	   		<div class="clear"></div>                            
	   		<div class="searchLabel"><label for="lastname">Last Name</label></div>
	   		<div class="searchField"><g:textField name="lastname" /></div>
	   		<br />
	   		<div class="clear"></div>       
	   		<br />
	   		<button aria-disabled="false" role="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" id="button"><span class="ui-button-text">Search</span></button>                     
	   		<br />
   		</div>
   	</g:form>
   	<div class="clear"></div>
   	<br />
   	<h1>Search for Items</h1>
   	<br />
   	<g:form controller="item" action="results">


	   	<button aria-disabled="false" role="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" id="button"><span class="ui-button-text">Search</span></button>
   	</g:form>
	</body>
</html>

