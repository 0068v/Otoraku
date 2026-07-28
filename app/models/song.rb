class Song < ApplicationRecord
    
  validates :title,
    presence: true,
    length: { maximum: 100 }

  validates :vocal,
    presence: true,
    length: { maximum: 100 }
    
  validates :songwriting,
    length: { maximum: 100 }

  validates :url,
    format: {
      with: URI::DEFAULT_PARSER.make_regexp,
      allow_blank: true
    }
    
end
