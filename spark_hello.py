from pyspark.sql import SparkSession
import socket

spark = SparkSession.builder \
    .appName("PrintHostnames") \
    .master("spark://mpi-node1:7077") \
    .getOrCreate()
sc = spark.sparkContext

driver_host = socket.gethostname()
rdd = sc.parallelize(range(sc.defaultParallelism), sc.defaultParallelism)
executor_hosts = rdd.map(lambda _: socket.gethostname()).distinct().collect()

print("Hostnames of all Spark nodes (including driver):")
print(driver_host, "(driver)")
for host in executor_hosts:
    print(host, "(executor)")

spark.stop()

