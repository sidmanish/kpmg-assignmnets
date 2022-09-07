# kpmg-assignmnets

<h2> Challenge 1</h2>

       Challenge-1 is categorized under assignment-1.
       
       Architecture 
       
       1. Availability zone - 2 
       2. Subnets - 6 (2 public and 4 private)
       3. public subnets have 2 ec2 instances running with support of load balancer in middle
       4. private subnets have RDS db instance
       5. Have created seperate file for each resources and passed the variables throgh vars.tf for modularization
       
    Below resources will be created once  terraform apply will be executed 
    
            VPC
            Application Load Balancer
            Public & Private Subnets
            EC2 instances
            RDS instance
            Route Table
            Internet Gateway
            Security Groups for Web & RDS instances
            Route Table
            
            
    

<h2> Challenge 2</h2>
 Challenge-2 is categorized under assignment-2.
    Have used boto3 library whivh is aws sdk sdk for python.
    Fetched all the metadata related to instances.
    Have attached the output which recieved in various condition.

<h3> Challenge 3</h3>
   Challenge-3 is categorized under assignment-3.
   
   Coded in python.
   
   





