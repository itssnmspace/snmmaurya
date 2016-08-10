module ApplicationHelper
  def create_asset_image_template options={}
    image = ImageAsset.image_asset_by_code(options[:image_asset_code])
    if image.present?
      image_tag image.data.url(:medium), class: options[:class], id: options[:id], alt: image.title
    else
      image = ImageAsset.image_asset_by_code("default_image_asset")
      if image.present?
        image_tag image.data.url(:medium), class: options[:class], id: options[:id], alt: image.title
      else
        image_tag "static_images/default.jpg", class: options[:class], id: options[:id], alt: "SnmMaurya"
      end
    end
  end

  def get_nested_comments comment, comment_html
    comment_html += "<div class='media-body'><p>#{comment.content}</p>"
    comment_html += "<div class='col-sm-12 text-right'>"
    comment_html += "#{link_to 'Write a comment', '#writeacomment', class: 'btn btn-info btn-xs write-a-comment', data: {nested: "Comment", nested_id: comment.id}} | "
    comment_html += "<small>#{comment.created_at.strftime('%b %m %Y at %H:%M')}</small> | "
    comment_html += "By #{link_to @blog.user.try(:username), '#'}"
    comment_html += "</div>"
    comment_html += "<div class='snm-comment-border-spacer'></div>"
    unless comment.comments.where("nested='Comment'").present?
      comment_html += "</div>"
    else
      # comment_html += "</div>"
      comment.comments.where("nested='Comment'").each do |com|
        comment_html += get_nested_comments(com, "<div class='media'>")
        comment_html += "</div>"
      end
    end
    # binding.pry
     comment_html += "</div>"
     comment_html.html_safe
  end

  def create_flash_message_and_class
    flash[:success].present? ? [flash[:success], "success"] : (flash[:notice].present? ? [flash[:notice], "success"] : [flash[:error], "danger"])
  end

  def datetimeformat datetime, format=1
    datetime = datetime.try(:to_datetime)
    if datetime.present?
      case format
        when 1
          datetime.strftime("%b %Y")
        when 2
          datetime.strftime("%H:%M %b %d, %Y")
        else
          datetime.strftime("%b %d, %Y")
      end
    else
      "Going on."
    end  
  end

  #Method for Meta Data Settings
  #data parameter handles dynamic meta data like individual solution
  def setup_meta_data data=nil
    meta_options = {}
    if data.present?
     #Dynamic individual meta data
     meta_options = setup_meta_options data
    else
      #Page Specific meta data
      meta_data = MetaDataSetting.all
      meta_data.each do |meta_datum|
        if (request.original_url.include? meta_datum.site_url) && meta_datum.meta_default == false
          meta_options = setup_meta_options meta_datum
          break
        end
      end
      unless meta_options.present?
        #Default meta data
        meta_options = default_meta_data
      end
    end
    meta_options
  end

  def default_meta_data
    setup_meta_options MetaDataSetting.find_by(meta_default: true)
  end

  def setup_meta_options meta_data
    {title: meta_data.meta_title, description: meta_data.meta_description, keywords: meta_data.meta_keywords} if meta_data.present?
  end
end
