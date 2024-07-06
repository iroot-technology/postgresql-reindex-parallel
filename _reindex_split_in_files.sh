#!/bin/bash
envconf="_reindex_env.sh"
[ -e ${envconf} ] && source ${envconf}
table_file="-"
reindex_cmd='REINDEX (VERBOSE) INDEX CONCURRENTLY '
rm -fr ${_DIR_TEMP} 
mkdir -p ${_DIR_TEMP}
for va in `cat ${_INDEX_LIST_FILE}`; do
  table=`echo $va | cut -d '|' -f 1`
  index=`echo $va | cut -d '|' -f 2`
  if [ "${table_file}" != "${table}" ]; then
    echo "${reindex_cmd} ${index} ;" > ${_DIR_TEMP}/${table}.table
  else
    echo "${reindex_cmd} ${index} ;" >> ${_DIR_TEMP}/${table}.table
  fi
  table_file=${table}
done
