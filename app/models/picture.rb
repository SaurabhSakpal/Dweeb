class Picture < ActiveRecord::Base
belongs_to :user
validates_format_of :content_type,
		    :with => /^image/,
		    :message => "--- you can only upload pictures"

end
