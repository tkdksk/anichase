module ApplicationHelper
  def document_title
    if @page_title.present?
      "#{@page_title} - anichase"
    else
      "anichase"
    end
  end
end