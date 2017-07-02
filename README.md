#DB設計

# User

| column     | type        | null         | unique   |
|:-----------|------------:|:------------:|:--------:|
| name       | string      | false        |true      |
| email      | string      | false        |true      |
| password   | string      | false        |          |
| image      | text        |              |          |
| member     | string      |              |          |
| profile    | text        | false        |          |
| work       | string      |              |          |



  ・**assosiation**
  has_many :prototypes

  has_many :comments

  has_many :Likes

  ・**index**
     name

     email

# prototype

| column     | type        | null         | unique   |
|:-----------|------------:|:------------:|:--------:|
| title      | string      | false        |          |
| catch_copy | string      | false        |          |
| concept    | text        | false        |          |
| user_id    | references  | false        | true     |


 ・**assosiation**
  has_many   :comments
  has_many   :capture_images
  has_many   :Like
  belongs_to :user

 ・**index**
  user_id

# Like
| column       | type        | null         | unique   |
|:------------:|------------:|:------------:|:--------:|
| prototype_id | references  | false        | true     |
| user_id      | references  | false        | true     |

 ・**assosiation**
    belongs_to :prototypes
    belongs_to :user

 ・**index**
    prototype_id
    user_id

# Commemt

| column       | type        | null         | unique   |
|:------------:|------------:|:------------:|:--------:|
| content      | text        |              |          |
| user_id      | references  | false        | true     |
| prototype_id | references  | false        | true     |

 ・**assosiation**
    belongs_to :user
    belongs_to :prototype

 ・**index**
    user_id
    prototype_id

# CaptureImage
| column       | type        | null         | unique   |
|:-------------|------------:|:------------:|:--------:|
| content      | text        | false        |          |
| status       | integer     | false        | true     |
| prototype_id | references  | false        | true     |

 ・**assosiation**
 belongs_to :prototype

 ・**index**
    user_id

    prototype_id
