class Card < ApplicationRecord
  belongs_to :pack, optional: true
  belongs_to :box, optional: true
  has_one :cycle, through: :pack

  def filepath
    if box
      return "#{obj_filename(box)}/#{obj_filename(self)}.jpg"
    else
      return "#{obj_filename(cycle)}/#{obj_filename(pack)}/#{obj_filename(self)}.jpg"
    end
  end

  def path

  end

  private

  def obj_filename(obj)
    "#{obj.order} - #{obj.name}"
  end
end
