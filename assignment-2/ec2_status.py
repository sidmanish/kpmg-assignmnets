# aws sdk for python 
import boto3

# with client we can called low level resources in aws 
ec2_client = boto3.client('ec2')

# calling describe instance, it contains all the metadata associated with instance e.g key , groups etc
reservations = ec2_client.describe_instances()

#describe_instance_status is used to fetch intsnace specific metadata
statuses = ec2_client.describe_instance_status(IncludeAllInstances=True)

print(reservations)

print("#################################################")
print("#################################################")
print(statuses)
print("#################################################")
print("#################################################")

# fetching all the instaces with name, status, system status
for status in statuses['InstanceStatuses']:
    ins_status = status['InstanceStatus']['Status']
    sys_status = status['SystemStatus']['Status']
    state = status['InstanceState']
    print(f"Instance {status['InstanceId']} is {state['Name']} with instance status  {ins_status} and system status is {sys_status}")

