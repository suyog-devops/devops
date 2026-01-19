# Sample Project for Trivy Vulnerability Scanning

This is a simple Flask project with intentionally outdated Python dependencies
to help you practice CVE scanning using Trivy in GitHub Actions.

## Use Cases
- Trivy filesystem scan (`scan-type: fs`)
- Trivy Docker image scan (`image-ref`)
- Producing CI/CD security reports

## Run Locally
```
pip install -r app/requirements.txt
python app/app.py
```
