class Card < ApplicationRecord
  belongs_to :pack, optional: true
  belongs_to :box, optional: true
  has_one :cycle, through: :pack

  def filepath
    if box
      return "#{obj_filename(box, 2)}/#{obj_filename(self, 3)}.jpg"
    else
      return "#{obj_filename(cycle, 2)}/#{obj_filename(pack, 2)}/#{obj_filename(self, 3)}.jpg"
    end
  end

  def path

  end

  private

  def obj_filename(obj, n)
    ord = obj.order.to_i.to_s.rjust(n, '0')
    "#{ord} - #{obj.name}"
  end
end
