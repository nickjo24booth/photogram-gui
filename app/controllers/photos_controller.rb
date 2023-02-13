class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all.order({ :created_at => :desc })

    render({ :template => "photo_templates/index.html.erb" })
  end

  def show
    url_id = params.fetch("path_id")

    matching_photos = Photo.where({ :id => url_id })

    @the_photo = matching_photos.first

    @comments_array = Comment.where({ :photo_id => url_id }).order({ :created_at => :desc })

    if @the_photo == nil
      redirect_to("/404")
    else
      render({ :template => "photo_templates/show.html.erb" })
    end
  end

  def delete_photo
    url_id = params.fetch("path_id")

    matching_photos = Photo.where({ :id => url_id })

    the_photo = matching_photos.first

    the_photo.destroy

    #MAY NEED TO DELETE COMMMENTS ASSOCIATED WITH THE PHOTO; THE PHOTO VARIABLE AVAILABLE UNTIL END OF THE METHOD.

    #render({ :template => "photo_templates/delete_photo.html.erb"})

    redirect_to("/photos")
  end

  def add_new_photo
    # Parameters: {"input_image"=>"test", "input_caption"=>"test", "input_owner_id"=>"117"}

    image_url = params.fetch("input_image")
    image_caption = params.fetch("input_caption")
    image_userid = params.fetch("input_owner_id")

    the_photo = Photo.new

    the_photo.image = image_url
    the_photo.caption = image_caption
    the_photo.owner_id = image_userid

    the_photo.save

    redirect_to("/photos/#{the_photo.id}")

    #render({ :template => "photo_templates/add_photo.html.erb"})
  end

  def update_photo
    image_url = params.fetch("input_image")
    image_caption = params.fetch("input_caption")
    image_id = params.fetch("path_id")

    the_photo = Photo.where({ :id => image_id }).at(0)

    the_photo.image = image_url
    the_photo.caption = image_caption

    the_photo.save

    redirect_to("/photos/#{the_photo.id}")
  end

  def add_new_comment
    # Parameters: {"input_image"=>"test", "input_caption"=>"test", "input_owner_id"=>"117"}

    image_id = params.fetch("input_photo_id")
    commenter_id = params.fetch("input_author_id")
    comment_text = params.fetch("input_body")

    the_comment = Comment.new

    the_comment.photo_id = image_id
    the_comment.author_id = commenter_id
    the_comment.body = comment_text

    the_comment.save

    redirect_to("/photos/#{image_id}")

    #render({ :template => "photo_templates/add_photo.html.erb"})
  end
end
