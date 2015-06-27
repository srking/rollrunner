RailsAdmin.config do |config|
  config.authorize_with do |controller|
      unless current_user.try(:admin?)
        raise ActionController::RoutingError.new('Not Found')
        # flash[:error] = "You are not an admin"
        # redirect_to '/'
      end
    end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
