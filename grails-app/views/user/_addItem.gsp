
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
      <g:form controller="item" action="addItem" id="${user.id}">
        <table>
          <tr>
            <td><label for="title">Title&nbsp;</label></td>
            <td><g:textField id="title" name="title"/></td>
          </tr>
          <tr>
            <g:set var="platforms" value="${gamePlatforms}" />
            <td><label for="platform">Platform&nbsp;</label></td>
            <td>
              <div class="ui-widget">
                <g:select from="${platforms}" name="platform" class="ui-button ui-widget-content ui-state-default ui-corner-all"></g:select>
              </div>
            </td>
          </tr>
        </table>
        <br />
        <input type="hidden" id="mediaType" name="mediaType" value="game" />
        <button aria-disabled="false" role="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" id="button"><span class="ui-button-text">Add Item</span></button>
      </g:form>
    </div>

    <div class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide" id="newItemTabs-book">
      <g:form controller="item" action="addItem" id="${user.id}">
        <table>
          <tr>
            <td><label for="title">Title&nbsp;</label></td>
            <td><g:textField id="title" name="title"/></td>
          </tr>
          <tr>
            <td><label for="author">Author&nbsp;</label></td>
            <td><g:textField id="author" name="author"/></td>
          </tr>
        </table>
        <br />
        <input type="hidden" id="mediaType" name="mediaType" value="book" />
        <button aria-disabled="false" role="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" id="button"><span class="ui-button-text">Add Item</span></button>
      </g:form>
    </div>

    <div class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide" id="newItemTabs-movie">
      <g:form controller="item" action="addItem" id="${user.id}">
        <table>
          <tr>
            <td><label for="title">Title&nbsp;</label></td>
            <td><g:textField id="title" name="title"/></td>
          </tr>
          <tr>
            <g:set var="formats" value="${['DVD', 'BlueRay', 'VHS', 'File']}" />
            <td><label for="format">Format&nbsp;</label></td>
            <td>
              <div class="ui-widget">
                <g:select from="${formats}" value="DVD" name="format" class="ui-button ui-widget-content ui-state-default ui-corner-all"></g:select>
              </div>
            </td>
          </tr>
        </table>
        <br />
        <input type="hidden" id="mediaType" name="mediaType" value="movie" />
        <button aria-disabled="false" role="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" id="button"><span class="ui-button-text">Add Item</span></button>
      </g:form>
    </div>


    <div class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide" id="newItemTabs-music">
      <g:form controller="item" action="addItem" id="${user.id}">
        <table>
          <tr>
            <td><label for="title">Title&nbsp;</label></td>
            <td><g:textField id="title" name="title"/></td>
          </tr>
          <tr>
            <td><label for="artist">Artist&nbsp;</label></td>
            <td><g:textField id="artist" name="artist"/></td>
          </tr>
          <tr>
            <g:set var="formats" value="${['File', 'CD']}" />
            <td><label for="format">Format&nbsp;</label></td>
            <td>
              <div class="ui-widget">
                <g:select from="${formats}" value="File" name="format" class="ui-button ui-widget-content ui-state-default ui-corner-all"></g:select>
              </div>
            </td>
          </tr>
        </table>
        <br />
        <input type="hidden" id="mediaType" name="mediaType" value="album" />
        <button aria-disabled="false" role="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" id="button"><span class="ui-button-text">Add Item</span></button>
      </g:form>
    </div>

  </div>
</div>