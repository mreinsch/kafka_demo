# Ruby Kafka Demo

## Preparation

1. Clone the repo, directory name has to be `kafka` otherwise the scripts `kafka_create_topic.sh` and `kafka_tail_topic.sh` won't work
2. Add `::1 kafka` to your `/etc/hosts`
3. Create docker network: `docker network create -d bridge test`
4. Start kafka in docker: `docker-compose up -d`

## Demo

1. create Kafka topic: `kafka_create_topic.sh`
2. tail Kafka topic: `kafka_tail_topic.sh`
3. simplest producer: `producer_simple.rb`
4. consume with simplest consumer: `consumer_simplest.rb`
   - note the order
   - run second time: not storing offset
   - but both consumers receive all events
5. consume with group: `consumer_group.rb`
   - first run got all events
   - running in parallel splits events by partition
   - each consumer in the group is exclusively processing events from a partition
   - so events are always processed in correct order within a partition, events can't overtake others on consumer side
   - stopping a consumer shifts events to running consumer
   - starting consumer again splits processing
   - can only start up to four consumers for this topic
   - partitions are assigned randomly
6. produce with specifying partition: `producer_partition.rb`
   - not very practical, need to know how many partitions
7. produce with partition key: `producer_partition_key.rb`
   - simpler - can just use some records ID for instance
8. for production use: async producer: `producer_async.rb`
9. simpler with thresholds: `producer_async_2.rb`
   - don't need to call `deliver_messages` anymore
10. for producing structured messages, you just generate JSON for example: `producer_structured.rb`

## Cleanup

1. Stop the docker containers: `docker-compose down`
