#!/usr/bin/env ruby

require "kafka"

kafka = Kafka.new(seed_brokers: ["kafka:9092"])
consumer = kafka.consumer(group_id: "rugb-group-1")
consumer.subscribe("rugb-test", start_from_beginning: true)

at_exit { consumer.stop }

consumer.each_message do |message|
  puts "#{message.topic}.#{message.partition}##{message.offset}: #{message.value}"
end
