table "sample_users" {
  schema = schema.public
  column "id" {
    null = false
    type = serial
  }
  column "email" {
    null = false
    type = character_varying(255)
  }
  column "name" {
    null = false
    type = character_varying(255)
  }
  column "created_at" {
    null    = true
    type    = timestamp
    default = sql("now()")
  }
  column "updated_at" {
    null    = true
    type    = timestamp
    default = sql("now()")
  }
  primary_key {
    columns = [column.id]
  }
  index "idx_sample_users_email" {
    columns = [column.email]
  }
  unique "sample_users_email_key" {
    columns = [column.email]
  }
}
schema "public" {
  comment = "standard public schema"
}
