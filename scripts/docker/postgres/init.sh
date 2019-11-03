#!/bin/bash

# Install Multicorn
echo "~~~~~~~~~~~~~ Installing multicorn"
cd ~
if [ ! -d "/Multicorn" ]; then
  git clone git://github.com/Kozea/Multicorn.git
fi
cd Multicorn
git checkout tags/v1.3.4
make && make install

# Install neo4j fdw
echo "~~~~~~~~~~~~~ Installing Neo4j FDW"
cd /neo4j-fdw/source/
make install

echo "~~~~~~~~~~~~~ Setting default interval style"
psql -v ON_ERROR_STOP=1 -U $POSTGRES_USER -d $POSTGRES_DB  -c "alter database test SET intervalstyle = 'postgres_verbose';"
