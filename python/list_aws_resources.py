import boto3

def get_regions():
    client = boto3.client('ec2','us-west-2')
    describe_regions = client.describe_regions()

    regions_list = []

    for region in describe_regions["Regions"]:
        regions_list.append(region["RegionName"])

    return(regions_list)
          
def get_resources(region):
    client = boto3.client('resourcegroupstaggingapi', region)
    resources = client.get_resources()

    resourceARN = []

    for resource in resources["ResourceTagMappingList"]:
        resourceARN.append(resource["ResourceARN"])

    return resourceARN

for region in get_regions():

    for resource in get_resources(region):
        if resource is not None:
          print("Region: " + region)
          print("Resources: ")
          print(resource)



