angular.module('eworkers').service 'Workers', ['$http', ($http) ->
  @results = []
  @total = 0

  @search = (params) ->
    $http({
      method: 'GET',
      url: '/api/workers.json',
      params: params
    }).success (data) =>
      @results = data.workers
      @total   = data.total
      notifyObservers()

  # Observer Pattern
  observers = []
  @onChange = (callback) =>
    observers.push callback

  notifyObservers = =>
    observers.forEach (callback) =>
      callback(@results)

  return @
]
