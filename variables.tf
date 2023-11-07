variable "name" {
  description = "This is the human-readable name of the queue. If omitted, Terraform will assign a random name."
  type        = string
  default     = ""
}

variable "name_prefix" {
  description = "A unique name beginning with the specified prefix."
  type        = string
  default     = null
}

variable "visibility_timeout_seconds" {
  description = "The visibility timeout for the queue. An integer from 0 to 43200 (12 hours)"
  type        = number
  default     = 30
}

variable "message_retention_seconds" {
  description = "The number of seconds Amazon SQS retains a message. Integer representing seconds, from 60 (1 minute) to 1209600 (14 days)"
  type        = number
  default     = 345600
}

variable "max_message_size" {
  description = "The limit of how many bytes a message can contain before Amazon SQS rejects it. An integer from 1024 bytes (1 KiB) up to 262144 bytes (256 KiB)"
  type        = number
  default     = 262144
}

variable "delay_seconds" {
  description = "The time in seconds that the delivery of all messages in the queue will be delayed. An integer from 0 to 900 (15 minutes)"
  type        = number
  default     = 0
}

variable "receive_wait_time_seconds" {
  description = "The time for which a ReceiveMessage call will wait for a message to arrive (long polling) before returning. An integer from 0 to 20 (seconds)"
  type        = number
  default     = 0
}

# variable "policy" {
#   description = "The JSON policy for the SQS queue"
#   type        = string
#   default     = null
# }

variable "redrive_policy" {
  description = "The JSON policy to set up the Dead Letter Queue, see AWS docs. Note: when specifying maxReceiveCount, you must specify it as an integer (5), and not a string (\"5\")"
  type        = string
  default     = ""
}

variable "receive_count" {
  description = "The number of times that a message can be retrieved before being moved to the dead-letter queue"
  type        = number
  default     = 3
}

variable "fifo_queue" {
  description = "Boolean designating a FIFO queue"
  type        = bool
  default     = true
}

variable "fifo_throughput_limit" {
  type        = string
  description = "pecifies whether the FIFO queue throughput quota applies to the entire queue or per message group. Valid values are `perQueue` (default) and `perMessageGroupId`."
  default     = "perQueue"
}

variable "deduplication_scope" {
  type        = string
  description = "Specifies whether message deduplication occurs at the message group or queue level. Valid values are `messageGroup` and `queue` (default)."
  default     = "queue"
}

variable "content_based_deduplication" {
  description = "Enables content-based deduplication for FIFO queues"
  type        = bool
  default     = true
}

variable "tags" {
  description = "A mapping of tags to assign to all resources"
  type        = map(string)
  default = {
    Name = ""
    ENV  = ""
  }
}