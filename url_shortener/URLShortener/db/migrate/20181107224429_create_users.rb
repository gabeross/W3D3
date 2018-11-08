class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email, null: false
      
      t.timestamps
    end
    add_index :users, :email, unique: true
    #what exactly is add_index doing under the hood?
    #is adding 'unique: true' repetitive in this context? since add_index should account for that?
      #add_index allows us to look up this column in the database faster
        #rails builds a binary search tree to look up a sorted email list
  end
end
