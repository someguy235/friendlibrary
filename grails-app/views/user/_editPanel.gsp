
<%@ page contentType="text/html;charset=UTF-8" %>

<g:form>
  <div class="edit_panel" id="edit_panel-${item.id}" title="Edit: ${item.title}" >
    <g:set var="mediaImage" value="${item.mediaType}.png" />
    <img height="20" width="20" src="${resource(dir:'images/icons',file:mediaImage)}" alt="${item.mediaType}" title="${item.mediaType}"/>
    <div class="clear"></div>
    <div class="edit_label"><label for="edit_${item.id}_title">Title:</label></div>
    <div class="edit_field"><input type="text" name="edit_${item.id}_title" value="${item.title}" /></div>
    <div class="clear"></div> 
    <g:if test="${item.mediaType == 'album'}">
      <div class="edit_label"><label for="edit_${item.id}_artist">Artist:</label></div>
      <div class="edit_field"><input type="text" name="edit_${item.id}_artist" value="${item.artist}" /></div>
      <div class="clear"></div>
    </g:if>
    <g:if test="${item.mediaType == 'book'}">
      <div class="edit_label"><label for="edit_${item.id}_author">Author:</label></div>
      <div class="edit_field"><input type="text" name="edit_${item.id}_author" value="${item.author}" /></div>
      <div class="clear"></div>
    </g:if>
    <g:if test="${(item.mediaType == 'album')||(item.mediaType == 'movie')}">
      <div class="edit_label"><label for="edit_${item.id}_format">Format:</label></div>
      <div class="edit_field"><input type="text" name="edit_${item.id}_format" value="${item.format}" /></div>
      <div class="clear"></div>
    </g:if>
    <g:if test="${item.mediaType == 'game'}">
      <div class="edit_label"><label for="edit_${item.id}_platform">Platform:</label></div>
      <div class="edit_field"><input type="text" name="edit_${item.id}_platform" value="${item.platform}" /></div>
      <div class="clear"></div> 
    </g:if>
    <button>
      Update
    </button>
  </div>
</g:form>
<div class="clear"></div>