# Simple Flask App with Jenkins Pipeline

This repository contains a simple Flask application with an automated Jenkins pipeline for building, testing, and deploying the app.

## Prerequisites

Before running the Jenkins pipeline, ensure you have the following prerequisites:

- **Jenkins**: Ensure you have a Jenkins instance set up.
- **Python**: The pipeline uses Python 3.x and `pip` for installing dependencies.
- **Flask**: A simple Flask app is used for this project.
- **pytest**: The project includes tests that use `pytest` for verification.
- **Git**: Jenkins will need Git installed to clone the repository.
- **Firewall Considerations**: If Jenkins or GitHub is behind a firewall, ensure that traffic is allowed to and from the necessary servers.
- **Sample App**: The sample app used in this exercise is stored in the repository:  
  `https://github.com/suyog-devops/simple-flask-app.git`
- Ensure that Jenkins has access to this repository and the necessary environment for running Python and Flask.
- Refer config.xml for sample jenkins job 


### Jenkins Pipeline Overview

The repository includes a Jenkins pipeline (`Jenkinsfile`) that automates the following steps:

1. **Checkout** - Pulls the code from the GitHub repository.
2. **Install Dependencies** - Sets up a Python virtual environment and installs necessary dependencies from `requirements.txt`.
3. **Run App** - Starts the Flask app in the background and checks if it's running correctly.
4. **Run Tests** - Runs unit tests using `pytest` to ensure the app functions as expected.
5. **Cleanup** - Deactivates the virtual environment and performs any necessary cleanup.

#### Pipeline Stages

- **Build**: 
    - Clones the repository and lists the contents.
  
- **Install Dependencies**: 
    - Creates and activates a Python virtual environment.
    - Installs all required packages from `requirements.txt`.
  
- **Run App**: 
    - Starts the Flask app using `nohup` so it runs in the background.
    - Verifies if the app is running by making a test HTTP request to `http://127.0.0.1:5000`.

- **Run Tests**: 
    - Runs unit tests using `pytest` to ensure the app is functioning correctly.
  
- **Cleanup**: 
    - Deactivates the virtual environment.
