ActiveAdmin.register_page "Dashboard" do

  content title: "Admin Dashboard" do
    div class: "manage_sites_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        h3 link_to('Manage Sites',"/admin/sites")
      end
    end
  end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  # end
end
