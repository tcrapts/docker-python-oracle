# docker-python-oracledb
__docker-python-oracledb__ provides a reference for connecting to an Oracle database with Python/Pandas using Docker. Docker is used to avoid local dependencies on mandatory Oracle drivers.

## Usage
* Rename `.env.example` to `.env` and set the required environment variables.
* Build image: ```docker-compose build```
* Run `/scripts/run.py`: ```docker run python-mssql python run.py```
