class Request < ActiveRecord::Base
   enum status: {
    pending: 'pending',
    processing: 'processing',
    releasing: 'releasing',
    released: 'released'
  }
end