angular.module('eworkers').controller 'MapController', [
  '$element', 'Workers'
  ($element, Workers) ->

    waitForGoogleMaps.then =>
      @map = new google.maps.Map($element[0],
        center:
          lat: -34.397
          lng: 150.644
        zoom: 8
      )
  ]
