/*
 * Scripts common to all gsp pages
 */

//hide the flash message after a set time
setTimeout(function(){$(".flash").hide(100)}, 3000);

$.fx.speeds._default = 250;

/*
//  <g:each in="${itemCategories}" var="category">
//    $("#borrowedTabs-${category}-content").tablesorter( {sortList: [[1,0],[2,0]]} );
//    $("#libTabs-${category}-content").tablesorter( {sortList: [[1,0],[2,0]]} );
//  </g:each>
*/
var optionsDialog;
function options_panel(itemId){
  optionsDialog = $("#options_panel-"+ itemId).dialog({
    show: "blind",
    hide: "blind"
  });
  return false;
}
function close_options_panel(itemId){
  $(optionsDialog).dialog("close");
  return false;
}

var editDialog;
function edit_panel(itemId){
  editDialog = $( '#edit_panel-'+itemId+'' ).dialog({
    show: "blind",
    hide: "blind"
  });
  return false;
}
function close_edit_panel(itemId){
  $(editDialog).dialog("close");
  return false;
}

var deleteDialog;
function delete_panel(itemId){
  deleteDialog = $( '#delete_panel-'+ itemId ).dialog({
    show: "blind",
    hide: "blind"
  });
  return false;
}
function close_delete_panel(itemId){
  $(deleteDialog).dialog("close");
  return false;
}

var friendlyModule = angular.module('friendlyApp', []);

friendlyModule.factory('libraryService', function() {  
  var service = {
    libraryItems : libraryItems
  }
  return service
})


friendlyModule.controller("FlashController", function($scope){
  $scope.flashMessage = flashMessage;
})

friendlyModule.controller( "LibraryController", function($scope, libraryService){
  $scope.itemCategories = itemCategories //students //${itemCategories}
  $scope.libraryService = libraryService
  $scope.libraryItems = libraryService.libraryItems
  $scope.$watch('libraryService.libraryItems', function(newVal, oldVal, scope){
    if(newVal){
      $scope.libraryItems = newVal;
      $scope.libraryItems['all'] = new Array();
      $(itemCategories).each(function(i, cat){
        $scope.libraryItems['all'] = $scope.libraryItems['all'].concat($scope.libraryItems[cat]);
      })
    }
  })
})

friendlyModule.controller("AddItemsController", function($scope, $http, libraryService){
  $scope.userId = userId
  $scope.viewingSelf = viewingSelf;
  $scope.gamePlatforms = gamePlatforms
  $scope.gamePlatforms.platform = $scope.gamePlatforms[0]
  $scope.movieFormats = movieFormats
  $scope.movieFormats.format = $scope.movieFormats[0]
  $scope.albumFormats = albumFormats
  $scope.albumFormats.format = $scope.albumFormats[0]

  $scope.addItem = function(type){
    $scope.params = {
      'game':{'platform': $scope.gamePlatforms.platform, 'title': $scope.gameTitle},
      'book':{'title': $scope.bookTitle, 'author': $scope.bookAuthor},
      'movie':{'format': $scope.movieFormats.format, 'title': $scope.movieTitle},
      'album':{'format': $scope.albumFormats.format, 'title': $scope.albumTitle, 'artist': $scope.albumArtist}
    }

    var postData = $scope.params[type]
    postData.user = $scope.userId
    postData.mediaType = type
    
    $http({
      url: '/friendlibrary/item/addItem/',
      method: "POST",
      data: JSON.stringify(postData),
      headers: {'Content-Type': 'application/json'}
    }).success(function (data, status, headers, config) {
      libraryService.libraryItems = data.library;
    }).error(function (data, status, headers, config) {

    });
  }
})

