angular.module('eworkers').service 'Skills', ['$http', ($http) ->
  @results = []

  @search = (params) ->
    $http({
      method: 'GET',
      url: '/api/skills.json',
      data: params
    }).success (skills) =>
      @results = skills

  @getSkills = (ids) =>
    @results.filter (skill) ->
      ids.indexOf(skill.id) > -1

  return @
]
