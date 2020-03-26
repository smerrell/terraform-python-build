# Terraform Python Build

This Docker image uses the
[zenika/terraform-azure-cli](https://github.com/Zenika/terraform-azure-cli)
Docker image as a base and adds Python3 and some pip packages to allow for a
Python build script to be used.

## Installed Tools

* Make
* Git
* Python 3.7

### Python Tools

* [gitpython](https://pypi.org/project/GitPython/)
* [python-terraform](https://pypi.org/project/python-terraform/)
