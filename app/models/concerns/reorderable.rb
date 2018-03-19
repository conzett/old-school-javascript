module Reorderable
  extend ActiveSupport::Concern

  included do
    before_commit :reorder, if: :position_changed?, unless: :newly_created?
    before_create :set_position
    def reset_all
      siblings.each.with_index(1) { |s, i| s.update_column :position, i }
    end
  end

  def reorder
    from, to = previous_changes[:position]
    move_down(from, to) if from < to
    move_up(from, to) if from > to
  end

  def move_up(from, to)
    siblings
    .where.not(id: self)
    .where(column.lt(from))
    .where(column.gteq(to))
    .update_all update_sql(:+)
  end

  def move_down(from, to)
    siblings
    .where.not(id: self)
    .where(column.gt(from))
    .where(column.lteq(to))
    .update_all update_sql(:-)
  end

  def update_sql(sign)
    "position = position #{sign} 1, updated_at = '#{Time.current}'"
  end

  def position_changed?
    attribute_previously_changed? :position
  end

  def newly_created?
    attribute_previously_changed? :id
  end

  def set_position
    self.position = siblings.count + 1
  end

  def column
    self.class.arel_table[:position]
  end
end
