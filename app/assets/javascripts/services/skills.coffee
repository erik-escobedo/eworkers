angular.module('eworkers').service 'Skills', ['$http', ($http) ->
  @results = []

  @search = (params) ->
    $http({
      method: 'GET',
      url: '/api/skills.json',
      data: params
    }).success (skills) =>
      @results = skills

  return @
]
