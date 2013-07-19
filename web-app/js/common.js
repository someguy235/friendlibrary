/*
 * Scripts common to all gsp pages
 */

//hide the flash message after a set time
setTimeout(function(){$(".flash").hide(100)}, 3000);

$.fx.speeds._default = 250;

$(function() {

  $(".edit_panel").dialog({
    autoOpen: false,
    show: "blind",
    hide: "blind"
  });

  $(".delete_panel").dialog({
    autoOpen: false,
    show: "blind",
    hide: "blind"
  });

  $("#newItemTabs").tabs({ selected: 0 });
  $("#newItemListTabs").tabs({ selected: 0 });

  $("#borrowedTabs").tabs({ selected: 0 });
  $("#libTabs").tabs({ selected: 0 });

//  <g:each in="${itemCategories}" var="category">
//    $("#borrowedTabs-${category}-content").tablesorter( {sortList: [[1,0],[2,0]]} );
//    $("#libTabs-${category}-content").tablesorter( {sortList: [[1,0],[2,0]]} );
//  </g:each>

});

function edit_panel(itemId){
  $( '#edit_panel-'+itemId+'' ).dialog( "open" );
  return false;
};

function delete_panel(itemId){
  $( '#delete_panel-'+itemId+'' ).dialog( "open" );
  return false;
};

function close_delete_panel(itemId){
  $( '#delete_panel-'+itemId+'' ).dialog("close");
  return false;
};




var friendlyModule = angular.module('friendlyApp', []);

friendlyModule.factory('libraryService', function() {  
  var service = {
    libraryItems : libraryItems
  }
  return service
})

friendlyModule.controller( "LibraryController", function($scope, libraryService){
  $scope.itemCategories = itemCategories //students //${itemCategories}
  $scope.libraryService = libraryService
  $scope.libraryItems = libraryService.libraryItems
  $scope.$watch('libraryService.libraryItems', function(newVal, oldVal, scope){
    if(newVal){
      $scope.libraryItems = newVal;
//      console.log("libraryItems: "+ JSON.stringify($scope.libraryItems))
    }
  })
})

friendlyModule.controller("AddItemsController", function($scope, $http, libraryService){
  $scope.userId = userId
  $scope.gamePlatforms = gamePlatforms
  $scope.gamePlatforms.platform = $scope.gamePlatforms[0]
  $scope.movieFormats = movieFormats
  $scope.movieFormats.format = $scope.movieFormats[0]
  $scope.albumFormats = albumFormats
  $scope.albumFormats.format = $scope.albumFormats[0]

  $scope.addItem = function(type){
    $scope.params = {
      'game':{'platform': $scope.gamePlatforms.platform, 'title': $scope.gameTitle},
      'book':{},
      'movie':{'format': $scope.movieFormats.format},
      'album':{'format': $scope.albumFormats.format}
    }
//    console.log($scope.params[type])
//    console.log($scope.gameTitle)

    var postData = $scope.params[type]
    postData.user = $scope.userId
    postData.mediaType = type
    
    $http({
      url: '/friendlibrary/item/addItem/',
      method: "POST",
      data: JSON.stringify(postData),
      headers: {'Content-Type': 'application/json'}
    }).success(function (data, status, headers, config) {
//      console.log("success");
//      console.log(data);
      libraryService.libraryItems = data.library;
//      console.log(libraryService.libraryItems)
    }).error(function (data, status, headers, config) {
//      console.log("error");
    });
  }
})

angular.bootstrap(friendlyApp, ["friendlyApp"]);