# docker-python-oracle
__docker-python-oracle__ provides a reference for connecting to an Oracle database with Python/Pandas using Docker. Docker is used to avoid local dependencies on mandatory Oracle drivers.

## Usage
* Rename `.env.example` to `.env` and set the required environment variables.
* Build image: ```docker-compose build```
* Run `/scripts/run.py`:
    * PowerShell/Ubuntu: `docker run -v ${PWD}:/app python-oracle script/run.py`
    * Windows Command Line (cmd): `docker run -v %cd%:/app python-oracle script/run.py`

## Remarks
The directory `oracle-instantclient` contains zip files with the Oracle drivers. These drivers can also be downloaded from the [Oracle website](https://www.oracle.com/database/technologies/instant-client/linux-x86-64-downloads.html).
