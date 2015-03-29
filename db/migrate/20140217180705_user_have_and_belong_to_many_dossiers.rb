class UserHaveAndBelongToManyDossiers < ActiveRecord::Migration
		def self.up
  			  create_table :dossiers_users, :id => false do |t|
   	   		t.references :dossier, :user
    			end
 		 end
 
 		 def self.down
   			 drop_table :dossiers_users
 		 end
end
