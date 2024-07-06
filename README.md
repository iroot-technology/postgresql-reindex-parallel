#  README Generator   [![License: GNU GPLv3](https://www.gnu.org/graphics/gnu-post/GPLv3-stamp.svg)](https://www.gnu.org/licenses/gpl-3.0.en.html)

  ##  Description

***

  This project was created in order to easily execute reindex indexes for PostgreSQL administrators when need run n process concurrently for distinct indexes in parallel.
  
  ***v2.0** This project was recently converted to TypeScript with small additional features.*
  
  ## Table Of Contents  

***
  * [Description](#Description)
  * [Table Of Contents](#table-of-contents)
  * [Installation](#Installation)
  * [Usage Instructions](#usage-instructions)
  * [License](#License)
  
  ##  Installation

***

  ### Clone the repository: 
    git clone https://github.com/FaeroDev/readme-generator.git  
      
  
  ##  Usage instructions  

***
ajust _reindex_env.sh to set a database env connection
execute _reindex_create_file_list.sh to create a index list
execute _reindex_split_in_files.sh to split index list to any files separated
ajust _reindex_run_in_parallel.sh for quantity of process in parallel and execute that

    
  ##  License

  ***
  This project is covered under the [![License: GNU GPLv3](https://www.gnu.org/graphics/gnu-post/GPLv3-stamp.svg)]([https://opensource.org/licenses/MIT](https://www.gnu.org/licenses/gpl-3.0.en.html)) license.  
    
  See attached [LICENSE](./LICENSE) file for details.  
    

  Email:  emanuel@iroot.com.br
