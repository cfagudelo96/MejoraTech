# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

maxColumnsNumber = 12
maxCategoryPanelsNumber = 3

@addCategory = () ->
  categoriesContainer = $('#categories-container')
  categoryPanels = categoriesContainer.children('.category-panel')
  categoryPanelsNumber = categoryPanels.length + 1
  panelWidth = if categoryPanelsNumber < maxCategoryPanelsNumber then maxColumnsNumber/categoryPanelsNumber else maxColumnsNumber/maxCategoryPanelsNumber
  changePanelWidth(categoryPanel, panelWidth) for categoryPanel in categoryPanels
  appendCategoryPanel(categoriesContainer, panelWidth, categoryPanels.length)
  $('#remove-category').prop('disabled', false)

appendCategoryPanel = (categoriesContainer, panelWidth, panelNumber) ->
  categoryPanel =
    '<div class="category-panel col-md-' + panelWidth + ' col-xs-12">
      <div class="panel panel-default">
        <div class="panel-body">
          <div class="form-group">
            <label for="fishbone_analysis_fishbone_categories_attributes_' + panelNumber + '_category">Category</label>
            <input required="required" class="form-control" type="text" name="fishbone_analysis[fishbone_categories_attributes][' + panelNumber + '][category]" id="fishbone_analysis_fishbone_categories_attributes_' + panelNumber + '_category">
          </div>
          <div class="panel panel-default">
            <div class="panel-body" id="causes-container-' + panelNumber + '">
              <div class="form-group">
                <textarea required="required" rows="2" placeholder="Cause #1" class="form-control" name="fishbone_analysis[fishbone_categories_attributes][' + panelNumber + '][fishbone_causes_attributes][0][cause]" id="fishbone_analysis_fishbone_categories_attributes_' + panelNumber + '_fishbone_causes_attributes_0_cause"></textarea>
              </div>
              <button type="button" onclick="addCause(this)" class="btn btn-default"><i class="fa fa-plus"></i> Cause</button>
              <button type="button" onclick="removeCause(this)" disabled class="btn btn-default" id="remove-cause-category-' + panelNumber + '"><i class="fa fa-minus"></i> Cause</button>
            </div>
          </div>
        </div>
      </div>
    </div>'
  categoriesContainer.append(categoryPanel)

changePanelWidth = (categoryPanel, panelWidth) ->
  $(categoryPanel).attr('class', 'category-panel col-md-' + panelWidth + ' col-xs-12')

@removeCategory = () ->
  categoriesContainer = $('#categories-container')
  categories = categoriesContainer.children('.category-panel')
  if categories.length == 2
    $('#remove-category').prop('disabled', true)
  categoryPanels = categories.last().remove()

@addCause = (element) ->
  container = $(element).parent()
  categoryNumber = parseInt(container.attr('id').split('-')[2])
  causeNumber = container.children('.form-group').length
  causeForm =
    '<div class="form-group">
      <textarea required="required" rows="2" placeholder="Cause #' + (causeNumber + 1) + '" class="form-control" name="fishbone_analysis[fishbone_categories_attributes][' + categoryNumber + '][fishbone_causes_attributes][' + causeNumber + '][cause]" id="fishbone_analysis_fishbone_categories_attributes_' + categoryNumber + '_fishbone_causes_attributes_' + causeNumber + '_cause"></textarea>
    </div>'
  $(element).before(causeForm)
  $('#remove-cause-category-' + categoryNumber).prop('disabled', false)

@removeCause = (element) ->
  container = $(element).parent()
  categoryNumber = parseInt(container.attr('id').split('-')[2])
  causes = container.children('.form-group')
  if causes.length == 2
    $('#remove-cause-category-' + categoryNumber).prop('disabled', true)
  causes.last().remove()

@drawFishboneDiagram = () ->
  fishbone = d3.fishbone()

  fishboneAnalysisContainer = $('#fishbone-analysis-container')

  fishboneData = getFishboneAnalysisData(fishboneAnalysisContainer)

  size = (() ->
    return {
      width: fishboneAnalysisContainer.width(),
      height: fishboneAnalysisContainer.height()
    })

  svg = d3.select("#fishbone-analysis-container")
          .append("svg")
          .attr(size())
          .datum(fishboneData)
          .call(fishbone.defaultArrow)
          .call(fishbone)

  fishbone.force().size([size().width, size().height]).start()

  d3.select(window).on('resize', () ->
    fishbone.force().size([size().width, size().height]).start()
    svg.attr(size())
  )

getFishboneAnalysisData = (fishboneAnalysisContainer) ->
  fishboneAnalysis = fishboneAnalysisContainer.data('json')
  data = {
    name: fishboneAnalysis.effect,
    children: []
  }
  for category in fishboneAnalysis.fishbone_categories
    categoryChild = {
      name: category.category
      children: []
    }
    for cause in category.fishbone_causes
      causeChild = {
        name: cause.cause
      }
      categoryChild.children.push(causeChild)
    data.children.push(categoryChild)
  return data
