class RolifyCreateRoles < ActiveRecord::Migration
  def migrate(direction)
    super
    if direction == :up
      user = User.find_by(email: 'admin@example.com')
      user.add_role :entrepreneur
    end
  end
  def change
    create_table(:roles) do |t|
      t.string :name
      t.references :resource, :polymorphic => true

      t.timestamps
    end

    create_table(:users_roles, :id => false) do |t|
      t.references :user
      t.references :role
    end

    add_index(:roles, :name)
    add_index(:roles, [ :name, :resource_type, :resource_id ])
    add_index(:users_roles, [ :user_id, :role_id ])
  end
end
