# PGR301 2021 Exam February
* NB: **This task was done on a MAC. But I have provided a guide for Windows aswell.**
* NB: **I personally used: https://travis-ci.org for my builds.** But have instructions for travis-ci.com as well.
* NB: **This readme has been structured with the information and instructions around each exercise given by: https://github.com/PGR301-2020/konte , so please refer here if you feel some steps may be missing.**
---
#### Prerequisites
* Have a google account so you can access: https://console.google.cloud.com
* Have **Billing** enabled for your account, this is so you can be able to create and manage Service-Accounts. 
## EX02
### Setting environment variables
* To set the environment variable(s) for usage in variable.tf you can run either of these commands in the terminal/shell of the project:
* For Mac/Linux: ```export bucketname=<your bucket name>```
* For Windows: ````set bucktname=<your bucket name>````


Note: "your bucket name" needs to be globally-unique and the bucketname after export is just a "placeholder" for the given name we shall use later when setting the terraform (TF) variables.
* Then you do the same for the project_id:
* For Mac/Linux: ```export projectid=<your project id>```
* For Windows: ```set projectid=<your project id>```

Note: "your project id" is the name of the gcp-project you have currently selected, which is displayed on the Google cloud console website in the top-header.

* Then to bind the newly created environment variables to  the variables.tf file, run the following command:
* For Mac/Linux: ```export TF_VAR_bucket_name=$bucketname``` and ```export TF_VAR_project_id=$projectid```
* For Windows: ```set TF_VAR_project_id=%projectid%``` and ```set TF_VAR bucket_name=%bucketname%```

### Using your own Service-Account and GCP key
1. Go to your Google Cloud Console / Website.
2. In the searchbar type in **IAM & Admin** and click it.
3. Click on **Service Account** in the left-hand menu.
4. Click on **+Create Service Account**, located under the top-header.
5. Type in your desired service account name, then click **Create**.
6. Search for and add the given **roles**: Service Account User, Storage Admin and Cloud Run Admin. If you´d like, add Compute Admin and Service Account Admin, as well. As these two latter will be used in the next exercise. (Note: these last two are not needed for this part and can be manually added later).
7. Click **Done**, and your Service Account, is now created.
8. Click on your service account which should now be displayed after an automated redirection.
9. On the same page click on the tab **"Keys"**.
10. Click on **Add Key -> Create new key** and select JSON-format and click create.
11. You will now receive/download your JSON service file, copy it and keep it confidential / hidden, as it will work as a direct access to your service account.
12. Create a file named **"google-key.json"** in the root of the project, the filename needs to be identical as it is set in provider.tf (and later .travis.yml) to look for this file.
13. Paste inn the JSON file you copied in step 11, into the newly created file: **google-key.json.**
---
* Now you can/should be able to run the command(s) ```terraform init``` and ```terraform apply``` without issues. And your bucket should be created and available (Note: make sure to be in the init folder when running these commands). To check if you did it correctly: Navigate back to the GCP website and search for **Bucket** or **Storage** click it, and it should be displayed under **"Storage browser"**, with the name you gave through the environment variable earlier.
* Note: These steps CAN be done through the terminal, but I find the process tedious and volatile.
---
## Ex03
#### Prerequisites
* Under API&Services enable the APIs: Container Registry, Cloud Storage, Cloud Run and **Compute Engine**.
* Personally had to enable Identity and Access Management API for Travis to function properly so I recommend doing this as well.
* Make sure the extra roles mentioned in step 6 of ex02 is/were applied.
---
* Change bucket name in the **backend.tf** file, to the one specified earlier (environment variables) with the export/set command. If you don`t remember you can check the name of the latest created bucket on the console website.
* Change **GCP_PROJECT_ID** in the file .travis.yml, under -> env-> global, to your own project id.

* If you are using travis-ci.com instead of travis-ci.org you need to run the command and login with ```travis login --pro``` first.
* In the root of the project run the command: `````travis encrypt-file google-key.json --add````` This will automatically add the openssl commando to the .travis.yml file. Note: if you are using travis-ci.com swap --add, with --pro. I`ve noticed a "bug" where travis.com wont pass sometimes on github if not added with --pro and manually added to .travis.yml, while the .org passes just fine). 
If you did not choose --add in the encrypt-command, an openssl command will be printed in the terminal, copy it, and do not lose it.
* Paste the openssl command in the file .travis.yml, under --> **before_install**. If there is a similar line already there, replace it instead.
* Remember to set the travis env TF_ENV before pushing a build (as specified in the exam repo). 
---
Finally commit and push your changes by:
1. ````git add .```` which should be fine considering the gitignore file in the root of the project. Note: Be absolutely sure you named your **key** acording to the instructions, or it will get exposed and/or wont get encrypted.
2. ````git commit -m "some random name"````
3. ````git push -u origin master````
* You should now be able to see travis build the project and apply the given requirements on either travis-ci.org or travis-ci.com. **Note: Please make sure you have enabled the cloned repo/fork on your desired website.**