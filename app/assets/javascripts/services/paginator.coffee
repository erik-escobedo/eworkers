angular.module('eworkers').service 'Paginator', ['Workers', (Workers) ->
  @currentPage = 0
  @perPage = 5
  @maxNumberOfPages = 5
  @lastPage = 0

  @pages = =>
    @lastPage = Math.ceil(Workers.total / @perPage) - 1
    numberOfPages = Math.min(@lastPage, @maxNumberOfPages)

    minPage = @currentPage
    maxPage = @currentPage
    pages = [@currentPage]

    while pages.length < numberOfPages
      if minPage > 0
        minPage -= 1
        pages = [minPage].concat(pages)

      if pages.length < numberOfPages and maxPage < @lastPage
        maxPage += 1
        pages = pages.concat(maxPage)

    return pages

  return @
]
