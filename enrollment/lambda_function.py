import requests
import boto3 
from json import loads, dumps

def lambda_handler(event, context):
    list_year = ['2020','2021','2022']
    s3 = boto3.client('s3') 
    for year in list_year:
        url = f"https://educationdata.urban.org/api/v1/schools/ccd/enrollment/{year}/grade-pk/"
        fetch_count = 0
        total_count = 1
        file_number = 0
        while fetch_count <= total_count and url:
            res = requests.get(url)
            data = res.json()
            total_count = data['count']
            url = data["next"]
            #print(url)
            fetched_records = data["results"]
            flatten = str(fetched_records[0])
            for f in fetched_records[1:]:
                flatten = flatten + '\n' + str(f)
            flatten1 = flatten.replace("\'", "\"").replace("None","null")    
            fetch_count = fetch_count + len(data['results'])
            s3.put_object(Body=flatten1, Bucket='bezos-project', Key=f'y={year}/file_name_{file_number}.json') 
            file_number = file_number + 1
    return 0
