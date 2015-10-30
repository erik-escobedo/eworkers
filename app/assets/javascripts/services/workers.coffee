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

  return @
]
