Compute Engine
===
In this lab you will create and set startup and shutdown scripts to new and existing Compute Engine instances 

Prerequisites
---

- You must have Cloud SDK installed.

Startup Scripts
---
Create a Compute Engine instance and check that the startup runs.

1. Go to Cloud Console and create a new project. Set the project on your computer using gcloud: 
       
    `gcloud config set project [project_id]`
    
1. Create the Compute Engine instance. 
    
    Create instance name apache-instance: 

    `gcloud compute instances create apache-instance --tags=http-server --metadata-from-file startup-script=startup.sh`
    
    Enable access on port 80:

    `gcloud compute firewall-rules create default-allow-http --direction=INGRESS --priority=1000 --network=default 
        --action=ALLOW --rules=tcp:80 --source-ranges=0.0.0.0/0 --target-tags=http-server`

1. Check that the VM can be accessed in browser on port 80.  

1. Go to Cloud Console, Compute Engine section, and check that the VM is was created. Your VM should be listed on the `VM` page. Click on the VM name and check the metadata 
   section. You should see the script associated to the `startup-script` key under `Custom metadata`
   
   On the top of the page check the `Serial port 1 (console)` logs to see that the  `VM is ready!` text was written to console.
   
Shutdown Scripts
---
Edit the previously created instance to set a shutdown script to be executed on instance shutdown.

1. Edit the instance using the gcloud command below:
    
    `gcloud compute instances add-metadata apache-instance --metadata-from-file shutdown-script=shutdown.sh`
    
1. Go to VM details page in Cloud Console and check that the script was added as a `Custom metadata` entry.

1. Login to the VM using ssh and run 
    
    `sudo shutdown -t now`
    
    to stop the VM.
    
1. After one minute check that the machine is shown as stopped in Cloud Console and the VM is unavailable on port 80.

Cleanup
--- 

Remove the VM:
    `gcloud compute instances delete apache-instance`

To wrap it up
---
In this lab you used `gcloud`:
- created a Compute Engine instance.
- added a startup script to the new VM.
- enabled access on HTTP.
- checked the instance details in Cloud Console.
- check console logs.
- added a shutdown script to the existing VM.
- stopped the VM.
- removed the VM.

References
---
This lab is based on the Google Cloud documentation for 
[startup scripts](https://cloud.google.com/compute/docs/startupscript),
[shutdown scripts](https://cloud.google.com/compute/docs/shutdownscript1) 
and [serial console](https://cloud.google.com/compute/docs/instances/viewing-serial-port-output)