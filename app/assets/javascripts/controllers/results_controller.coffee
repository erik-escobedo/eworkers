angular.module('eworkers').controller 'ResultsController', [
  'Workers', 'Skills', 'Paginator',
  (Workers, Skills, Paginator) ->

    @workers = Workers
    @paginator = Paginator

    @loadWorkers = -> Workers.search()

    @fullName = (worker) ->
      "#{worker.first_name} #{worker.last_name}"

    @skillsText = (worker) ->
      Skills.getSkills(worker.skills).map((skill) ->
        skill.name
      ).join(', ')

    @showPage = (page) =>
      Paginator.currentPage = page

      Workers.search
        'skills[]': Skills.selected()
        page: Paginator.currentPage

    return @
  ]
