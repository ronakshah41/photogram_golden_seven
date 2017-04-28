class PhotosController < ActionController::Base

  def index
    @all_photos = Photo.all
    render("/photos/index.html.erb")
  end

  def new_form
    render("/photos/new_form.html.erb")
  end

  def create_row
    url = params[:source]
    caption = params[:caption]

    new_photo = Photo.new

    new_photo.source = url
    new_photo.caption = caption
    new_photo.save

    # render("/create_row.html.erb")
    redirect_to("/photos")
  end

  def show
    @id = params[:id]
    @my_photo = Photo.find(@id)
    render("/photos/show.html.erb")
  end

  def edit_form
    @id = params[:id]
    @my_photo = Photo.find(@id)

    render("/photos/edit_form.html.erb")
  end

  def update_row
    id = params[:id]
    url = params[:source]
    caption = params[:caption]

    update_photo = Photo.find(id)

    update_photo.source = url
    update_photo.caption = caption

    update_photo.save

    # render("/update_row.html.erb")
    redirect_to("/photos/#{update_photo.id}")
  end

  def destroy_row
    @id = params[:id]

    Photo.destroy(@id)
    # render("/destroy_row.html.erb")
    redirect_to("/photos")
  end
end
