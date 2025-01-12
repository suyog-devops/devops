# Jenkins Job with GitHub Webhook Trigger

This repository contains a **Jenkins pipeline job** configured to automatically trigger builds whenever a commit is pushed to the `main` branch of the associated GitHub repository. The build process is initiated via a **GitHub webhook**.

## Overview

The Jenkins job is designed to:
1. Automatically trigger builds upon commits to the `main` branch.
2. Use a GitHub webhook to notify Jenkins of changes in the repository.

## Prerequisites

Ensure the following requirements are met before proceeding:

- **Jenkins server**:
  - Jenkins is installed, running, and has internet access.
  - The **GitHub Plugin** and **GitHub Webhook Plugin** are installed in Jenkins.
  - The Jenkins server URL is publicly accessible (or a tunnel is set up) for GitHub to send webhook notifications.

- **GitHub repository**:
  - The repository is hosted on GitHub.
  - You have admin access to configure webhooks for the repository.

## Setup Steps

Follow these steps to configure the Jenkins job and GitHub webhook:

### 1. Set Up a GitHub Webhook

To enable Jenkins to receive notifications from GitHub:

1. Navigate to your GitHub repository's **Settings**.
2. In the left sidebar, select **Webhooks**.
3. Click **Add webhook**.
4. Fill in the webhook details:
   - **Payload URL**: Enter your Jenkins webhook URL in the format:  
     `http://<jenkins-server>/github-webhook/`  
     Replace `<jenkins-server>` with the actual URL of your Jenkins server.
   - **Content type**: Select `application/json`.
   - **Events to trigger this webhook**: Choose **Just the push event**.
5. Click **Add webhook** to save the configuration.

Once configured, this webhook will notify Jenkins of any push to the repository, including commits to the `main` branch.

---

### 2. Create a Jenkins Job

1. Log in to your Jenkins dashboard and click **New Item**.
2. Enter a name for your job (e.g., `github-webhook-trigger`).
3. Select **Pipeline** as the project type and click **OK**.

---

### 3. Configure the Jenkins Job

#### General Settings
- **Description**: (Optional) Add a brief description of the job. Example:  
  _"This job is triggered automatically upon commits to the main branch of the GitHub repository."_

#### Source Code Management (SCM) (Optional)
- If your repository contains a `Jenkinsfile`:
  1. In the **Pipeline** section, select **Pipeline script from SCM**.
  2. Choose **Git** as the SCM.
  3. Enter your repository URL (e.g., `https://github.com/yourusername/your-repository.git`).
  4. Set the **Branch to build** to `main`.

#### Build Triggers
- Under **Build Triggers**, select **GitHub hook trigger for GITScm polling**.  
  This ensures Jenkins listens for webhook events and triggers a build whenever changes are pushed to the `main` branch.

#### Pipeline Configuration
- Define your pipeline in the **Pipeline** section:
  - If using a `Jenkinsfile`, ensure the **Definition** is set to **Pipeline script from SCM** and provide the repository URL and branch.
  - For testing purposes, you can use a simple pipeline script (e.g., echo commands or a sample build process).  
    Refer to the `config.xml` file in this repository for an example configuration.

---

## Testing the Setup

To confirm the setup works:
1. Push a commit to the `main` branch of the repository.
2. Verify that the Jenkins job is triggered automatically.
3. Check the build logs in Jenkins to ensure the pipeline executes as expected.

---

## Troubleshooting instructions

1. Check the 'Recent deliveries' tab under 'Webhooks / Manage webhook' on GitHub for the status 
2. Verify that the Jenkins System Logs
3. Check the build logs in Jenkins to ensure the pipeline executes as expected.

---

## Additional Notes

- Ensure your Jenkins server has appropriate permissions to access the GitHub repository (e.g., a personal access token for private repositories).
- If your Jenkins server is behind a firewall or NAT, consider using tools like [ngrok](https://ngrok.com/) to expose it temporarily for webhook configuration.
