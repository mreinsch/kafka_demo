#!/usr/bin/env ruby

require "kafka"

kafka = Kafka.new(seed_brokers: ["kafka:9092"])
producer = kafka.async_producer

at_exit { producer.shutdown }

10.times do |n|
  producer.produce("#{__FILE__} says Hello World! #{n}", topic: 'rugb-test')
  producer.deliver_messages
  sleep 0.2
end
