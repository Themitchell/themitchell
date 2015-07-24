module RetinaImageHelper

  RETINA_IMAGE_RESOLUTION_MULTIPLIERS = [1, 2]

  def retina_image_tag(src, options = {})
    srcset = RETINA_IMAGE_RESOLUTION_MULTIPLIERS.map { |num|
      name = src.sub("_1x.", "_#{num}x.")
      "#{path_to_image(name)} #{num}x"
    }.join(", ")

    image_tag(src, options.merge(srcset: srcset))
  end

end
