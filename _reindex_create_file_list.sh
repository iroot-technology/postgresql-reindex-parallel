#!/bin/bash
envconf="_reindex_env.sh"
[ -e ${envconf} ] && source ${envconf}
psql -At -h ${_HOST} -U ${_USER} -p ${_PORT} -d ${_DATABASE} -f ${_SQL_INDEX_LIST} >> ${_INDEX_LIST_FILE}
