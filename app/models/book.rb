class Book < ApplicationRecord
   has_one_attached :profile_image　#ユーザーのプロフィール画像に対してActiveStorageによるhas_one_attachedの指定はprofile_image
   belongs_to :user
   
   # def get_image
   #  unless image.attached?
   #     file_path = Rails.root.join('app/assets/images/no_image.jpg')
   #     image.attach(io: File.open(file_path), filename: 'sample.png', content_type: 'image/png')
   #  end
   #     image
   # end
  
end