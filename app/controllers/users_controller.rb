class UsersController < ApplicationController
  def index
    @list_of_users = User.all.order({ :username => :asc })

    render({ :template => "user_templates/index.html.erb" })
  end

  def show
    url_name = params.fetch("path_username")

    matching_usernames = User.where({ :username => url_name })

    @the_user = matching_usernames.first

    if @the_user == nil
      redirect_to("/404")
    else
      render({ :template => "user_templates/show.html.erb" })
    end
  end

  def add_new_user
    #Parameters: {"input_username"=>"test07"}

    username = params.fetch("input_username")

    the_user = User.new

    the_user.username = username

    the_user.save

    redirect_to("/users/#{the_user.username}")
  end

  def update_user
    username = params.fetch("input_username")
    user_id = params.fetch("path_id")

    the_user = User.where({ :id => user_id }).at(0)

    the_user.username = username

    the_user.save

    redirect_to("/users/#{the_user.username}")
  end
end
