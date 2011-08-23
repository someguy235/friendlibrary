<%@ page contentType="text/html;charset=UTF-8" %>
<div class="delete_panel" id="delete_panel-${item.id}" title="Delete: ${item.title}?" >
  <g:form controller="item" action="deleteItem" id="${user.id}">
    <input type="hidden" id="requestedMedia" name="requestedMedia" value="${item.id}" />
    <g:set var="mediaImage" value="${item.mediaType}.png" />
    <img height="20" width="20" src="${resource(dir:'images/icons',file:mediaImage)}" alt="${item.mediaType}" title="${item.mediaType}"/>
    <div class="clear"></div>


    <button aria-disabled="false" role="button" class="delete_item_button" id="button" title="Yes, get rid of it!">
      Yes, get rid of it!
    </button>
  </g:form>
  <button aria-disabled="false" role="button" class="delete_item_button" id="button" onclick="close_delete_panel(${item.id});" title="No, just kidding.">
    No, just kidding.
  </button>
</div>
