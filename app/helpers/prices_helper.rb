module PricesHelper
  def state_icon(price)
    case price.state
    when "created"    then content_tag :span, nil, class: 'glyphicon glyphicon-floppy-open'
    when "processing" then content_tag :progress, nil
    when "processed"  then content_tag :span, nil, class: 'glyphicon glyphicon-check'
    else 
      price.state
    end
  end
end
