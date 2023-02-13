Rails.application.routes.draw do
  get("/users", { :controller => "users", :action => "index"})
  get("/", { :controller => "users", :action => "index"})
  get("/users/:path_username", { :controller => "users", :action => "show"})
  get("/photos", { :controller => "photos", :action => "index"})
  get("/photos/:path_id", { :controller => "photos", :action => "show"})
  get("/delete_photo/:path_id", {:controller => "photos", :action => "delete_photo"})
  get("/insert_photo_record", {:controller => "photos", :action => "add_new_photo"})
  get("/update_photo/:path_id", {:controller => "photos", :action => "update_photo"})
  get("/insert_user", {:controller => "users", :action => "add_new_user"})
  get("/update_user/:path_id", {:controller => "users", :action => "update_user"})
  get("/insert_comment", {:controller => "photos", :action => "add_new_comment"})
end
