import boto3

ec2_re = boto3.resource('ec2')
ec2_cl = boto3.client('ec2')

for each_in in ec2_re.instances.filter(Filters=[
    {
        'Name': 'availability-zone',
        'Values': ['ap-south-1c']
    }
]):
    print('Instance id is {} and Instance Type is {}'.format(each_in.instance_id,each_in.instance_type))
