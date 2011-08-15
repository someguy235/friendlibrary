
<%@ page contentType="text/html;charset=UTF-8" %>

<div class="edit_panel" id="edit_panel-${item.id}" title="editing: ${item.title}" >
  <g:form>
    <g:set var="mediaImage" value="${item.mediaType}.png" />
    <img height="20" width="20" src="${resource(dir:'images/icons',file:mediaImage)}" alt="${item.mediaType}" title="${item.mediaType}"/>
    <div class="edit_label">Title:</div>
    <div class="edit_field"><input type="text" name="item_${item.id}_title" value="${item.title}" /></div>
    <g:if test="${item.mediaType == 'album'}">
      <div class="edit_label"><label for="edit_artist">Artist:</label></div>
      <div class="edit_field"><input type="text" name="item_${item.id}_artist" value="${item.artist}" /></div>
    </g:if>
    <g:if test="${item.mediaType == 'book'}">
      <div class="edit_label"><label for="edit_author">Author:</label></div>
      <div class="edit_field"><input type="text" name="item_${item.id}_author" value="${item.author}" /></div>
    </g:if>
    <g:if test="${(item.mediaType == 'album')||(item.mediaType == 'movie')}">
      <div class="edit_label"><label for="edit_format">Format:</label></div>
      <div class="edit_field"><input type="text" name="item_${item.id}_format" value="${item.format}" /></div>
    </g:if>
    <g:if test="${item.mediaType == 'game'}">
      <div class="edit_label"><label for="edit_platform">Platform:</label></div>
      <div class="edit_field"><input type="text" name="item_${item.id}_platform" value="${item.platform}" /></div>
    </g:if>
    <button>
      Update
    </button>
  </g:form>
</div>
<div class="clear"></div>