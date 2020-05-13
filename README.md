# docker-python-oracle
__docker-python-oracle__ provides a reference for connecting to an Oracle database with Python/Pandas using Docker. Docker is used to avoid local dependencies on required Oracle drivers.

## Usage
* Rename `.env.example` to `.env` and set the required environment variables.
* Rename `query/query.sql.example` to `query/query.sql` and enter a valid query.
* Build image: ```docker build -t python-oracle .```
* Run `query/query.sql`:
    * PowerShell/Ubuntu: `docker run --env-file=.env -v ${PWD}:/script python-oracle run.py query/query.sql`
    * Windows Command Line (cmd): `docker run --env-file=.env  -v %cd%:/script python-oracle query/query.sql`

## Remarks
The directory `oracle-instantclient` contains zip files with the Oracle drivers. These drivers can also be downloaded from the [Oracle website](https://www.oracle.com/database/technologies/instant-client/linux-x86-64-downloads.html).
