#!/usr/bin/env ruby

require "kafka"

kafka = Kafka.new(seed_brokers: ['kafka:9092'])
producer = kafka.producer

10.times do |n|
  producer.produce("Hello World! #{n}", topic: 'greets', partition: n%4)
  producer.deliver_messages
  sleep 0.2
end
