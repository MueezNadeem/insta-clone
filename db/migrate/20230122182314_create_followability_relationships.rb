class CreateFollowabilityRelationships < ActiveRecord::Migration[5.2]
  def change

    create_table "followability_relationships", force: :cascade do |t|
      t.string "followerable_type", null: false
      t.integer "followerable_id", null: false
      t.string "followable_type", null: false
      t.integer "followable_id", null: false
      t.integer "status"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["followable_type", "followable_id"], name: "index_followability_relationships_on_followable"
      t.index ["followerable_type", "followerable_id"], name: "index_followability_relationships_on_followerable"
    end

  end
end
