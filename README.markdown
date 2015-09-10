#A Quick How-To

###Some Basic Workflows in the System
####Creating an Election and Adding Candidates
1. Go to the URL for the voting system and log in. The first screen you should see as an admin is your dashboard.
2. Navigate to elections (found in the nav bar) and find the button on the far right of the page called **New Election**. Click it.
3. Fill out the form:
  * Name your election something sensible
  * Choose how many candidates you want your voters to be able to select (ask someone or read the by-laws. it changes for each election)
  * Select the class years that are allowed to vote (make sure only juniors can vote in the presidential election and seniors can vote in dorm senator elections and whatnot)
  * Choose the start and end time for the election. I know it's a pain in the ass to select military time, but at least you don't have to select in standard time (which does not account for time zone differences)
  * Check *active*. This makes it so that you can add candidates to this election and see the results of it in the dashboard. Make a habit of unchecking the active box when an election has passed and its results determined.
  * Check *ranked* if the election requires voters to rank their candidates. I believe this is only the presidential election, but always ask!
4. Click create election and pat yourself on the back
5. Navigate over to candidates
6. Click **New Candidate** and fill out the form. **MAKE SURE YOU SPELL THEIR NAME CORRECTLY.** Select which election they belong to using the select box. If the election you want is not there, go back to the election and make sure that its *active* box is checked.
7. Click **Create Candidate** and repeat with however many candidates you have.
8. **Note:** The election will automatically open and close. Assuming you entered the start and end times correctly, you shouldn't need to touch anything once you get the candidates added.

####Updating an Election
1. There are two ways to get to an election's update page:
  * If the election is active, just go to the dashboard and click **Edit Election** on the far right of the election's panel
  * You can also navigate to the **Election** page and click the **Edit** link in the far right column
2. Once on the update page, everything is pretty self explanatory. Just change the fields that you want. However, there is some funky business going on, and there are some general things you should do:
  * Make it a habit to uncheck *active* once an election is complete/results have been decided. It just keeps everything clean
  * **IMPORTANT:** whenever you update an election, you'll need to re-set the *years* field. The way this value is stored in the system is funky, so you'll just have to bear with this and remember to fill out this field every time you need to make any change to an election.

####Making Someone an Admin
1. You'll probably need to make elections board people admins every once in a while. It's pretty straightforward.
2. Navigate to the **Users** page and click the **Edit** link next to the user you'd like to alter.
3. Check/uncheck *admin*. Pretty easy.
4. Make sure to remove admins as they graduate (**EXCEPT FOR ME** in case I need to fix anything), and don't de-admin yourself.

###Server Stuff
Do yourself a favor, and get yourself the GitHub student pack so that this is free.
####Getting a Virtual Machine
1. I recommend getting a virtual machine (henceforth abbreviated with vm) from digital ocean. Once you sign up, you should be able to create something called a *droplet*. This is just a fancy name for a vm.
2. The **$20/month** tier should be plenty. You don't need that much processing for 600 kids; computers are fast.
3. Use one of the New York regions
4. Under **Select Image** tab over to **Snapshots** and select the most recent snapshot that you used for an election (or if you're just starting out, the snapshot that was transferred to you by the last director).
5. Add an SSH key. Don't access your server with that root password shit. SSH keys are glorious and hella secure. If you've never used them, they're pretty well documented, so read up.
6. Click create droplet
7. Once everything with the VM is done, you should be able to see the system at the IP address provided. Of course, people don't like IP addresses, so move on to the Domain Linking section

####Linking the Domain Name
1. I use NameCheap for my domain names. I'll transfer the SG domain name to one of you at some point so that I don't have to pay for it anymore. It'll be your responsibility to seek reimbursement from SG.
2. Log into your account, and under **Account Information** click the **view** link next to *Number of domains in your account*.
3. Click the **ncssmelections.com** link.
4. In the sidebar, under **Host Management** click **All Host Records**.
5. Change the IP addresses in the *@* and *www* fields to the IP address of your VM.
6. Click **save changes** at the bottom of the page.
7. It'll take a few minutes for changes to propagate, so wait a while, then verify that everything is working.

####Powering Down After an Election
1. Go to digitalocean and log in
2. Click the droplet name of the eleciton
3. In the sidebar, click **Power**, then click the **Power Off** button. Wait for that to finish.
4. In the sidebar, click **Snapshots**, then take a snapshot. Name it something specific, like *NCSSM SG 2015 Presidential Election*. Wait a long while.
5. In the sidebar, click **Destroy**, and make sure the *scrub data* box is checked. You need to destroy a VM in order to stop being charged for it.

###Transferring Everything to New Directors
1. Get them a GitHub student pack so they don't have to pay for everything.
2. Add them to this repository.
3. Get them signed up with Digital Ocean and transfer the last used snapshot to one of their accounts.
4. Get them signed up with NameCheap and transfer the SG domain name to their account
5. Hope that nothing goes terribly wrong so that you don't have to spend glorious college time fixing it.
