class Post < ActiveRecord::Base
  has_many :comments ,dependent: :destroy  #post삭제되면 comment 까지 삭제되는 코드
  belongs_to :user
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  #like를 통한 m:n 관계, user테이블과 관계가 있다.
 #has_many :users, through: :likes

  mount_uploader :img, ImgUploader

  # 검증(model validation)
  validates :title, presence: {message: "제목을 입력해주세요."},
                    length: {maximum: 30,
                            too_long: "제목은 %{count}자 이내로 입력해주세요." }
  validates :content, presence: {message: "내용을 입력해주세요."}

end
