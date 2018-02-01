#!/usr/bin/env ruby

require "kafka"

kafka = Kafka.new(seed_brokers: ['kafka:9092'])

kafka.each_message(topic: 'greets') do |message|
  puts "#{message.topic}.#{message.partition}##{message.offset}: #{message.value}"
end
