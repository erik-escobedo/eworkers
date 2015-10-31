angular.module('eworkers').controller 'FilterController', [
  '$scope', 'Skills', 'Workers', 'Paginator',
  ($scope, Skills, Workers, Paginator) ->

    @skills = Skills

    @loadSkills = -> Skills.search()

    @filteredSkills = =>
      if @searchTerm && @searchTerm.trim()
        Skills.results.filter (skill) =>
          skill.selected || skill.name.match(new RegExp(@searchTerm.trim(), 'i'))
      else
        Skills.results

    @updateSearch = =>
      Paginator.currentPage = 0
      Workers.search
        'skills[]': Skills.selected()

    return @
  ]
