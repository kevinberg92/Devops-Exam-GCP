### PGR301 2021 Exam February Ex02
This task was done on a MAC. But I have provided a guide for Windows aswell.
####Setting environment variables
* To set the environment variable(s) for the variables given in variable.tf you can run either of these commands in the terminal/shell the project:
* For Mac/Linux: ```export bucketname=<your bucket name>```
* For Windows: ````set bucktname=<your bucket name>````


Note: your bucket name needs to be globallyUnique and bucketname after export is just a placeholder for the given name we shall use later when setting the TF vars.
* Then you do the same for the project_id:
* For Mac/Linux: ```export projectid=<your project id>```
* For Windows: ```set projectid=<your project id>```

Note: projectid is the name on your gcp-project

* Then you bind the env.vars to the declared variables in variables.tf
* For Mac/Linux: ```export TF_VAR_bucket_name=$bucketname``` and ```export TF_VAR_project_id=$projectid```
* For Windows: ```set TF_VAR_project_id=%projectid%``` and ```set TF_VAR bucket_name=%bucketname%```

####Using your own ServiceAccount and GCP key
1. Go to your Google Cloud Platform console
2. In the searchbar type in IAM & Admin
3. Click on Service Account in the lefthand menu
4. Click on +Create Service Account located under the top header
5. Type in your desired Service account name, then click Create
6. Search for and add the given roles: Service Account User, Storage Admin and Cloud Run Admin.
7. Click Done, and your Service Account is now created.
8. Click on your service account now displayed after redirection.
9. Click on the tab "Keys".
10. Click on Add Key -> Create new key and select JSON and click create.
11. You will now receive/download your JSON service file, copy it.
12. Create a file called "google-key.json" under the init folder in the project, the filename is case sensitive as it is set in provider.tf to look for this file.
13. Paste inn the JSON file you copied in step 11.
* Now run the command(s) ```terraform init``` and ```terraform apply```. And your bucket should be created and available. To check if you did it correctly: Navigate back to the GCP website and search for Bucket / Storage and it should be displayed under "Storage browser", with the name you gave through the env.vars earlier.