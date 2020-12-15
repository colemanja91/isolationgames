module PostgresConstraintHelpers

  def add_check(table, check_name, expr, check_type = "check")
    reversible do |dir|
      dir.up do
        sql = <<-"SQL"
            alter table #{table}
              add constraint #{check_name}
              #{check_type} (#{expr})
          SQL

        execute sql.split.map{|s| s.gsub(/^\s+/, '')}.join(' ')
      end

      dir.down do
        execute "alter table #{table} drop constraint #{check_name}"
      end
    end
  end

  def drop_check(table, check_name, expr, check_type = "check")
    revert do
      add_check(table, check_name, expr, check_type)
    end
  end

  def add_exclude(table, exclude_name, with_exprs, options={})
    reversible do |dir|
      dir.up do
        options = {using: 'btree'}.merge(options)
        sql = <<-"SQL"
            alter table #{table}
              add constraint #{exclude_name}
              exclude using #{options[:using]}
              (#{with_exprs})
          SQL
        sql << " where (#{options[:where]})" if options[:where].present?
        execute sql.split.map{|s| s.gsub(/^\s+/, '')}.join(' ')
      end
      dir.down do
        execute "alter table #{table} drop constraint #{exclude_name}"
      end
    end
  end

  def rename_constraint(table, old_name, new_name)
    reversible do |dir|
      dir.up { execute "ALTER TABLE #{table} RENAME CONSTRAINT #{old_name} TO #{new_name}" }
      dir.down { execute "ALTER TABLE #{table} RENAME CONSTRAINT #{new_name} TO #{old_name}" }
    end
  end

  def drop_exclude(table, exclude_name, with_exprs, options={})
    revert do
      add_exclude(table, exclude_name, with_exprs, options)
    end
  end

  def add_unique_constraint(table, columns, name: nil)
    name ||= "unique_#{columns.join("_")}"
    columns = Array(columns)
    reversible do |dir|
      dir.up do
        execute <<~"SQL".squish
          alter table #{table}
            add constraint #{name}
            unique (#{columns.map{|c| %Q{"#{c}"}}.join(", ")})
        SQL
      end

      dir.down do
        execute "alter table #{table} drop constraint #{name}"
      end
    end
  end

  def drop_unique_constraint(table, columns, name: nil)
    revert do
      add_unique_constraint(table, columns, name: name)
    end
  end

  def replace_foreign_key(from_table, to_table, options, new_options)
    reversible do |dir|
      dir.up do
        remove_foreign_key from_table, options
        add_foreign_key from_table, to_table, options.merge(new_options)
      end
      dir.down do
        remove_foreign_key from_table, options.merge(new_options)
        add_foreign_key from_table, to_table, options
      end
    end
  end
end
