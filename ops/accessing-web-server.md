SOP: Securely Accessing the Website Server
SOP ID: TEC-SOP-001

Version: 1.0

Status: Final

Author: Omar Oubari, Mohammed Mamdouh

Last Updated: 2025-08-03

1.0 Purpose
To define the standard, secure procedure for authorized personnel to access the production website server (10.10.0.20) via the designated jumper server / bastion host (16.24.140.33). This SOP ensures that private keys are never exposed on intermediate servers.

2.0 Scope
This procedure applies to all developers, system administrators, and authorized personnel requiring SSH access to the website server environment.

3.0 Prerequisites
Before starting, ensure you have the following:

An approved SSH client installed on your local machine (e.g., OpenSSH, PuTTY).

Your assigned SSH private key file (e.g., key-file-name.pem).

The necessary permissions granted by the infrastructure team to access both the jumper and website servers.

4.0 Procedure
This process uses SSH Agent Forwarding to securely connect through the jumper server without copying your private key.

Part 1: Prepare Your Local SSH Agent
This step securely loads your key into your local machine's SSH agent, so you don't have to manually specify it for each connection. This only needs to be done once per terminal session or reboot.

Set Key Permissions (One-Time Setup)
On your local machine, open a terminal (like Terminal on macOS, or Git Bash/WSL on Windows) and run the following command to restrict permissions for your private key file. This is critical for security.

chmod 400 /path/to/your/key-file-name.pem

Add Your Key to the SSH Agent
Add your SSH private key to your local SSH agent.

ssh-add /path/to/your/key-file-name.pem

You may be prompted for your key's passphrase if you set one.

Part 2: Connect to the Jumper Server
Establish Connection with Agent Forwarding
Connect to the jumper server using the -A flag. This flag enables agent forwarding, which allows the jumper server to use your local SSH agent to authenticate the next hop.

ssh -A ec2-user@16.24.140.33 or ssh -i /path/to/your/key-file-name.pem ec2-user@16.24.140.33

You should now be successfully logged into the jumper server's command line.

Part 3: Connect to the Website Server
Hop to the Final Server
From the jumper server's command line, connect to the final website server. Because agent forwarding is active, you do not need to specify the key again.

ssh -i /path/to/your/key-file-name.pem ec2-user@10.10.0.20

You are now successfully connected to the website server.

5.0 Logout Procedure
When you have finished your work, you must exit both sessions properly.

Exit Website Server: Type exit and press Enter.

exit

Exit Jumper Server: You will be returned to the jumper server session. Type exit and press Enter again to close the final connection.

exit
