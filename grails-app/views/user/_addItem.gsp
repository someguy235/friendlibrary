
<%@ page contentType="text/html;charset=UTF-8" %>
<div class="import_box grid_6"> <!-- add single item -->
  <div class="ui-tabs ui-widget ui-widget-content ui-corner-all" id="newItemTabs">
    <ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
      <li class="ui-state-default ui-corner-top ui-tabs-selected ui-state-active"><a href="#newItemTabs-game">Game</a></li>
      <li class="ui-state-default ui-corner-top"><a href="#newItemTabs-book">Book</a></li>
      <li class="ui-state-default ui-corner-top"><a href="#newItemTabs-movie">Movie</a></li>
      <li class="ui-state-default ui-corner-top"><a href="#newItemTabs-music">Music</a></li>
    </ul>

    <div class="ui-tabs-panel ui-widget-content ui-corner-bottom" id="newItemTabs-game">
      <form ng-submit="addItem('game')">
        <table>
          <tr><td><label for="title">Title&nbsp;</label></td><td><g:textField ng-model="gameTitle" id="title" name="title"/></td></tr>
          <tr><td><label for="platform">Platform&nbsp;</label></td>
            <td><div class="ui-widget"><select ng-model="gamePlatforms.platform" ng-options="g for g in gamePlatforms"></select></div></td>
          </tr>
        </table><br />
        <button aria-disabled="false" role="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" id="button"><span class="ui-button-text">Add Item</span></button>
      </form>
    </div>

    <div class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide" id="newItemTabs-book">
      <form ng-submit="addItem('book')">
        <table>
          <tr><td><label for="title">Title&nbsp;</label></td><td><g:textField ng-model="bookTitle" id="title" name="title"/></td></tr>
          <tr><td><label for="author">Author&nbsp;</label></td><td><g:textField ng-model="bookAuthor" id="author" name="author"/></td></tr>
        </table><br />
        <button aria-disabled="false" role="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" id="button"><span class="ui-button-text">Add Item</span></button>
      </form>
    </div>

    <div class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide" id="newItemTabs-movie">
      <form ng-submit="addItem('movie')">  
        <table>
          <tr><td><label for="title">Title&nbsp;</label></td><td><g:textField ng-model="movieTitle" id="title" name="title"/></td></tr>
          <tr><td><label for="format">Format&nbsp;</label></td>
            <td><div class="ui-widget"><select ng-model="movieFormats.format" ng-options="a for a in movieFormats"></select></div></td>
          </tr>
        </table><br />
        <input type="hidden" id="mediaType" name="mediaType" value="movie" />
        <button aria-disabled="false" role="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" id="button"><span class="ui-button-text">Add Item</span></button>
      </form>
    </div>


    <div class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide" id="newItemTabs-music">
      <form ng-submit="addItem('album')">
        <table>
          <tr><td><label for="title">Title&nbsp;</label></td><td><g:textField ng-model="albumTitle" id="title" name="title"/></td></tr>
          <tr><td><label for="artist">Artist&nbsp;</label></td><td><g:textField ng-model="albumArtist" id="artist" name="artist"/></td></tr>
          <tr><td><label for="format">Format&nbsp;</label></td>
            <td><div class="ui-widget"><select ng-model="albumFormats.format" ng-options="a for a in albumFormats"></select></div></td>
          </tr>
        </table><br />
        <input type="hidden" id="mediaType" name="mediaType" value="album" />
        
        <button aria-disabled="false" role="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" id="button"><span class="ui-button-text">Add Item</span></button>
      <form>
    </div>

  </div>
</div>