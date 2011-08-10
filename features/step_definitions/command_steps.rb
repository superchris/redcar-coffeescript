# steps borrowed from edit_view plugin

When /^I run the command ([^\s]+)$/ do |command_name|
  command_class = eval(command_name)
  command = command_class.new
  if command.is_a?(Redcar::DocumentCommand)
    command.run(:env => {:edit_view => implicit_edit_view})
  else
    command.run
  end
end

def implicit_edit_view
  edit_views = Redcar::EditView.all_edit_views
  focussed_edit_view = Redcar::EditView.focussed_edit_view
  ev =  if edit_views.length == 1
          edit_views.first
        elsif focussed_edit_view
          focussed_edit_view
        else
          if edit_tab = implicit_edit_tab
            edit_tab.edit_view
          end
        end
  raise "no implicit edit view (#{edit_views.length} open)" unless ev
  ev
end