pipeline {
    agent any
    
    environment {
        // Define Snowflake credentials
        SNOWFLAKE_ACCOUNT = 'on96527.ap-south-1.aws' // Snowflake account value
        SNOWFLAKE_USER = 'technojudge89' // Snowflake user
        SNOWFLAKE_PASSWORD = 'Tata@121' // Snowflake password
        SNOWFLAKE_WAREHOUSE = 'COMPUTE_WH' // Snowflake warehouse
        SNOWFLAKE_ROLE = 'ACCOUNTADMIN' // Snowflake role
        SNOWFLAKE_DATABASE = 'RAW_DATALAKE' // Snowflake database
        
        // Define Git credentials
        GIT_CREDENTIALS_ID = credentials('github_token')
        
        // Define path to schemachange executable directory
        PATH_TO_SCHEMACHANGE = '/var/jenkins_home/.local/bin' // Update this path if necessary
    }
    
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    credentialsId: GIT_CREDENTIALS_ID,
                    url: 'https://github.com/VaibhavSatve/SNOW_DB.git'
            }
        }
        stage('Install schemachange') {
            steps {
                script {
                    sh 'pip3 install schemachange'
                }
            }
        }        
        stage('Deploy to Dev') {
            steps {
                script {
                    // Add the directory containing schemachange to PATH
                    sh "export PATH=${env.PATH_TO_SCHEMACHANGE}:$PATH"

                    // Execute schemachange command
                    sh "schemachange -f \$GITHUB_WORKSPACE/migrations -a \$SNOWFLAKE_ACCOUNT -u \$SNOWFLAKE_USER -r \$SNOWFLAKE_ROLE -w \$SNOWFLAKE_WAREHOUSE -d \$SNOWFLAKE_DATABASE -c \$SNOWFLAKE_DATABASE.SCHEMACHANGE.CHANGE_HISTORY --create-change-history-table"
                }
            }
        }
    }
}
