class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.belongs_to :user, index: true
      t.string     :provider
      t.string     :uid
    end
  end
end
