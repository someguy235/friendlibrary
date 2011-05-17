<%@ page contentType="text/html;charset=UTF-8" %>

<div class="import_box grid_6"> <!-- add list of items -->
  <div class="ui-tabs ui-widget ui-widget-content ui-corner-all" id="newItemListTabs">
    <ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
      <!--<li class="ui-state-default ui-corner-top ui-tabs-selected ui-state-active"><a href="#newItemListTabs-game">Games</a></li>-->
      <li class="ui-state-default ui-corner-top ui-tabs-selected ui-state-active"><a href="#newItemListTabs-book">Books</a></li>
      <!--<li class="ui-state-default ui-corner-top"><a href="#newItemListTabs-movie">Movies</a></li>-->
      <!--<li class="ui-state-default ui-corner-top"><a href="#newItemListTabs-movie">Music</a></li>-->
    </ul>
    <!--
    <div class="ui-tabs-panel ui-widget-content ui-corner-bottom" id="newItemListTabs-game">
      <table>
        <tr>
          <g:set var="platforms" value="${['PS3', 'XBox360', 'Wii']}" />
          <td><label for="platform">Platform&nbsp;</label></td>
          <td>
          <div class="ui-widget">
            <g:select from="${platforms}" value="PS3" name="platform" class="ui-button ui-widget-content ui-state-default ui-corner-all"></g:select>
          </div>
          </td>
        </tr>
        <tr>
          <td><label for="title">Title&nbsp;</label></td>
          <td><g:textField id="title" name="title"/></td>
        </tr>
      </table>
    </div>
    -->
    <div class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide" id="newItemListTabs-book">
      <g:form controller="item" action="addItemList" id="${user.id}">
        <table>
          <tr>
            <g:set var="source" value="${['GoodReads']}" />
            <td><label for="source">Source&nbsp;</label></td>
            <td>
              <div class="ui-widget">
                <g:select from="${source}" value="GoodReads" name="source" class="ui-button ui-widget-content ui-state-default ui-corner-all"></g:select>
              </div>
            </td>
          </tr>
          <tr>
            <td><label for="remoteUserId">User Id&nbsp;</label></td>
            <td><g:textField id="remoteUserId" name="remoteUserId"/></td>
          </tr>
        </table>
        <br />
        <button aria-disabled="false" role="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" id="button"><span class="ui-button-text">Import List</span></button>
      </g:form>
    </div>
    <!--
    <div class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide" id="newItemListTabs-movie">
      Nam dui erat, auctor a, dignissim quis, sollicitudin eu, felis. Pellentesque nisi urna, interdum eget, sagittis et, consequat vestibulum, lacus. Mauris porttitor ullamcorper augue.
    </div>
    <div class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide" id="newItemListTabs-music">
      Nam dui erat, auctor a, dignissim quis, entesque nisi urna, interdum eget, sagittis et, consequat vestibulum, lacus. Mauris porttitor ullamcorper augue.
    </div>
    -->
  </div>
  <br />
</div>