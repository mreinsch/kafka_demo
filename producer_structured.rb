#!/usr/bin/env ruby

require "kafka"
require "json"

kafka = Kafka.new(seed_brokers: ['kafka:9092'])
producer = kafka.producer

10.times do |n|
  record = {
    producer: __FILE__,
    message: 'Hello World!',
    number: n
  }
  producer.produce(JSON.dump(record), topic: 'greets')
  producer.deliver_messages
  sleep 0.2
end
