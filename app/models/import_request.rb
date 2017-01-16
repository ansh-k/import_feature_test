class ImportRequest < ApplicationRecord
  default_scope { order(created_at: :desc) }
  
  mount_uploader :import_file, ImportFileUploader

  IMPORT_FOR = { 
                 product: 'Product', 
                 in_transit: 'InTransitInventory', 
                 on_hand: 'OnHandInventory'
               }
end
