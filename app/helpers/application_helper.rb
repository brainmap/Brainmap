# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def title(suffix)
    "Wisconsin ADRC Imaging Core - " + suffix
  end
  
  def blurb_background_style(blurb)
     if blurb && blurb.image?
       "style='background-image: url(#{blurb.image.url(:medium)}); #{blurb.style} '"
     end
  end
  
  def blurb_backgroundwithgradient_style(blurb)
    if blurb && blurb.image?
      "style='background: url(#{blurb.image.url(:medium)}) #{blurb.style}, #{moz_gradient};background: url(#{blurb.image.url(:medium)}) #{blurb.style}, #{webkit_gradient}; '"
    end
  end
  
  def moz_gradient
    "-moz-linear-gradient(top, rgba(154,199,219,0.5), rgba(154,199,219,0.1) 15%)"
  end
  
  def webkit_gradient
    "-webkit-gradient(linear, left bottom, left top, color-stop(0.85, rgba(154,199,219,0.1)), color-stop(0.95, rgba(154,199,219,0.5)))"
  end
end
