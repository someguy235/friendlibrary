
<%@ page contentType="text/html;charset=UTF-8" %>

<!-- options panel -->
<g:set var="needConfirmItemRequestForm" value="false" />
<g:if test="${item.loanedOut == true}">
  <g:set var="buttonColor" value="red" />
  <g:if test="${viewingSelf}">
    <g:set var="item_status_message">loaned out to <span class="option_panel_username">${item.loanedTo.username}</span></g:set>
    <g:set var="formAction" value="requestItemReturn" />
    <g:set var="buttonTitle" value="request return" />
  </g:if>
  <g:else>
    <g:if test="${item.loanedTo.id == viewUser.id}">
      <g:set var="item_status_message" value="you have this item" />
      <g:set var="formAction" value="confirmReturnRequest" />
      <g:set var="buttonTitle" value="mark this item returned" />
    </g:if>
    <g:else>
      <g:set var="item_status_message" value="this item is loaned out" />
      <g:set var="formAction" value="makeItemRequest" />
      <g:set var="buttonTitle" value="request when returned" />
    </g:else>
  </g:else>
</g:if>
<g:elseif test="${item.reserved == true}">
  <g:set var="item_status_message" value="this item is reserved" />
  <g:set var="buttonColor" value="yellow" />
  <g:if test="${viewingSelf}">
    <g:set var="formAction" value="removeItemRequest" />
    <g:set var="buttonTitle" value="remove reserved status" />
  </g:if>
  <g:else>
    <g:set var="formAction" value="makeItemRequest" />
    <g:set var="buttonTitle" value="request when available" />
  </g:else>
</g:elseif>
<g:elseif test="${item.requestQueue.size()}">
  <g:set var="requestingUsername">${com.friendlibrary.User.get(item.requestQueue[0]).username}</g:set>
  <g:set var="buttonColor" value="yellow" />
  <g:if test="${viewingSelf}">
    <g:set var="needConfirmItemRequestForm" value="true" />
    <g:set var="formAction" value="removeAllItemRequests" />
    <g:set var="buttonTitle" value="remove all requests" />
  </g:if>
  <g:else>
    <g:if test="${item.requestQueue.contains(viewUser.id)}">
     <g:set var="formAction" value="removeItemRequest" />
      <g:set var="item_status_message">requested by <span class="option_panel_username">you</span></g:set>
      <g:set var="buttonTitle" value="remove your request" />
    </g:if>
    <g:else>
      <g:set var="formAction" value="itemRequest" />
      <g:set var="buttonTitle" value="request when returned" />
      <g:set var="item_status_message">requested by <span class="option_panel_username">${requestingUsername}</span></g:set>
    </g:else>
  </g:else>
</g:elseif>
<g:else> <!-- item is available -->
  <g:set var="item_status_message" value="this item is available" />
  <g:set var="buttonColor" value="green" />
  <g:if test="${viewingSelf}">
    <g:set var="notLoanedOut" value="true" />
    <g:set var="formAction" value="makeItemRequest" />
    <g:set var="buttonTitle" value="place a hold" />
  </g:if>
  <g:else>
    <g:set var="formAction" value="makeItemRequest" />
    <g:set var="buttonTitle" value="ask to borrow" />
  </g:else>
</g:else>
<g:set var="buttonImage" value="${buttonColor}light.png" />

<button class="option_button" id="option_button_${itemCategory}_${item.id}" title="options">
  <img height="15" width="15" src="${resource(dir:'images/icons',file:buttonImage)}" />
</button>

<g:javascript>
  $('#option_button_${itemCategory}_${item.id}').qtip({
    content:{
      text:'\
        <div id="item_options-${item.id}" class="library_item_options"> \
          <div class="library_item_status">\
            ${item_status_message}\
          </div>\
          <g:if test="${needConfirmItemRequestForm == 'true'}"> \
            <div class="library_item_option"> \
              <g:form controller="message" action="confirmItemRequest"> \
                <input type="hidden" id="requestingUser" name="requestingUser" value="${item.requestQueue[0]}" /> \
                <input type="hidden" id="requestedUser" name="requestedUser" value="${user.id}" /> \
                <input type="hidden" id="requestedMedia" name="requestedMedia" value="${item.id}" /> \
                <button aria-disabled="false" role="button" id="button" title="${buttonTitle}"> \
                  <img height="15" width="15" src="${resource(dir:'images/icons',file:"greenlight.png")}" /> \
                </button> \
                <span class="library_item_option_text">mark as delivered</span> \
              </g:form> \
            </div> \
          </g:if> \
          <div class="library_item_option"> \
            <g:form controller="message" action="${formAction}"> \
              <input type="hidden" id="requestingUser" name="requestingUser" value="${viewUser.id}" /> \
              <input type="hidden" id="requestedUser" name="requestedUser" value="${user.id}" /> \
              <input type="hidden" id="requestedMedia" name="requestedMedia" value="${item.id}" /> \
              <button aria-disabled="false" role="button" id="button" title="${buttonTitle}"> \
                <img height="15" width="15" src="${resource(dir:'images/icons',file:buttonImage)}" /> \
              </button> \
              <span class="library_item_option_text">${buttonTitle}</span> \
            </g:form> \
          </div> \
          <g:if test="${viewingSelf}"> \
            <g:if test="${notLoanedOut}"> \
              <div class="library_item_option"> \
                <button aria-disabled="false" role="button" onclick="edit_panel(${item.id});" id="button" class="edit_button" title="edit item"> \
                  <img height="15" width="15" src="${resource(dir:'images/icons',file:"yellowlight.png")}" /> \
                </button> \
                <span class="library_item_option_text">edit</span> \
              </div> \
              <div class="clear"></div> \
            </g:if> \
            <div class="library_item_option"> \
              <button aria-disabled="false" role="button" onclick="delete_panel(${item.id});" id="button" class="delete_button" title="delete item"> \
                  <img height="15" width="15" src="${resource(dir:'images/icons',file:"delete.png")}" /> \
              </button> \
              <span class="library_item_option_text">delete</span> \
            </div> \
          </g:if> \
        </div> \
      '
    },
    show:{
      solo: true
    },
    hide:{
      fixed: true,
      when: 'mouseout',
      delay: 500
    },
    style:{
      classes: 'ui-tooltip-shadow ui-tooltip-cluetip'
    }
  });

</g:javascript>