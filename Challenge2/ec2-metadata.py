import boto3

#Creating client session for EC2 service
ec2_cl = boto3.client('ec2')

#Using Describe instance method to get metadata
ec2 = ec2_cl.describe_instances()

#Creating file to upload output
f = open('ec2_metadata.json', 'w') 

#Running loop to get metadata of all EC2's in account
for each_ec2 in ec2['Reservations']:
    # print(each_ec2)
    # metadata = each_ec2
    f.write(str(each_ec2))
    f.close()





