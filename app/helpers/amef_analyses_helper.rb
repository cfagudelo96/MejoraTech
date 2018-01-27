module AmefAnalysesHelper
  def sort_link(column, title = nil, all = nil)
    title ||= column.titleize
    direction = column == sort_column && sort_direction == 'asc' ? 'desc' : 'asc'
    icon = if sort_direction == 'asc'
             'glyphicon glyphicon-chevron-up'
           else
             'glyphicon glyphicon-chevron-down'
           end
    icon = column == sort_column ? icon : ''
    link_to "#{title} <span class='#{icon}'/>".html_safe,
            column: column, direction: direction, all: all
  end
end
