# NEXT Sentinel

An all-powerful toolset for NEXT Masternodes.

[![Build Status](https://travis-ci.org/next/sentinel.svg?branch=master)](https://travis-ci.org/next/sentinel)

Sentinel is an autonomous agent for persisting, processing and automating NEXT governance objects and tasks.

Sentinel is implemented as a Python application that binds to a local version of nextd instance on each Masternode.

This guide covers installing Sentinel onto an existing Masternode in Ubuntu 14.04 / 16.04.

## Installation

### 1. Install Prerequisites

Make sure Python version 2.7.x or above is installed:

    python --version

Update system packages and ensure virtualenv is installed:

    $ sudo apt-get update
    $ sudo apt-get -y install python-virtualenv

Make sure the local Next daemon running is at least version 3.0

    $ next-cli getinfo | grep version

### 2. Install Sentinel

Clone the Sentinel repo and install Python dependencies.

    $ git clone https://github.com/next/sentinel.git && cd sentinel
    $ virtualenv ./venv
    $ ./venv/bin/pip install -r requirements.txt

### 3. Set up Cron

Set up a crontab entry to call Sentinel every minute:

    $ crontab -e

In the crontab editor, add the lines below, replacing '/home/YOURUSERNAME/sentinel' to the path where you cloned sentinel to:

    */2 * * * * cd /home/YOURUSERNAME/sentinel && ./venv/bin/python bin/sentinel.py >/dev/null 2>&1

### 4. Test the Configuration

Test the config by runnings all tests from the sentinel folder you cloned into

    $ ./venv/bin/py.test ./test

With all tests passing and crontab setup, Sentinel will stay in sync with nextd and the installation is complete. 
Please note that mainnet is not still not launched. You will get 1 failed notice.

## Configuration

An alternative (non-default) path to the `nextcoin.conf` file can be specified in `sentinel.conf`:

    next_conf=/path/to/nextcoin.conf

## Troubleshooting

To view debug output, set the `SENTINEL_DEBUG` environment variable to anything non-zero, then run the script manually:

    $ SENTINEL_DEBUG=1 ./venv/bin/python bin/sentinel.py

### License

Released under the MIT license. See [LICENSE](LICENSE) for more info.
