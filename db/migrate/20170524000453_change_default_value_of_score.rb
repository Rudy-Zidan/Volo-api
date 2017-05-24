class ChangeDefaultValueOfScore < ActiveRecord::Migration[5.0]
  def change
    change_column_default :players, :score, 0
  end
end
