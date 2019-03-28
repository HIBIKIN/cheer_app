class AddCommentcountToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :reviews_count, :integer
  end
end
