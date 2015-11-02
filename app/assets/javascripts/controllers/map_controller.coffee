angular.module('eworkers').controller 'MapController', [
  '$element', 'Workers'
  ($element, Workers) ->

    waitForGoogleMaps.then =>
      @map = new google.maps.Map($element[0],
        center:
          lat: 52
          lng: 5.5
        zoom: 8
      )

      @markers = []

    Workers.onChange (workers) =>
      waitForGoogleMaps.then =>
        deleteMarkers()

        bounds = new google.maps.LatLngBounds

        workers.forEach (worker, index) =>
          position = new google.maps.LatLng
            lat: worker.latitude
            lng: worker.longitude

          marker = new google.maps.Marker
            map: @map
            position: position

          @markers.push marker

          bounds.extend position

          $li = $('.results li').eq(index)
          $li.on 'mouseenter', ->
            marker.setAnimation google.maps.Animation.BOUNCE
          $li.on 'mouseleave', ->
            marker.setAnimation null

        @map.fitBounds bounds
        if @map.getZoom() > 17
          @map.setZoom 17


    deleteMarkers = =>
      @markers.forEach (marker) =>
        marker.setMap null
  ]
