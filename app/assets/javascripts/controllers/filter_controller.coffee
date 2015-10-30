angular.module('eworkers').
  controller 'FilterController', ['$scope', 'Skills', 'Workers', ($scope, Skills, Workers) ->

    @skills = Skills

    @loadSkills = -> Skills.search()

    @filteredSkills = =>
      if @searchTerm && @searchTerm.trim()
        Skills.results.filter (skill) =>
          skill.selected || skill.name.match(new RegExp(@searchTerm.trim(), 'i'))
      else
        Skills.results

    @updateSearch = =>
      selectedSkills = Skills.results.filter (skill) -> skill.selected

      Workers.search
        'skills[]': selectedSkills.map (skill) -> skill.id

    return @
  ]
