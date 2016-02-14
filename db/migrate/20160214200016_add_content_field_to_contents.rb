class AddContentFieldToContents < ActiveRecord::Migration
  def change
    add_column :contents, :content_field, :text
  end
end
