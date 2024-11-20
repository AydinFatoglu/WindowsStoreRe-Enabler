# WindowsStoreRe-Enabler

This repository contains scripts to manage AppLocker policies and provision essential Windows Store applications. The solution is divided into two scripts: a PowerShell script for managing AppLocker and a batch script for provisioning applications.

## Features

- **PowerShell Script**:
  - Clears existing AppLocker policies.
  - Creates `clear.xml` in the same directory as the script for policy management.
  - Stops and configures AppLocker services.

## Prerequisites

- **Administrator Privileges**: Both scripts require administrative privileges to execute.
- **PowerShell Version**: Ensure PowerShell 5.1 or later is installed.
- **Windows Version**: The batch script is designed for Windows 10 version 1709 and later.
