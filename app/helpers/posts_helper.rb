module PostsHelper
  def tag_links(tags)
    tags.split(", ").map{ |tag| link_to tag.strip, tag_path(tag.strip), class: 'link' }.join(", ")
  end

  def tag_list(tags)
    tags.each do |tag|
      yield(tag)
    end
  end
end