friendlyModule.controller("ItemOptionsController", function($scope, $http, libraryService){
  $scope.viewingSelf = viewingSelf;
  $scope.viewUserId = viewUserId;
  $scope.needConfirmItemRequestForm = false;
  $scope.buttonColor = null;
  $scope.itemStatusMessage = null;
  $scope.formAction = null;
  $scope.buttonTitle = null;

  $scope.userId = userId
  $scope.gamePlatforms = gamePlatforms
  $scope.gamePlatforms.platform = $scope.gamePlatforms[0]
  $scope.movieFormats = movieFormats
  $scope.movieFormats.format = $scope.movieFormats[0]
  $scope.albumFormats = albumFormats
  $scope.albumFormats.format = $scope.albumFormats[0]

  $scope.templates = {'options_panel': '/friendlibrary/fragments/optionsPanel.html'};
  
  //console.log($scope.item);
  if($scope.item.loanedOut){
    $scope.buttonColor = 'red';
    if(viewingSelf){
      $scope.itemStatusMessage = "loaned out to <span class='option_panel_username'>"+ $scope.item.loanedTo.username +"</span>";
      $scope.formAction = "requestItemReturn";
      $scope.buttonTitle = "request return";
    }else{
      if($scope.item.loanedTo.id == viewUserId){
        $scope.itemStatusMessage = "you have this item";
        $scope.formAction = "confirmReturnRequest";
        $scope.buttonTitle = "mark this item returned";
      }else{
        $scope.itemStatusMessage = "this item is loaned out";
        $scope.formAction = "makeItemRequest";
        $scope.buttonTitle = "request when returned";
      }
    }
  }else if($scope.item.reserved){
    $scope.itemStatusMessage = "this item is reserved";
    $scope.buttonColor = "yellow";
    if(viewingSelf){
      $scope.formAction = "removeItemRequest";
      $scope.buttonTitle = "remove reserved status";
    }else{
      $scope.formAction = "makeItemRequest";
      $scope.buttonTitle = "request when available";
    }
  }else if($scope.item.requestQueue.size){
    //$scope.requestingUsername = 
    $scope.buttonColor = "yellow";
    if(viewingSelf){
      $scope.needConfirmItemRequestForm = true;
      $scope.formAction = "removeAllItemRequests";
      $scope.buttonTitle = "remove all requests";
    }else{
      if(item.requestQueue.contains(viewUserId)){
        $scope.formAction = "removeItemRequest";
        $scope.itemStatusMessage = "requested by <span class='option_panel_username'>you</span>";
        $scope.buttonTitle = "remove your request";
      }else{
        $scope.formAction = "itemRequest";
        $scope.buttonTitle = "request when returned";
        $scope.itemStatusMessage = "requested by <span class='option_panel_username'>"+ $scope.requestingUsername +"</span>";
      }
    }
  }else{
    $scope.itemStatusMessage = "this item is available";
    $scope.buttonColor = "green";
    if(viewingSelf){
      $scope.notLoanedOut = true;
      $scope.formAction = "makeItemRequest";
      $scope.buttonTitle = "place a hold";
    }else{
      $scope.formAction = "makeItemRequest";
      $scope.buttonTitle = "ask to borrow";
    }
  }
  $scope.buttonImage = $scope.buttonColor + "light.png";
  
  $scope.editItem = function(itemId, itemType){
    console.log("id: "+ itemId);
    console.log("edit: "+ itemType);
    $scope.params = {
      'game':{'platform': $scope.gamePlatforms.platform, 'title': $scope.mediaTitle},
      'book':{'title': $scope.mediaTitle, 'author': $scope.bookAuthor},
      'movie':{'format': $scope.movieFormats.format, 'title': $scope.mediaTitle},
      'album':{'format': $scope.albumFormats.format, 'title': $scope.mediaTitle, 'artist': $scope.albumArtist}
    }

    var postData = $scope.params[itemType]
    postData.user = $scope.userId
    postData.itemType = itemType
    postData.itemId = itemId
    
    $http({
      url: '/friendlibrary/item/editItem/',
      method: "POST",
      data: JSON.stringify(postData),
      headers: {'Content-Type': 'application/json'}
    }).success(function (data, status, headers, config) {
      console.log(data);
      libraryService.libraryItems = data.library;
    }).error(function (data, status, headers, config) {

    });
  }

})

angular.bootstrap(friendlyApp, ["friendlyApp"]);

$("#newItemTabs").tabs({ selected: 0 });
$("#newItemListTabs").tabs({ selected: 0 });

$("#borrowedTabs").tabs({ selected: 0 });
$("#libTabs").tabs({ selected: 0 });
