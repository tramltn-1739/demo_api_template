require "redis"

redis_conf  = YAML.load(File.join(Rails.root, "config", "redis.yml"))
REDIS = Redis.new(:host => redis_conf["host"], :port => redis_conf["port"])

#3 giây chỉ đc 1 request
THROTTLE_TIME_WINDOW = 0.00001 * 60
THROTTLE_MAX_REQUESTS = 60
