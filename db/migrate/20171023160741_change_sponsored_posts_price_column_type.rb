class ChangeSponsoredPostsPriceColumnType < ActiveRecord::Migration[5.1]
  def change
    change_column :sponsored_posts, :price, :integer
  end
end
