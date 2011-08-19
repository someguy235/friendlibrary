
<%@ page contentType="text/html;charset=UTF-8" %>
<div class="edit_panel" id="edit_panel-${item.id}" title="Edit: ${item.title}" >
  <g:form controller="item" action="editItem" id="${user.id}">
    <input type="hidden" id="requestedMedia" name="requestedMedia" value="${item.id}" />
    <g:set var="mediaImage" value="${item.mediaType}.png" />
    <img height="20" width="20" src="${resource(dir:'images/icons',file:mediaImage)}" alt="${item.mediaType}" title="${item.mediaType}"/>
    <div class="clear"></div>
    <div class="edit_label"><label for="edit_title">Title:</label></div>
    <div class="edit_field"><input type="text" name="edit_title" value="${item.title}" /></div>
    <div class="clear"></div> 
    <g:if test="${item.mediaType == 'album'}">
      <div class="edit_label"><label for="edit_artist">Artist:</label></div>
      <div class="edit_field"><input type="text" name="edit_artist" value="${item.artist}" /></div>
      <div class="edit_label"><label for="edit_format">Format:</label></div>
      <div class="edit_field"><g:select from="${albumFormats}" name="edit_format" value="${item.format}" class="ui-button ui-widget-content ui-state-default ui-corner-all"></g:select></div>
      <div class="clear"></div>
    </g:if>
    <g:if test="${item.mediaType == 'book'}">
      <div class="edit_label"><label for="edit_author">Author:</label></div>
      <div class="edit_field"><input type="text" name="edit_author" value="${item.author}" /></div>
      <div class="clear"></div>
    </g:if>
    <g:if test="${item.mediaType == 'movie'}">
      <div class="edit_label"><label for="edit_format">Format:</label></div>
      <div class="edit_field"><g:select from="${movieFormats}" value="${item.format}" name="edit_format" class="ui-button ui-widget-content ui-state-default ui-corner-all"></g:select></div>
      <div class="clear"></div>
    </g:if>
    <g:if test="${item.mediaType == 'game'}">
      <div class="edit_label"><label for="edit_platform">Platform:</label></div>
      <div class="edit_field"><g:select from="${gamePlatforms}" name="edit_platform" value="${item.platform}" class="ui-button ui-widget-content ui-state-default ui-corner-all"></g:select></div>
      <div class="clear"></div> 
    </g:if>
    <button aria-disabled="false" role="button" id="button" title="update item">
      Update
    </button>
  </g:form>
</div>
<div class="clear"></div>