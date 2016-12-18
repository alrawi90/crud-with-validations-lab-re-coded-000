class Song < ActiveRecord::Base
  validates :title ,presence: true
  validates :title, uniqueness: {scope: [:release_year, :artist_name],message: "song title must be unique for the same artist"  }
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if: :is_released?
  validates :release_year, numericality: { less_than_or_equal_to: :now },if: :is_released?
  validates :artist_name, presence: true

  def is_released?
     self.released 

   end
   def now
       Date.today.year
   end

end
