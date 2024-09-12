## Steps
* Create a VPC
* Create a Subnet 
* Create a IGW
* Create a new route table and add route table association to it 
* Create a Security Group for 80, 22, 8080
* Create a key pair locally (In your local machine)
* Create a EC2 machine with the above created Subnets, keypair, SG's
    * Make sure that this VM is having `docker` installed on it . 
    * When the Ec2 machine is creatad, there sholuld be a `container` running inside the EC2.
    * we should be able to access the container form the EC2 ip address 
* Use Variables, output block for input and output variables 

