class Book < ApplicationRecord
   has_one_attached :profile_image　#ユーザーのプロフィール画像に対してActiveStorageによるhas_one_attachedの指定はprofile_image
end
