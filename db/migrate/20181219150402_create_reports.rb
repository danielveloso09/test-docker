# frozen_string_literal: true

class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.string :name
      t.string :location

      t.references :user, null: false
      t.foreign_key :users

      t.text :description
      t.text :files

      t.timestamps
    end
  end
end
