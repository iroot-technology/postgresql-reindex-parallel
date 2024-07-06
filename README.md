# PostgreSQL Reindex in parallel, bash-script
  
  ##  Description

  This project was created in order to easily execute reindex indexes for PostgreSQL administrators when need run n process concurrently for distinct indexes in parallel.
  
  ##  Installation

  ### Clone the repository: 
    git clone https://github.com/iroot-technology/postgresql-reindex-parallel.git
      
  ##  Usage instructions  
    ajust _reindex_env.sh to set a database env connection
    execute _reindex_create_file_list.sh to create a index list
    execute _reindex_split_in_files.sh to split index list to any files separated
    ajust _reindex_run_in_parallel.sh for quantity of process in parallel and execute that
    
  ##  License: GNU GPLv3 [![License: GNU GPLv3](https://github.com/iroot-technology/postgresql-reindex-parallel/assets/52215486/b7061021-1a70-4a54-b693-5df75263b3fb)](https://www.gnu.org/licenses/gpl-3.0.en.html)

  This project is covered under the [GNU GPLv3](https://www.gnu.org/licenses/gpl-3.0.en.html) license.  
    
  See attached [LICENSE](./LICENSE) file for details.  
    

  Email:  emanuel@iroot.com.br
