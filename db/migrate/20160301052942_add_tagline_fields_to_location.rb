class AddTaglineFieldsToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :tagline_title, :string
    add_column :locations, :tagline_summary, :string
  end
end
