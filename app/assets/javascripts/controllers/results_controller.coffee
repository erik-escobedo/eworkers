angular.module('eworkers').
  controller 'ResultsController', ['Workers', 'Skills', (Workers, Skills) ->
    @workers = Workers

    @loadWorkers = -> Workers.search()

    @fullName = (worker) ->
      "#{worker.first_name} #{worker.last_name}"

    @skillsText = (worker) ->
      Skills.getSkills(worker.skills).map((skill) ->
        skill.name
      ).join(', ')

    return @
  ]
