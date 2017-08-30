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
              <button type="button" onclick="addCause(this)" class="btn btn-default"><i class="fa fa-plus"></i> Add cause</button>
            </div>
          </div>
        </div>
      </div>
    </div>'
  categoriesContainer.append(categoryPanel)

changePanelWidth = (categoryPanel, panelWidth) ->
  $(categoryPanel).attr('class', 'category-panel col-md-' + panelWidth + ' col-xs-12')

@addCause = (element) ->
  container = $(element).parent()
  categoryNumber = parseInt(container.attr('id').split('-')[2])
  causeNumber = container.children('.form-group').length
  causeForm =
    '<div class="form-group">
      <textarea required="required" rows="2" placeholder="Cause #' + (causeNumber + 1) + '" class="form-control" name="fishbone_analysis[fishbone_categories_attributes][' + categoryNumber + '][fishbone_causes_attributes][' + causeNumber + '][cause]" id="fishbone_analysis_fishbone_categories_attributes_' + categoryNumber + '_fishbone_causes_attributes_' + causeNumber + '_cause"></textarea>
    </div>'
  $(element).before(causeForm)
