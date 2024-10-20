**Cloud Assignment 3: Docker Automation Project**

This project showcases the creation of a Docker container that automates text processing using a Python script. The container reads two input text files, analyzes word counts, identifies the top frequent words, and retrieves the machine's IP address, all while automating the execution and output generation. Additionally, the project offers optional orchestration using Kubernetes to manage multiple container replicas.


**Overview**

The Python script (script.py) within the container reads IF.txt and AlwaysRememberUsThisWay.txt from the /home/data directory. It performs several tasks:

Counts the total number of words in each file.
Calculates the grand total of words across both files.
Identifies the top three most frequent words in each file, handling contractions (e.g., transforming "I'm" to "I" and "am").
Retrieves the IP address of the machine running the container.
Outputs all results to result.txt located in /home/data/output/ and also prints the results to the console.
This project highlights the use of lightweight Docker images, Python for text processing, and Kubernetes for container orchestration.


**Project Structure**

├── script.py          
├── Dockerfile         
├── deployment.yaml    
├── data/              
│   ├── IF.txt         
│   ├── AlwaysRememberUsThisWay.txt  
├── output/            
│   └── result.txt     


**Key Components:**

1. Dockerfile

The Dockerfile uses a lightweight Python image (python:3.9-slim). It copies the Python script and input files into the container and sets the Python script as the entry point for execution.

2. Python Script (script.py)
   
The script performs the following functions:

Reads text files and splits words while managing contractions.
Counts total words in each file and identifies the top three frequent words.
Retrieves the machine's IP address using the socket library.
Writes all results to /home/data/output/result.txt.

3.Kubernetes Deployment (deployment.yaml)

The Kubernetes configuration deploys two replicas of the container for scalability and reliability. You can monitor the deployment using commands like:

kubectl get pods > kube_output.txt  
cat kube_output.txt  


**Usage**

1. Build and Run the Docker Container:
Ensure Docker is installed and running on your machine, then execute:

docker build -t cloud-assignment-3 .  
docker run -v $(pwd)/data:/home/data cloud-assignment-3  

2. Output Verification:
The script generates output in result.txt located in the /home/data/output directory. The console displays:

Word counts for each file.
Top three frequent words from each file.
Grand total of words.
The machine's IP address.

3. Kubernetes Orchestration (Optional):
To apply the deployment, use:

kubectl apply -f deployment.yaml  


**Expected Output (Sample)**

Total words in IF.txt: 300  
Total words in AlwaysRememberUsThisWay.txt: 250  
Grand total of words: 550  

Top 3 words in IF.txt:  
- if: 15  
- you: 10  
- can: 8  

Top 3 words in AlwaysRememberUsThisWay.txt:  
- always: 12  
- remember: 10  
- way: 8  

IP Address of the machine running the container: 192.168.1.10  


**Extra Credit (Kubernetes Orchestration)**

The project includes a deployment.yaml file to configure two replicas of the container, ensuring scalability and fault tolerance. You can check the status of the deployed containers using:

kubectl get pods  


**Conclusion**
This project demonstrates the effectiveness of Docker for automating tasks and optimizing workflows. The integration of Kubernetes adds a layer of scalability and management for container deployments. Through this assignment, you have created an end-to-end solution that efficiently reads, processes, and outputs data within a container environment.
