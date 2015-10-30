angular.module('eworkers').service 'Workers', ['$http', ($http) ->
  @results = []

  @search = (params) ->
    $http({
      method: 'GET',
      url: '/api/workers.json',
      params: params
    }).success (workers) =>
      @results = workers

  return @
]
