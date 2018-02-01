#!/usr/bin/env ruby

require "kafka"

kafka = Kafka.new(seed_brokers: ["kafka:9092"])

10.times do |n|
  kafka.deliver_message("#{__FILE__} says Hello World! #{n}", topic: 'rugb-test-2', partition: n%4)
  sleep 0.2
end
