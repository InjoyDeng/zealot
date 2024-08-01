class AddRoleToUsersApps < ActiveRecord::Migration[7.1]
  def up
    add_column :apps_users, :role, :integer, null: false, default: 0

    # 使用 SQL 语句更新 apps_users 表中的数据
    execute <<-SQL
      UPDATE apps_users
      SET role = #{Collaborator.roles[:admin]}
    SQL
  end

  def down
    remove_column :apps_users, :role
  end
end