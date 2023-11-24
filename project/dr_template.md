# Infrastructure

## AWS Zones
I will use us-east-2 region, with AZs
- us-east-2a
- us-east-2b
For DB will use other region us-west-1
- us-west-1c
- us-west-1d

```
aws ec2 describe-availability-zones --region us-east-2
```

## Servers and Clusters

### Table 1.1 Summary
| Asset        | Purpose                                  | Size                            | Qty                | DR                                                                                                                              |
|--------------|------------------------------------------|---------------------------------|--------------------|---------------------------------------------------------------------------------------------------------------------------------|
| Load balacer | distribute traffic to behind web servers | AWS Network Load Balancer       | 2 (1 per AZ)       | deployed in 2 AZs with dns failover                                                                                             |
| Instances    | VM which host our webserver              | t3.medium (can add bigger later)| 3 instances        | Deployed in multi AZs in case zone outage                                                                                       |
| k8s          | hoat monitoring and our applications     | eks cluster                     | 3 node             | for availability and quorum voting                                                                                              |
| VPC          | Containe all resources per               |                                 | 1                  | Creating Subnets in 2 AZs                                                                                                       |
| monitoring   | monitor our backup and performance       | 1                               | 1                  |                                                                                                                                 |
| SSH key      | Access auth to servers                   |                                 | 1                  | save it in safe place, and maybe encrypted bucket                                                                               |
| DB           | save our info in db                      | master & slave                  | 3 nodes per region | we will have 3 db nodes in main region, with R/W, and other 3 nodes in diffrent region as replica and support Read opearartions |
| image        | For customer image, need id per region   |                                 |                    | save image in bucket in case we lost it                                                                                         |

### Descriptions
Load balancer: is resposable to route traffic to servers behind it, so we can add more servers in future without any problem, also it have VIP 
Instances:  VMs that running our application 
Kubernets: EKS that create k8s cluster and running applicationa dn monitoring, and other application we need 
VPC: Is the main thing in AWs that conatin all resources in our AZ, and they are isolated from our side, nned to create IGW and routing tables to access resources and they can access internet, Also we can add route to connect multi VPCs in diffrent Regions
DB: need at least ood number, at least 3 numbers for master election, 
Image: may be we made custome image, and we need to know its ami and save backup from it

## DR Plan
### Pre-Steps:
List steps you would perform to setup the infrastructure in the other region. It doesn't have to be super detailed, but high-level should suffice.
- Create a copy from my current IaC 
- Change region
- Create new bucket in this region, to store stat file their
- For DB
    - Create master in region A
    - Creating Replica in region B
    - Define in replica master cluster arn to replicate from
    - Create backup rotaion every 5 days
    - setup monitor in other region to monitor backup and cluster status

## Steps:
You won't actually perform these steps, but write out what you would do to "fail-over" your application and database cluster to the other region. Think about all the pieces that were setup and how you would use those in the other region
- Replicate/deploy all infra to 2nd region
- Switch replica DB to become master in 2nd region
- Modify DNS wth VIP of LB in 2nd region
