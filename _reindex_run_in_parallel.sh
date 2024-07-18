#!/bin/bash
envconf="_reindex_env.sh"
[ -e ${envconf} ] && source ${envconf}
find ./${_DIR_TEMP} -type f -name '*.table' | xargs -P ${_NPROCESS} -I % psql -h ${_HOST} -U ${_USER} -p ${_PORT} -d ${_DATABASE} -f "%" | tee -a ./_reindex.log
