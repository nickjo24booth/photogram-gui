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
end
