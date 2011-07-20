
<%@ page contentType="text/html;charset=UTF-8" %>

<!-- options panel -->
<div id="item_options-${item.id}" class="library_item_options" title="${item.title}">
  <g:set var="needConfirmItemRequestForm" value="false" />
  <g:if test="${item.loanedOut == true}">
    <g:set var="item_status_message" value="this item is loaned out" />
    <g:set var="buttonColor" value="red" />
    <g:if test="${viewingSelf}">
      <g:set var="item_status_message" value="this item is loaned out to ${item.loanedTo.username}" />
      <g:set var="formAction" value="requestItemReturn" />
      <g:set var="buttonTitle" value="request this item be returned" />
    </g:if>
    <g:else>
      <g:if test="${item.loanedTo.id == viewUser.id}">
        <g:set var="formAction" value="" />
        <g:set var="buttonTitle" value="you have this item" />
      </g:if>
      <g:else>
        <g:set var="formAction" value="makeItemRequest" />
        <g:set var="buttonTitle" value="request this item when it is returned" />
      </g:else>
    </g:else>
  </g:if>
  <g:elseif test="${item.reserved == true}">
    <g:set var="item_status_message" value="this item is reserved" />
    <g:set var="buttonColor" value="yellow" />
    <g:if test="${viewingSelf}">
      <g:set var="formAction" value="removeItemRequest" />
      <g:set var="buttonTitle" value="remove reserved status from this item" />
    </g:if>
    <g:else>
      <g:set var="formAction" value="makeItemRequest" />
      <g:set var="buttonTitle" value="request this item when it is available" />
    </g:else>
  </g:elseif>
  <g:elseif test="${item.requestQueue.size()}">
    <g:set var="item_status_message" value="this item has been requested" />
    <g:set var="buttonColor" value="yellow" />
    <g:if test="${viewingSelf}">
      <g:set var="needConfirmItemRequestForm" value="true" />
      <g:set var="formAction" value="removeAllItemRequests" />
      <g:set var="buttonTitle" value="remove all requests from this item" />
    </g:if>
    <g:else>
      <g:if test="${item.requestQueue.contains(viewUser.id)}">
        <g:set var="formAction" value="removeItemRequest" />
        <g:set var="buttonTitle" value="remove your request for this item" />
      </g:if>
      <g:else>
        <g:set var="formAction" value="itemRequest" />
        <g:set var="buttonTitle" value="request this item when it is returned" />
      </g:else>
    </g:else>
  </g:elseif>
  <g:else> <!-- item is available -->
    <g:set var="item_status_message" value="this item is available" />
    <g:set var="buttonColor" value="green" />
    <g:if test="${viewingSelf}">
      <g:set var="notLoanedOut" value="true" />
      <g:set var="formAction" value="makeItemRequest" />
      <g:set var="buttonTitle" value="place a hold on this item" />
    </g:if>
    <g:else>
      <g:set var="formAction" value="makeItemRequest" />
      <g:set var="buttonTitle" value="request this item" />
    </g:else>
  </g:else>
  <g:set var="buttonImage" value="${buttonColor}light.png" />
  <div class="library_item_status">
    ${item_status_message}
  </div>
  <g:if test="${needConfirmItemRequestForm == 'true'}">
    <div class="library_item_option">
      <g:form controller="message" action="confirmItemRequest">
        <input type="hidden" id="requestingUser" name="requestingUser" value="${item.requestQueue[0]}" />
        <input type="hidden" id="requestedUser" name="requestedUser" value="${user.id}" />
        <input type="hidden" id="requestedMedia" name="requestedMedia" value="${item.id}" />
        <button aria-disabled="false" role="button" id="button" title="${buttonTitle}">
          <img height="15" width="15" src="${resource(dir:'images/icons',file:"greenlight.png")}" />
        </button>
        <span class="library_item_option_text">mark this item as delivered</span>
      </g:form>
    </div>
  </g:if>
  <div class="library_item_option">
    <g:form controller="message" action="${formAction}">
      <input type="hidden" id="requestingUser" name="requestingUser" value="${viewUser.id}" />
      <input type="hidden" id="requestedUser" name="requestedUser" value="${user.id}" />
      <input type="hidden" id="requestedMedia" name="requestedMedia" value="${item.id}" />
      <button aria-disabled="false" role="button" id="button" title="${buttonTitle}">
        <img height="15" width="15" src="${resource(dir:'images/icons',file:buttonImage)}" />
      </button>
      <span class="library_item_option_text">${buttonTitle}</span>
    </g:form>
  </div>
  <g:if test="${viewingSelf}">
    <g:if test="${notLoanedOut}">
      <div class="library_item_option">
        <g:form controller="item" action="updateItem" id="${user.id}">
          <input type="hidden" id="requestedMedia" name="requestedMedia" value="${item.id}">
          <button aria-disabled="false" role="button" id="show_edit" title="edit options">
            <img height="15" width="15" src="${resource(dir:'images/icons',file:"yellowlight.png")}" />
          </button>
          <span class="library_item_option_text">edit this item</span>
          <div class="library_item_edit" id="library_item_${item.id}_edit">
            <label for="item_${item.id}_title">Title</label>
            <g:textField name="item_${item.id}_title" />
            <br />
            <label for="item_${item.id}_author">Author</label>
            <g:textField name="item_${item.id}_author" />


          </div>
          <button aria-disabled="false" role="button" id="button" title="update item">Update</button
        </g:form>
      </div>
    </g:if>
    <div class="library_item_option">
      <g:form controller="item" action="deleteItem" id="${user.id}">
        <input type="hidden" id="requestedMedia" name="requestedMedia" value="${item.id}" />
        <button aria-disabled="false" role="button" id="button" title="delete item">
          <img height="15" width="15" src="${resource(dir:'images/icons',file:"delete.png")}" />
        </button>
        <span class="library_item_option_text">delete this item</span>
      </g:form>
    </div>
  </g:if>
</div>
<button class="option_button" id="option_button-${item.id}" title="options">
  <img height="15" width="15" src="${resource(dir:'images/icons',file:buttonImage)}" />
</button>