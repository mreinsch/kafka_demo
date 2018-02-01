docker exec kafka_kafka_1 /opt/kafka/bin/kafka-topics.sh --zookeeper zookeeper --create --topic greets --partitions 4 --replication-factor 1
